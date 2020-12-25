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
    public class LoaiMonViewModel : BaseViewModel
    {
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }


        private ObservableCollection<loai_mon> _List;
        public ObservableCollection<loai_mon> List { get => _List; set { _List = value; OnPropertyChanged(); } }
        private loai_mon _SelectedItem;
        public loai_mon SelectedItem
        {
            get => _SelectedItem;
            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    ma_loaiMon = SelectedItem.ma_loaiMon;
                    ten_loaiMon = SelectedItem.ten_loaiMon;
                }
            }
        }
        private string _ma_loaiMon;
        public string ma_loaiMon { get => _ma_loaiMon; set { _ma_loaiMon = value; OnPropertyChanged(); } }
        private string _ten_loaiMon;
        public string ten_loaiMon { get => _ten_loaiMon; set { _ten_loaiMon = value; OnPropertyChanged(); } }
        public LoaiMonViewModel()
        {
            List = new ObservableCollection<loai_mon>(DataPovider.Ins.DB.loai_mon);
            AddCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(ma_loaiMon) || string.IsNullOrEmpty(ten_loaiMon))
                    return false;

                var displayList = DataPovider.Ins.DB.loai_mon.Where(x => x.ma_loaiMon == ma_loaiMon);
                if (displayList == null || displayList.Count() != 0)
                    return false;
                return true;

            }, (p) =>
            {
                var loai_Mon = new loai_mon() { ma_loaiMon = ma_loaiMon, ten_loaiMon = ten_loaiMon };
                DataPovider.Ins.DB.loai_mon.Add(loai_Mon);
                DataPovider.Ins.DB.SaveChanges();
                List.Add(loai_Mon);
            });
            EditCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(ma_loaiMon) || string.IsNullOrEmpty(ten_loaiMon) || SelectedItem == null)
                    return false;

                var displayList = DataPovider.Ins.DB.loai_mon.Where(x => (x.ma_loaiMon == ma_loaiMon) && ( x.ma_loaiMon != SelectedItem.ma_loaiMon));

                if (displayList == null || displayList.Count() != 0)
                    return false;

                return true;

            }, (p) =>
            {
                var loai_Mon = DataPovider.Ins.DB.loai_mon.Where(x => x.ma_loaiMon == SelectedItem.ma_loaiMon).SingleOrDefault();
                loai_Mon.ma_loaiMon = ma_loaiMon;
                loai_Mon.ten_loaiMon = ten_loaiMon;
                DataPovider.Ins.DB.SaveChanges();
                List = new ObservableCollection<loai_mon>(DataPovider.Ins.DB.loai_mon);
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
                    var unit = DataPovider.Ins.DB.loai_mon.Where(x => x.ma_loaiMon == SelectedItem.ma_loaiMon).SingleOrDefault();
                    using (var ctx = new quanLyCafeEntities())
                    {
                        int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete from loai_mon where ma_loaiMon = {0}", unit.ma_loaiMon);
                    }
                    List = new ObservableCollection<loai_mon>(DataPovider.Ins.DB.loai_mon);
                }
                else
                {
                }
            });
        }

    }
}
