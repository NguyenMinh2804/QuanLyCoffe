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
    public partial class Supplier : Window
    {
        string ma;
        public Supplier()
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
                manv.Text = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                ten.Text = (((hoa_don.Columns[2].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                diachi.Text = (((hoa_don.Columns[3].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                dienthoai.Text = (((hoa_don.Columns[4].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                email.Text = (((hoa_don.Columns[5].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
            }

        }
        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            sua.IsEnabled = false;
            xoa.IsEnabled = false;
            load_ds();          
        }
        public void load_ds()
        {
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("select ROW_NUMBER() over(order by ma_kh) as Stt, rtrim(ma_kh) as N'Mã nhà cung cấp', ten_kh as N'Tên nhà cung cấp', dia_chi as N'Địa chỉ', rtrim(sdt) as N'Số điện thoại', rtrim(email) as N'Email' from nha_cc");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            hoa_don.DataContext = table.DefaultView;
            hoa_don.SelectedIndex = -1;
            manv.Text = "";
            ten.Text = "";
            email.Text = "";
            dienthoai.Text = "";
            diachi.Text = "";
        }


        private void them_Click(object sender, RoutedEventArgs e)
        {
            if (manv.Text == "")
            {
                MessageBox.Show("Mã nhà cung cấp không được để trống");
                return;
            }
            var displayList = DataPovider.Ins.DB.nha_cc.Where(x => x.ma_kh == manv.Text);
            if (displayList == null || displayList.Count() != 0)
            {
                MessageBox.Show("Mã nhà cung cấp đã tồn tại");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("insert into nha_cc values(N'{0}',N'{1}',N'{2}',N'{3}',N'{4}')", manv.Text, ten.Text, diachi.Text, dienthoai.Text, email.Text);
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
            }
            load_ds();
        }

        private void sua_Click(object sender, RoutedEventArgs e)
        {
            if (manv.Text == "")
            {
                MessageBox.Show("Mã nhà cung cấp không được để trống");
                return;
            }
            var t = DataPovider.Ins.DB.nha_cc.Where(x => x.ma_kh == manv.Text && x.ma_kh != ma);
            if (t.Count() > 0)
            {
                MessageBox.Show("Mã nhà cung cấp đã tồn tại");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("update nha_cc set ma_kh = {0}, ten_kh = {1}, dia_chi = {2}, sdt = {3}, email = {4} where rtrim(ma_kh) = {5}", manv.Text, ten.Text, diachi.Text, dienthoai.Text, email.Text, ma);
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
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete nha_cc where ma_kh = {0}", manv.Text);
                }
            }
            load_ds();
        }

        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
    } 
}
