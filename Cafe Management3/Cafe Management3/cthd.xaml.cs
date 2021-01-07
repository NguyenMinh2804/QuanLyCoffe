using Cafe_Management3.Model;
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
using System.Windows.Shapes;

namespace Cafe_Management3
{
    /// <summary>
    /// Interaction logic for cthd.xaml
    /// </summary>
    public partial class cthd : Window
    {
        string ma_hd;
        int index;
        public cthd(string a, int i)
        {
            InitializeComponent();
            lable.Content = a;
            ma_hd = a;
            index = i; 
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("select a.ma_mon as N'Mã món', b.ten_mon as N'Tên món', a.so_luong as N'Số lượng' from chi_tiet_hoa_don a left join mon b on a.ma_mon = b.ma_mon where ma_hoadon = '{0}'",ma_hd);
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            dtcthd.DataContext = table.DefaultView;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var dialogResult = MessageBox.Show("Xác nhận hoàn thành", "", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (dialogResult == MessageBoxResult.Yes)
            {
                using (var ctx = new quanLyCafeEntities())
                {
                    string quey = string.Format("update hoa_don set status = 1 where ma_hoadon = '{0}'", ma_hd);
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(quey);
                    this.Close();
                    //OrderWindow main = (OrderWindow)Application.Current.MainWindow;
                    //main.load_hd();
                }

            }
            else
            {
                return;
            }    
                
        }
    }
}
