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
    public partial class ExxportSite : Window
    {
        int id;
        DataTable table = new DataTable();
        DataTable table1 = new DataTable();
        DataTable table2 = new DataTable();
        public ExxportSite()
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
                id =  Int32.Parse(((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                ngay.Text = (((hoa_don.Columns[2].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                vatu.Text = (((hoa_don.Columns[3].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                dvt.Text = (((hoa_don.Columns[4].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                sl.Text = (((hoa_don.Columns[5].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
            }
        }

        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            sua.IsEnabled = false;
            xoa.IsEnabled = false;
            load_ds();
            var context = new quanLyCafeEntities();
            string query = String.Format("Select * from vat_tu order by ten_vt");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            query = String.Format("Select * from dvt order by ma_dvt");
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table2);
            }
            vatu.ItemsSource = table.DefaultView;
            vatu.DisplayMemberPath = table.Columns["ten_vt"].ToString();
            vatu.SelectedValuePath = table.Columns["ma_vt"].ToString();
            dvt.ItemsSource = table2.DefaultView;
            dvt.DisplayMemberPath = table2.Columns["ma_dvt"].ToString();
            dvt.SelectedValuePath = table2.Columns["ma_dvt"].ToString();
            string a = DateTime.Now.ToString("dd/MM/yyy");
            ngay.Text = a;
        }
        public void load_ds()
        {
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("select ROW_NUMBER() over(order by ngay_nhap) as Stt,CONVERT(char(10),ngay_nhap,103) as 'Ngày xuất', rtrim(a.ma_vt) as 'Mã vật tư',b.ten_vt as N'Tên vật tư', dvt as 'Đơn vị tính', Format(so_luong, '#,##0') as N'Số lượng'  from phieu_xuat_kho a left join vat_tu b on a.ma_vt= b.ma_vt");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            hoa_don.DataContext = table.DefaultView;
            hoa_don.SelectedIndex = -1;
            vatu.SelectedIndex = -1;
            sl.Text = "";
        }


        private void them_Click(object sender, RoutedEventArgs e)
        {
            if(sl.Text == "")
            {
                sl.Text = "0";
            }        
            string date = ngay.SelectedDate.Value.ToString("MM/dd/yyy");
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("insert into phieu_xuat_kho values('{0}',{1},'{2}','{3}')",vatu.SelectedValue,float.Parse(sl.Text),date, dvt.SelectedValue);
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
            }
            load_ds();
        }

        private void sua_Click(object sender, RoutedEventArgs e)
        {
            if (sl.Text == "")
            {
                sl.Text = "0";
            }
            string date = ngay.SelectedDate.Value.ToString("MM/dd/yyy");
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("update phieu_xuat_kho set ngay_nhap = '{0}', ma_vt = '{1}', so_luong = {2}, ma_dvt = {3} where id = {4}", date, vatu.SelectedValue, float.Parse(sl.Text),dvt.SelectedValue,id);
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
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete phieu_xuat_kho where id = {0}",id);
                }
            }
            load_ds();
        }
        private void sl_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            var regex = new Regex(@"^[0-9]*(?:\.[0-9]*)?$");
            if (regex.IsMatch(e.Text) && !(e.Text == "." && ((TextBox)sender).Text.Contains(e.Text)))
                e.Handled = false;

            else
                e.Handled = true;
        }

        private void sl_LostFocus(object sender, RoutedEventArgs e)
        {
            if (sl.Text != "")
                sl.Text = decimal.Parse(sl.Text).ToString("##,###,###,###,##0");
            else
                return;
        }
    }
}
