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
using System.Windows.Shapes;

namespace Cafe_Management3
{
    /// <summary>
    /// Interaction logic for Lpgin.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var accCount = DataPovider.Ins.DB.Account.Where(x => x.tai_khoan == tk.Text && x.password == mk.Password.ToString()).Count();
          
            if (accCount > 0)
            {
                int a = 10;
                DataTable dt = new DataTable();
                var context = new quanLyCafeEntities();
                string query = String.Format("Select * from account where tai_khoan = rtrim('{0}')",tk.Text);
                SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
                using (var da = new SqlDataAdapter(query, connection))
                {
                    da.Fill(dt);
                }
                foreach (DataRow dr in dt.Rows)
                {
                    a = Int32.Parse((dr["loai_tk"].ToString()));
                }
                Class1.MyProperty = a;
                Class1.tk = tk.Text;
                Class1.mk = mk.Password.ToString();
                OrderWindow or = new OrderWindow();
                or.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Sai tài khoản hoặc mật khẩu!");
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
