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
    public partial class PhanQuyen : Window
    {
       public PhanQuyen()
        {
            InitializeComponent();
        }

        private void MainWindow2_Closed(object sender, EventArgs e)
        {
           
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
    
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
      
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
     
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
   ;
        }

        private void Button_Click_7(object sender, RoutedEventArgs e)
        {
    
        }

        private void Button_Click_8(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_9(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_10(object sender, RoutedEventArgs e)
        {
   
        }

        private void Button_Click_11(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click_12(object sender, RoutedEventArgs e)
        {

        }

        private void MainWindow2_Loaded(object sender, RoutedEventArgs e)
        {
            //if (Class1.MyProperty !=1)
            //{
            //    x.IsEnabled = false;
            //    y.IsEnabled = false;
            //}    
            DataTable dt = new DataTable();
            var context = new quanLyCafeEntities();
            string query = String.Format("Select * from account order by tai_khoan");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(dt);
            }
            tk.ItemsSource = dt.DefaultView;
            tk.DisplayMemberPath = dt.Columns["tai_khoan"].ToString();
            tk.SelectedValuePath = dt.Columns["tai_khoan"].ToString();
        }

        private void Button_Click_13(object sender, RoutedEventArgs e)
        {
            if(tk.SelectedIndex == -1)
            {
                MessageBox.Show("Chưa chọn tài khoản");
                return;
            }    
            var displayList = DataPovider.Ins.DB.phan_quyen.Where(x => x.tai_khoan == tk.Text);
            if (displayList.Count() == 0)
            {
                using (var ctx = new quanLyCafeEntities())
                {
                    string query = string.Format("insert into phan_quyen values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}')", tk.SelectedValue, c1.IsChecked, c2.IsChecked, c3.IsChecked, c4.IsChecked, c5.IsChecked, c6.IsChecked, c7.IsChecked, c8.IsChecked, c9.IsChecked, c10.IsChecked, c11.IsChecked, c12.IsChecked, c13.IsChecked, c14.IsChecked, c15.IsChecked, c16.IsChecked);
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
                }
            }
            else
            {
                using (var ctx = new quanLyCafeEntities())
                {
                    string query = string.Format("update  phan_quyen set id1='{1}',id2='{2}',id3='{3}',id4='{4}',id5='{5}',id6='{6}',id7='{7}',id8='{8}',id9='{9}',id10='{10}',id11='{11}',id12='{12}',id13='{13}',id14='{14}',id15='{15}',id16='{16}' where tai_khoan = '{0}'", tk.SelectedValue, c1.IsChecked, c2.IsChecked, c3.IsChecked, c4.IsChecked, c5.IsChecked, c6.IsChecked, c7.IsChecked, c8.IsChecked, c9.IsChecked, c10.IsChecked, c11.IsChecked, c12.IsChecked, c13.IsChecked, c14.IsChecked, c15.IsChecked, c16.IsChecked);
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
                }

            }
        }

        private void tk_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            c1.IsChecked = false;
            c2.IsChecked = false;
            c3.IsChecked = false;
            c4.IsChecked = false;
            c5.IsChecked = false;
            c6.IsChecked = false;
            c7.IsChecked = false;
            c8.IsChecked = false;
            c9.IsChecked = false;
            c10.IsChecked = false;
            c11.IsChecked = false;
            c12.IsChecked = false;
            c13.IsChecked = false;
            c14.IsChecked = false;
            c15.IsChecked = false;
            c16.IsChecked = false;
            DataTable dt = new DataTable();
            var context = new quanLyCafeEntities();
            string query = String.Format("Select * from phan_quyen where rtrim(tai_khoan) = rtrim('{0}')", tk.SelectedValue);
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(dt);
            }
            foreach (DataRow dr in dt.Rows)
            {
                c1.IsChecked = bool.Parse(dr["id1"].ToString());
                c2.IsChecked = bool.Parse(dr["id2"].ToString());
                c3.IsChecked = bool.Parse(dr["id3"].ToString());
                c4.IsChecked = bool.Parse(dr["id4"].ToString());
                c5.IsChecked = bool.Parse(dr["id5"].ToString());
                c6.IsChecked = bool.Parse(dr["id6"].ToString());
                c7.IsChecked = bool.Parse(dr["id7"].ToString());
                c8.IsChecked = bool.Parse(dr["id8"].ToString());
                c9.IsChecked = bool.Parse(dr["id9"].ToString());
                c10.IsChecked = bool.Parse(dr["id10"].ToString());
                c11.IsChecked = bool.Parse(dr["id11"].ToString());
                c12.IsChecked = bool.Parse(dr["id12"].ToString());
                c13.IsChecked = bool.Parse(dr["id13"].ToString());
                c14.IsChecked = bool.Parse(dr["id14"].ToString());
                c15.IsChecked = bool.Parse(dr["id15"].ToString());
                c16.IsChecked = bool.Parse(dr["id16"].ToString());
            }

        }
    }
}
