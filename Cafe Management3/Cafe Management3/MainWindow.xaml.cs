using Cafe_Management3.Model;
using Cafe_Management3.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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

        private void Button_Click_9(object sender, RoutedEventArgs e)
        {
            ImportSiteeReport irp = new ImportSiteeReport();
            irp.Show();
        }

        private void Button_Click_10(object sender, RoutedEventArgs e)
        {
            ExportSiteeReport irp = new ExportSiteeReport();
            irp.Show();
        }

        private void Button_Click_11(object sender, RoutedEventArgs e)
        {
            ReportSite reportSite = new ReportSite();
            reportSite.Show();
        }

        private void Button_Click_12(object sender, RoutedEventArgs e)
        {

        }

        private void MainWindow2_Loaded(object sender, RoutedEventArgs e)
        {
            c1a.IsEnabled =false;
            c2a.IsEnabled = false;
            c3a.IsEnabled = false;
            c4.IsEnabled = false;
            c5.IsEnabled = false;
            c6.IsEnabled = false;
            c7.IsEnabled = false;
            c8.IsEnabled = false;
            c9.IsEnabled = false;
            c10.IsEnabled = false;
            c11.IsEnabled = false;
            c12.IsEnabled = false;
            c13.IsEnabled = false;
            c14.IsEnabled = false;
            c15.IsEnabled = false;
            c16.IsEnabled = false;
            if (Class1.MyProperty !=1)
            {
                x.IsEnabled = false;
                y.IsEnabled = false;
            }
            DataTable dt = new DataTable();
            var context = new quanLyCafeEntities();
            string query = String.Format("Select * from phan_quyen where rtrim(tai_khoan) = rtrim('{0}')",Class1.tk);
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(dt);
            }
 
            foreach (DataRow dr in dt.Rows)
            {
                c1a.IsEnabled  = bool.Parse(dr["id1"].ToString());
                c2a.IsEnabled = bool.Parse(dr["id2"].ToString());
                c3a.IsEnabled = bool.Parse(dr["id3"].ToString());
                c4.IsEnabled = bool.Parse(dr["id4"].ToString());
                c5.IsEnabled = bool.Parse(dr["id5"].ToString());
                c6.IsEnabled = bool.Parse(dr["id6"].ToString());
                c7.IsEnabled = bool.Parse(dr["id7"].ToString());
                c8.IsEnabled = bool.Parse(dr["id8"].ToString());
                c9.IsEnabled = bool.Parse(dr["id9"].ToString());
                c10.IsEnabled = bool.Parse(dr["id10"].ToString());
                c11.IsEnabled = bool.Parse(dr["id11"].ToString());
                c12.IsEnabled = bool.Parse(dr["id12"].ToString());
                c13.IsEnabled = bool.Parse(dr["id13"].ToString());
                c14.IsEnabled = bool.Parse(dr["id14"].ToString());
                c15.IsEnabled = bool.Parse(dr["id15"].ToString());
                c16.IsEnabled = bool.Parse(dr["id16"].ToString());
            }
        }

        private void y_Click(object sender, RoutedEventArgs e)
        {
            PhanQuyen a = new PhanQuyen();
            a.Show();
        }
    }
}
