using Cafe_Management3.Model;
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
    public partial class AccountWindow : Window
    {
        string ma;
        DataTable table = new DataTable();
        public AccountWindow()
        {
            InitializeComponent();
        }

        private void hoa_don_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            sua.IsEnabled = true;
            xoa.IsEnabled = true;
            int a = hoa_don.SelectedIndex;
            if (a != -1)
            {
                ma = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                tk.Text = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                loaitk.Text = (((hoa_don.Columns[3].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                ten.Text = (((hoa_don.Columns[2].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
            }
        }

        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            DataTable dt = new DataTable();
            DataColumn dc = new DataColumn("id", typeof(String));
            dt.Columns.Add(dc);
            dc = new DataColumn("ten", typeof(String));
            dt.Columns.Add(dc);
            dt.Rows.Add(new Object[]{
                0,
                "Nhân viên",
           });
            dt.Rows.Add(new Object[]{
                1,
                "Quản lý",
           });
            loaitk.ItemsSource = dt.DefaultView;
            loaitk.DisplayMemberPath = dt.Columns["ten"].ToString();
            loaitk.SelectedValuePath = dt.Columns["id"].ToString();
            sua.IsEnabled = false;
            xoa.IsEnabled = false;
            load_ds();
        }
        public void load_ds()
        {
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("select ROW_NUMBER() over(order by tai_khoan) as Stt, tai_khoan as N'Tài khoản', displayname as N'Tên hiển thị', case when(loai_tk = 1) then N'Quản lý' else N'Nhân viên' end as N'Loại tài khoản' from Account");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            hoa_don.DataContext = table.DefaultView;
            hoa_don.SelectedIndex = -1;
            tk.Text = "";
            mk.Clear();
            mkl.Clear();
            ten.Text = "";
            loaitk.SelectedIndex = -1;
        }


    private void them_Click(object sender, RoutedEventArgs e)
        {
            if (tk.Text == "")
            {
                MessageBox.Show("Tài khoản không được để trống");
                return;
            }
            if (mk.Password.ToString() == "")
            {
                MessageBox.Show("Mật khẩu không được để trống");
                return;
            }
            if(mkl.Password.ToString() == "")
            {
                MessageBox.Show("Mật khẩu lặp lại không được để trống");
                return;
            }
            if (ten.Text == "")
            {
                MessageBox.Show("Tên hiển thị không được để trống");
                return;
            }
            if (mkl.Password.ToString() != mk.Password.ToString())
            {
                MessageBox.Show("Mật khẩu lặp lại không trùng khớp");
                return;
            }
            if (loaitk.SelectedIndex == -1)
            {
                MessageBox.Show("Chưa chọn loại tài khoản");
                return;
            }

            var displayList = DataPovider.Ins.DB.Account.Where(x => x.tai_khoan == tk.Text);
            if (displayList == null || displayList.Count() != 0)
            {
                MessageBox.Show("Tài khoản đã tồn tại");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("insert into account values('{0}','{1}','{2}',N'{3}')", tk.Text, mk.Password.ToString(),loaitk.SelectedValue,ten.Text);
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
            }
            load_ds();
        }

        private void sua_Click(object sender, RoutedEventArgs e)
        {
            if (tk.Text == "")
            {
                MessageBox.Show("Tài khoản không được để trống");
                return;
            }
            if (ten.Text == "")
            {
                MessageBox.Show("Tên hiển thị không được để trống");
                return;
            }
            if (loaitk.SelectedIndex == -1)
            {
                MessageBox.Show("Chưa chọn loại tài khoản");
                return;
            }

            var displayList = DataPovider.Ins.DB.Account.Where(x => x.tai_khoan == tk.Text && x.tai_khoan != ma);
            if (displayList == null || displayList.Count() != 0)
            {
                MessageBox.Show("Tài khoản đã tồn tại");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("update account set tai_khoan = Rtrim('{0}'), loai_tk = '{1}', displayname = N'{2}'  where rtrim(tai_khoan) = Rtrim('{3}')", tk.Text,loaitk.SelectedValue, ten.Text, ma);
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
            }
            load_ds();
        }

        private void xoa_Click(object sender, RoutedEventArgs e)
        {
            var dialogResult = MessageBox.Show("Xác nhận xóa", "", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (dialogResult == MessageBoxResult.Yes)
            {
                using (var ctx = new quanLyCafeEntities())
                {
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete account where tai_khoan = {0}", tk.Text);
                }
            }
            load_ds();
        }

        private void re_Click(object sender, RoutedEventArgs e)
        {
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("update account set password = '1'  where rtrim(tai_khoan) = Rtrim('{0}')", tk.Text);
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
            }
            MessageBox.Show("Reset mật khẩu về 1 thành công");
            load_ds();
        }
    }
}
