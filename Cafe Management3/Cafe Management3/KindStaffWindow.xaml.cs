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
    public partial class KindStaffWindow : Window
    {
        string ma;
        public KindStaffWindow()
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
                maloai.Text = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                tenloai.Text = (((hoa_don.Columns[2].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                luong.Text = decimal.Parse(((hoa_don.Columns[3].GetCellContent(hoa_don.Items[a]) as TextBlock).Text)).ToString("#,##0");
            }
            else
                return;
        }

        private void xwindow_Loaded(object sender, RoutedEventArgs e)
        {
            sua.IsEnabled = false;
            xoa.IsEnabled = false;
            load_ds();
        }
        public void load_ds()
        {
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("select ROW_NUMBER() over(order by ma_loainv) as Stt, ma_loainv as N'Mã loại nhân viên', ten_loainv as N'Tên loại nhân viên', Format(luong, '#,##0') as N'Lương' from loai_nv order by ma_loainv");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            hoa_don.DataContext = table.DefaultView;
            hoa_don.SelectedIndex = -1;
            maloai.Text = "";
            tenloai.Text = "";
        }

        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void luong_LostFocus(object sender, RoutedEventArgs e)
        {
            if (luong.Text != "")
                luong.Text = decimal.Parse(luong.Text).ToString("##,###,###,###,##0");
            else
                return;
        }

        private void them_Click(object sender, RoutedEventArgs e)
        {
            if (maloai.Text == "")
            {
                MessageBox.Show("Mã loại nhân viên không được để trống");
                return;
            }
            var displayList = DataPovider.Ins.DB.loai_nv.Where(x => x.ma_loainv == maloai.Text);
            if (displayList == null || displayList.Count() != 0)
            {
                MessageBox.Show("Mã loại nhân viên đã tồn tại");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("insert into loai_nv values({0},N'{1}',{2})", maloai.Text, tenloai.Text, decimal.Parse(luong.Text));
            }
            load_ds();
        }

        private void sua_Click(object sender, RoutedEventArgs e)
        {
            if (maloai.Text == "")
            {
                MessageBox.Show("Mã loại nhân viên không được để trống");
                return;
            }
             var t = DataPovider.Ins.DB.loai_nv.Where(x => x.ma_loainv == maloai.Text && x.ma_loainv != ma);
            if (t.Count() > 0)
            {
                MessageBox.Show("Mã loại nhân viên đã tồn tại");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("update loai_nv set ma_loainv = {0}, ten_loainv = {1},luong = {2} where ma_loainv = {3}", maloai.Text, tenloai.Text, decimal.Parse(luong.Text),ma);
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
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete loai_nv where ma_loainv = {0}", maloai.Text);
                }
            }
            load_ds();
        }
    }
    
}
