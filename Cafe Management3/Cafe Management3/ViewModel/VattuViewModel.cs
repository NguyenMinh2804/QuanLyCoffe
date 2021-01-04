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
    class VattuViewModel:BaseViewModel
    {
        public ICommand AddCommand { get; set; }

        private ObservableCollection<vat_tu> _vat_tu;
        public ObservableCollection<vat_tu> vat_tu { get => _vat_tu; set { _vat_tu = value; } }
        private string _ma_vt;
        public string ma_vt { get => _ma_vt; set { _ma_vt = value; OnPropertyChanged(); } }
        private string _ten_vt;
        public string ten_vt { get => _ten_vt; set { _ten_vt = value; OnPropertyChanged(); } }
        public VattuViewModel()
        {
            vat_tu = new ObservableCollection<vat_tu>(DataPovider.Ins.DB.vat_tu);
            AddCommand = new RelayCommand<object>((p) =>
            {
                return true;

            }, (p) =>
            {
                MessageBox.Show("a");
            });
        }
    }
}
