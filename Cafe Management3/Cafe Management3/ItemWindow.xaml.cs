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
    public partial class ItemWindow : Window
    {
        string ma;
        DataTable table = new DataTable();
        public ItemWindow()
        {
            InitializeComponent();
        }

        private void hoa_don_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            sua.IsEnabled = true;
            xoa.IsEnabled = true;
            int i = 0;
            int k = -1;
            int a = hoa_don.SelectedIndex;
            if (a != -1)
            {
                ma = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                mavt.Text = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                ten.Text = (((hoa_don.Columns[2].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                string ab = (((hoa_don.Columns[3].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                foreach (DataRow dr in table.Rows)
                {
                    if (ab == dr["ma_dvt"].ToString())
                    {
                        k = i;
                    }
                    else
                    {
                        i++;
                    }
                }
                dvt.SelectedIndex = k;
            }
        }

        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            sua.IsEnabled = false;
            xoa.IsEnabled = false;
            load_ds();
            var context = new quanLyCafeEntities();
            string query = String.Format("Select * from dvt order by ten_dvt");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            dvt.ItemsSource = table.DefaultView;
            dvt.DisplayMemberPath = table.Columns["ma_dvt"].ToString();
            dvt.SelectedValuePath = table.Columns["ma_dvt"].ToString();
        }
        public void load_ds()
        {
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("select ROW_NUMBER() over(order by ma_vt) as Stt, rtrim(ma_vt) as N'Mã vật tư', ten_vt as N'Tên vật tư', (a.ma_dvt) as N'Mã đơn vị tính', b.ten_dvt as N'Đơn vị tính'  from vat_tu a left join dvt b on a.ma_dvt = b.ma_dvt");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            hoa_don.DataContext = table.DefaultView;
            hoa_don.SelectedIndex = -1;
            mavt.Text = "";
            ten.Text = "";
            dvt.SelectedIndex = -1;
        }


        private void them_Click(object sender, RoutedEventArgs e)
        {
            if (mavt.Text == "")
            {
                MessageBox.Show("Mã vật tư không được để trống");
                return;
            }
            var displayList = DataPovider.Ins.DB.vat_tu.Where(x => x.ma_vt == mavt.Text);
            if (displayList == null || displayList.Count() != 0)
            {
                MessageBox.Show("Mã vật tư đã tồn tại");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("insert into vat_tu values(N'{0}',N'{1}',N'{2}')", mavt.Text, ten.Text,dvt.SelectedValue.ToString());
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
            }
            load_ds();
        }

        private void sua_Click(object sender, RoutedEventArgs e)
        {
            if (mavt.Text == "")
            {
                MessageBox.Show("Mã vật tư không được để trống");
                return;
            }
            var t = DataPovider.Ins.DB.vat_tu.Where(x => x.ma_vt == mavt.Text && x.ma_vt != ma);
            if (t.Count() > 0)
            {
                MessageBox.Show("Mã vật tư đã tồn tại");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("update vat_tu set ma_vt = {0}, ten_vt = {1}, ma_dvt = {2} where rtrim(ma_vt) = {3}", mavt.Text, ten.Text, dvt.SelectedValue, ma);
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
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete vat_tu where ma_vt = {0}", mavt.Text);
                }
            }
            load_ds();
        }
    }
}
