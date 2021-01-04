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
    public partial class ConvertUnit : Window
    {
        string ma,ma2;
        DataTable table = new DataTable();
        public ConvertUnit()
        {
            InitializeComponent();
        }

        private void hoa_don_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            sua.IsEnabled = true;
            xoa.IsEnabled = true;
            int i = 0;
            int k = -1;
            int j = 0;
            int f = -1;
            int a = hoa_don.SelectedIndex;
            if (a != -1)
            {
                 ma = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                string dvt12 = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                sl.Text = (((hoa_don.Columns[2].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                string dvt22 = (((hoa_don.Columns[3].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                 ma2 = (((hoa_don.Columns[3].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                foreach (DataRow dr in table.Rows)
                {
                    if (dvt12 == dr["ma_dvt"].ToString())
                    {
                        k = i;
                    }
                    else
                    {
                        i++;
                    }
                    if (dvt22 == dr["ma_dvt"].ToString())
                    {
                        f = j;
                    }
                    else
                    {
                        j++;
                    }
                }
                dvt1.SelectedIndex = k;
                dvt2.SelectedIndex = f;
            }
        }
            private void window_Loaded(object sender, RoutedEventArgs e)
        {
            sua.IsEnabled = false;
            xoa.IsEnabled = false;
            load_ds();
            var context = new quanLyCafeEntities();
            string query = String.Format("Select * from dvt order by ma_dvt");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            dvt1.ItemsSource = table.DefaultView;
            dvt1.DisplayMemberPath = table.Columns["ma_dvt"].ToString();
            dvt1.SelectedValuePath = table.Columns["ma_dvt"].ToString();
            dvt2.ItemsSource = table.DefaultView;
            dvt2.DisplayMemberPath = table.Columns["ma_dvt"].ToString();
            dvt2.SelectedValuePath = table.Columns["ma_dvt"].ToString();
        }
        public void load_ds()
        {
            var table = new DataTable();
            var context = new quanLyCafeEntities();
            string query = String.Format("select ROW_NUMBER() over(order by ma_dvt,ma_dvt2) as Stt, ma_dvt as N'Đơn vị tính 1', sl as N'Số lượng qui đổi', ma_dvt2 as N'Đơn vị tính 2' from qui_doivt");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            hoa_don.DataContext = table.DefaultView;
            hoa_don.SelectedIndex = -1;
            dvt1.Text = "";
            dvt2.Text = "";
            sl.Text = "1";
        }


        private void them_Click(object sender, RoutedEventArgs e)
        {
            if (dvt1.Text == "" || dvt2.Text == "")
            {
                MessageBox.Show("Đơn vị tính không được để trống");
                return;
            }
            var displayList = DataPovider.Ins.DB.qui_doivt.Where(x => x.ma_dvt == dvt1.Text && x.ma_dvt2 == dvt2.Text);
            if (displayList == null || displayList.Count() != 0)
            {
                MessageBox.Show("Qui đổi đơn vị tính đã tồn tại");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("insert into qui_doivt values(N'{0}',N'{1}','{2}')", dvt1.SelectedValue, dvt2.SelectedValue, Int32.Parse(sl.Text));
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
            }
            load_ds();
        }

        private void sua_Click(object sender, RoutedEventArgs e)
        {
            if (dvt1.Text == "" || dvt2.Text == "")
            {
                MessageBox.Show("Đơn vị tính không được để trống");
                return;
            }
            if (dvt1.Text != ma || dvt2.Text != ma2)
            {
                var displayList = DataPovider.Ins.DB.qui_doivt.Where(x => x.ma_dvt == dvt1.Text && x.ma_dvt2 == dvt2.Text);
                if (displayList == null || displayList.Count() != 0)
                {
                    MessageBox.Show("Qui đổi đơn vị tính đã tồn tại");
                    return;
                }
            }
                using (var ctx = new quanLyCafeEntities())
                {
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("update qui_doivt set ma_dvt = {0}, ma_dvt2 = {1}, sl = {2} where ma_dvt = {3} and ma_dvt2 = {4}", dvt1.SelectedValue, dvt2.SelectedValue, sl.Text, ma, ma2);
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
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete qui_doivt where ma_dvt = {0} and ma_dvt2 = {1}", dvt1.SelectedValue, dvt2.SelectedValue);
                }
            }
            load_ds();
        }
    } 
}
