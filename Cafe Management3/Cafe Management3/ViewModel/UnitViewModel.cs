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
    public class UnitViewModel:BaseViewModel
    {
        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }


        private ObservableCollection<dvt> _List;
        public ObservableCollection<dvt> List { get => _List; set { _List = value; OnPropertyChanged(); } }
        private dvt _SelectedItem;
        public dvt SelectedItem
        {
            get => _SelectedItem;
            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    ma_dvt = SelectedItem.ma_dvt;
                    ten_dvt = SelectedItem.ten_dvt;
                }
            }
        }
        private string _ma_dvt;
        public string ma_dvt { get => _ma_dvt; set { _ma_dvt = value; OnPropertyChanged(); } }
        private string _ten_dvt;
        public string ten_dvt { get => _ten_dvt; set { _ten_dvt = value; OnPropertyChanged(); } }
        public UnitViewModel()
        {
            List = new ObservableCollection<dvt>(DataPovider.Ins.DB.dvt);
            AddCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(ma_dvt))
                    return false;

                var displayList = DataPovider.Ins.DB.dvt.Where(x => x.ma_dvt == ma_dvt);
                if (displayList == null || displayList.Count() != 0)
                    return false;
                return true;

            }, (p) =>
            {
                var unit = new dvt() { ma_dvt = ma_dvt, ten_dvt=ten_dvt };
                DataPovider.Ins.DB.dvt.Add(unit);
                DataPovider.Ins.DB.SaveChanges();
                List.Add(unit);
            });            
            EditCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(ma_dvt) || SelectedItem == null)
                    return false;

                var displayList = DataPovider.Ins.DB.dvt.Where(x => (x.ma_dvt == ma_dvt) && (x.ma_dvt != SelectedItem.ma_dvt));

                if (displayList == null || displayList.Count() != 0)
                    return false;

                return true;

            }, (p) =>
            {
                var unit = DataPovider.Ins.DB.dvt.Where(x => x.ma_dvt == SelectedItem.ma_dvt).SingleOrDefault();
                unit.ma_dvt = ma_dvt;
                unit.ten_dvt = ten_dvt;
                DataPovider.Ins.DB.SaveChanges();
                List = new ObservableCollection<dvt>(DataPovider.Ins.DB.dvt);
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
                    var unit = DataPovider.Ins.DB.dvt.Where(x => x.ma_dvt == SelectedItem.ma_dvt).SingleOrDefault();
                    using (var ctx = new quanLyCafeEntities())
                    {
                        int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete from dvt where ma_dvt = {0}", unit.ma_dvt);
                    }
                    List = new ObservableCollection<dvt>(DataPovider.Ins.DB.dvt);
                }
                else
                {
                }    
            });
        }

    }
}
