using Cafe_Management3.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Cafe_Management3.ViewModel
{
    public class MonViewModel : BaseViewModel
    {
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }


        private ObservableCollection<vmon> _List;
        public ObservableCollection<vmon> List { get => _List; set { _List = value; OnPropertyChanged(); } }
        private ObservableCollection<loai_mon> _loai_mon;
        public ObservableCollection<loai_mon> loai_mon { get => _loai_mon; set { _loai_mon = value; OnPropertyChanged(); } }
        private Model.vmon _SelectedItem;
        public Model.vmon SelectedItem
        {
            get => _SelectedItem;
            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    SelectedLoaiMon = SelectedItem.Loai_Mon;
                    ten_mon = SelectedItem.ten_mon;
                    ma_mon = SelectedItem.ma_mon;
                    gia = (decimal)SelectedItem.gia;
                }
            }
        }
        private Model.loai_mon _SelectedLoaiMon;
        public Model.loai_mon SelectedLoaiMon
        {
            get => _SelectedLoaiMon;
            set
            {
                _SelectedLoaiMon = value;
                OnPropertyChanged();
            }
        }

        private string _ma_mon;
        public string ma_mon { get => _ma_mon; set { _ma_mon = value; OnPropertyChanged(); } }
        private string _ten_mon;
        public string ten_mon { get => _ten_mon; set { _ten_mon = value; OnPropertyChanged(); } }
        private decimal _gia;
        public decimal gia { get => _gia; set { _gia = value; OnPropertyChanged(); } }
        private string _ten_loaiMon;
        public string ten_loaiMon { get => _ten_loaiMon; set { _ten_loaiMon = value; OnPropertyChanged(); } }

        public MonViewModel()
        {
            List = new ObservableCollection<vmon>(DataPovider.Ins.DB.vmon);
            loai_mon = new ObservableCollection<loai_mon>(DataPovider.Ins.DB.loai_mon);
            AddCommand = new RelayCommand<object>((p) =>
            {
                //if (string.IsNullOrEmpty(ma_mon) || string.IsNullOrEmpty(ten_mon) || string.IsNullOrEmpty(ma_loaiMon))
                //    return false;

                //var displayList = DataPovider.Ins.DB.mon.Where(x => x.ma_mon == ma_mon);
                //if (displayList == null || displayList.Count() != 0)
                //    return false;
                return true;

            }, (p) =>
            {
                var loai_Mon = new mon() {ma_mon = ma_mon, ten_mon = ten_mon, gia = gia, ma_loaiMon = SelectedLoaiMon.ma_loaiMon};
                DataPovider.Ins.DB.mon.Add(loai_Mon);
                DataPovider.Ins.DB.SaveChanges();
                List = new ObservableCollection<vmon>(DataPovider.Ins.DB.vmon);
            });
            EditCommand = new RelayCommand<object>((p) =>
            {
                //if (string.IsNullOrEmpty(ma_mon) || string.IsNullOrEmpty(ten_mon) || string.IsNullOrEmpty(ma_loaiMon) | SelectedItem == null)
                //    return false;

                //var displayList = DataPovider.Ins.DB.mon.Where(x => (x.ma_mon == ma_mon) && (x.ma_mon != SelectedItem.ma_mon));

                //if (displayList == null || displayList.Count() != 0)
                //    return false;

                return true;

            }, (p) =>
            {
                var loai_Mon = DataPovider.Ins.DB.mon.Where(x => x.ma_mon == SelectedItem.ma_mon).SingleOrDefault();
                loai_Mon.ma_mon = ma_mon;
                loai_Mon.ten_mon = ten_mon;
                loai_Mon.gia = gia;
                loai_Mon.ma_loaiMon = SelectedLoaiMon.ma_loaiMon;
                DataPovider.Ins.DB.SaveChanges();
                List = new ObservableCollection<vmon>(DataPovider.Ins.DB.vmon);
            });
            DeleteCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedItem == null)
                    return false;
                return true;

            }, (p) =>
            {
                MessageBoxResult result = MessageBox.Show("Bạn có chắc chắc xóa dòng được chọn",
                                          "Confirmation",
                                          MessageBoxButton.YesNo,
                                          MessageBoxImage.Question);
                if (result == MessageBoxResult.Yes)
                {
                    var unit = DataPovider.Ins.DB.mon.Where(x => x.ma_mon == SelectedItem.ma_mon).SingleOrDefault();
                    using (var ctx = new quanLyCafeEntities())
                    {
                        int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete from mon where ma_mon = {0}", unit.ma_mon);
                    }
                    List = new ObservableCollection<vmon>(DataPovider.Ins.DB.vmon);
                }
                else
                {   
                }
            });
        }


    }
}
