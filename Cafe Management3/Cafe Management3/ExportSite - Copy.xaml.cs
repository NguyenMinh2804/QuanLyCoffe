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
    public partial class ImportSite : Window
    {
        int id;
        DataTable table = new DataTable();
        DataTable table1 = new DataTable();
        DataTable table2 = new DataTable();
        public ImportSite()
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
                ncc.Text = (((hoa_don.Columns[4].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                vatu.Text = (((hoa_don.Columns[6].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                dvt.Text = (((hoa_don.Columns[7].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                sl.Text = (((hoa_don.Columns[8].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));

                gia.Text = (((hoa_don.Columns[9].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));

                tien.Text = (((hoa_don.Columns[10].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));

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
            query = String.Format("Select * from nha_cc order by ten_kh");
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table1);
            }
            query = String.Format("Select * from dvt order by ma_dvt");
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table2);
            }
            vatu.ItemsSource = table.DefaultView;
            vatu.DisplayMemberPath = table.Columns["ten_vt"].ToString();
            vatu.SelectedValuePath = table.Columns["ma_vt"].ToString();
            ncc.ItemsSource = table1.DefaultView;
            ncc.DisplayMemberPath = table1.Columns["ten_kh"].ToString();
            ncc.SelectedValuePath = table1.Columns["ma_kh"].ToString();
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
            string query = String.Format("select ROW_NUMBER() over(order by ngay_nhap) as Stt, rtrim(a.id) as N'ID', convert(char(10),ngay_nhap,103) as N'Ngày nhập', Rtrim(a.ma_ncc) as N'Mã nhà cung cấp', c.ten_kh as N'Tên nhà cung cấp', Rtrim(a.ma_vt) as N'Mã vật tư', b.ten_vt as N'Tên vật tư',a.ma_dvt as N'Đơn vị tính', so_luong as N'Số lượng', don_gia as N'Đơn giá', thanh_tien as N'Thành tiền'  from phieu_nhap_kho a left join vat_tu b on a.ma_vt = b.ma_vt left join nha_cc c on a.ma_ncc = c.ma_kh ");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            hoa_don.DataContext = table.DefaultView;
            hoa_don.SelectedIndex = -1;
            vatu.SelectedIndex = -1;
            ncc.SelectedIndex = -1;
            sl.Text = "";
            gia.Text = "";
            tien.Text = "";
        }


        private void them_Click(object sender, RoutedEventArgs e)
        {
            if(sl.Text == "")
            {
                sl.Text = "0";
            }
            if (tien.Text == "")
            {
                tien.Text = "0";
            }
            if (gia.Text == "")
            {
                gia.Text = "0";
            }
            string date = ngay.SelectedDate.Value.ToString("MM/dd/yyy");
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("insert into phieu_nhap_kho values('{0}',{1},'{2}',{3},{4},'{5}',N'{6}')",vatu.SelectedValue,float.Parse(sl.Text),date, decimal.Parse(gia.Text),decimal.Parse(tien.Text),ncc.SelectedValue,dvt.SelectedValue);
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
            if (tien.Text == "")
            {
                tien.Text = "0";
            }
            if (gia.Text == "")
            {
                gia.Text = "0";
            }
            string date = ngay.SelectedDate.Value.ToString("MM/dd/yyy");
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("update phieu_nhap_kho set ngay_nhap = '{0}', ma_ncc = '{1}', ma_vt = '{2}', so_luong = {3}, don_gia = {4}, thanh_tien = {5}, ma_dvt = {7} where id = {6}", date, ncc.SelectedValue, vatu.SelectedValue, float.Parse(sl.Text), decimal.Parse(gia.Text), decimal.Parse(tien.Text), id, dvt.SelectedValue);
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
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete phieu_nhap_kho where id = {0}",id);
                }
            }
            load_ds();
        }

        private void sl_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (sl.Text != "" && gia.Text != "")
            {
                float a = float.Parse(sl.Text);
                decimal b = decimal.Parse(gia.Text);
                decimal c = (decimal)a * b;
                tien.Text = c.ToString();
            }
            else
                return;
        }

        private void gia_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (sl.Text != "" && gia.Text != "")
            {
                float a = float.Parse(sl.Text);
                decimal b = decimal.Parse(gia.Text);
                decimal c = (decimal)a * b;
                tien.Text = c.ToString();
            }
            else
                return;
        }

        private void sl_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            var regex = new Regex(@"^[0-9]*(?:\.[0-9]*)?$");
            if (regex.IsMatch(e.Text) && !(e.Text == "." && ((TextBox)sender).Text.Contains(e.Text)))
                e.Handled = false;

            else
                e.Handled = true;
        }

        private void gia_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
    }
}
