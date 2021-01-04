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

namespace Cafe_Management3
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
       public MainWindow()
        {
            InitializeComponent();
        }

        private void MainWindow2_Closed(object sender, EventArgs e)
        {
            OrderWindow main = (OrderWindow)Application.Current.MainWindow;
            main.load_listFood("");
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Baocaodoanhthu bc = new Baocaodoanhthu();
            bc.ShowDialog();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Baocaoctdoanhthu bc = new Baocaoctdoanhthu();
            bc.ShowDialog();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            Window1 chartColumn = new Window1();
            chartColumn.Show();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            KindStaffWindow a = new KindStaffWindow();
            a.Show();
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            StaffWindow a = new StaffWindow();
            a.Show();
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            ConvertUnit u = new ConvertUnit();
            u.Show();
        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            Supplier su = new Supplier();
            su.Show();
        }

        private void Button_Click_7(object sender, RoutedEventArgs e)
        {
            ImportSite im = new ImportSite();
            im.Show();
        }

        private void Button_Click_8(object sender, RoutedEventArgs e)
        {
            ExxportSite ex = new ExxportSite();
            ex.Show();
        }
    }
}
