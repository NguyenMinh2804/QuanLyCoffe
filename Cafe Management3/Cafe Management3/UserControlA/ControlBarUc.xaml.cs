using Cafe_Management3.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Cafe_Management3.UserControlA
{
    /// <summary>
    /// Interaction logic for ControlBarUc.xaml
    /// </summary>
    public partial class ControlBarUc : UserControl
    {
        public ControlBarViewModel Viewmodel { get; set; }
        public ControlBarUc()
        {
            InitializeComponent();
            this.DataContext = Viewmodel = new ControlBarViewModel();
        }
    }
}
