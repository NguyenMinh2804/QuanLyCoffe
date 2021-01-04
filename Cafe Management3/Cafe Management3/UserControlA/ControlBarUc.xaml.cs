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
        private void list_box_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            MainWindow mw = new MainWindow();
            OrderWindow or = new OrderWindow(); 
            Login log = new Login();
            if (list_box.SelectedIndex == 0 )
            {
                if (mw.IsActive == false)
                {
                    mw.Show();
                }
            }
            if (list_box.SelectedIndex == 1)
            {
               mw.Show();

            }
            if (list_box.SelectedIndex == 2)
            {
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.Name != "loginWindow")
                    {
                        window.Hide();
                    }
                }
                log.Show();
            }
            list_box.SelectedIndex = -1;
        }

        private void ucControlBar_Loaded(object sender, RoutedEventArgs e)
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.Name == "window" || window.Name == "MainWindow2")
                {
                    list_box.Visibility = Visibility.Collapsed;
                }
            }
        }
    }
}
