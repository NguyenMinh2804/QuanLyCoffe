using Cafe_Management3.Model;
using Cafe_Management3.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Interaction logic for KindSustenanceWindow.xaml
    /// </summary>
    public partial class Acc : Window
    {
        string ma;
        DataTable table = new DataTable();
        public Acc()
        {
            InitializeComponent();
        }

        private void them_Click(object sender, RoutedEventArgs e)
        {
            if (mkc.Password.ToString() != Class1.mk)
            {
                MessageBox.Show("Mật khẩu không chính xác");
                return;
            }
            if (mk.Password.ToString()  == "")
            {
                MessageBox.Show("Chưa nhập mật khẩu");
                return;
            }
            if (mkl.Password.ToString() == "")
            {
                MessageBox.Show("Chưa nhập mật khẩu lặp lại");
                return;
            }
            if (mk.Password.ToString() != mkl.Password.ToString())
            {
                MessageBox.Show("Mật khẩu lặp lại không chính xác");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                Login log = new Login();
                string query = string.Format("update account set password = Rtrim('{0}') where rtrim(tai_khoan) = Rtrim('{1}')", mk.Password.ToString(), Class1.tk);
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
                MessageBox.Show("Đổi mật khẩu thành công");
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.Name != "loginWindow")
                    {
                        window.Close();
                    }
                }
                log.Show();
            }


        }
    }
}
