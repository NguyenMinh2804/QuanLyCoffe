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
    public partial class StaffWindow : Window
    {
        string ma;
        DataTable table = new DataTable();
        public StaffWindow()
        {
            InitializeComponent();
        }

        private void hoa_don_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            sua.IsEnabled = true;
            xoa.IsEnabled = true;
            int i=0;
            int k=-1;
            int o;
            int a = hoa_don.SelectedIndex;
            if (a != -1)
            {
                ma = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                manv.Text = (((hoa_don.Columns[1].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                ten.Text = (((hoa_don.Columns[2].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                string ab = (((hoa_don.Columns[3].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                foreach (DataRow dr in table.Rows)
                {
                    if(ab == dr["ma_loainv"].ToString())
                    {
                        k = i;
                    } 
                    else
                    {
                        i++;
                    }    
                }
                loainv.SelectedIndex = k;
                heso.Text = (((hoa_don.Columns[5].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                diachi.Text = (((hoa_don.Columns[6].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                dienthoai.Text = (((hoa_don.Columns[7].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                email.Text = (((hoa_don.Columns[8].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                cmnd.Text = (((hoa_don.Columns[9].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                string abc = (((hoa_don.Columns[10].GetCellContent(hoa_don.Items[a]) as TextBlock).Text));
                if(abc=="Đang làm việc")
                {
                    o = 1;
                }
                else
                {
                    o = 0;
                }
                cbbheso.SelectedIndex = o;
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
                "Đã nghỉ việc",
           });
            dt.Rows.Add(new Object[]{
                1,
                "Đang làm việc",
           });
            sua.IsEnabled = false;
            xoa.IsEnabled = false;
            load_ds();
            cbbheso.ItemsSource = dt.DefaultView;
            cbbheso.DisplayMemberPath = dt.Columns["ten"].ToString();
            cbbheso.SelectedValuePath = dt.Columns["id"].ToString();
            cbbheso.SelectedIndex = 1;
            var context = new quanLyCafeEntities();
            string query = String.Format("Select * from loai_nv order by ten_loainv");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            loainv.ItemsSource = table.DefaultView;
            loainv.DisplayMemberPath = table.Columns["ten_loainv"].ToString();
            loainv.SelectedValuePath = table.Columns["ma_loainv"].ToString();
        }
        public void load_ds()
        {
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("select ROW_NUMBER() over(order by ma_nv) as Stt, rtrim(ma_nv) as N'Mã nhân viên', ten_nv as N'Tên nhân viên', (a.ma_loainv) as N'Mã loại nhân viên', b.ten_loainv as N'Loại nhân viên', he_so as N'Hệ số', dia_chi as N'Địa chỉ', rtrim(sdt) as N'Số điện thoại', rtrim(email) as N'Email', so_cmnd as 'Số cmnd/căn cước', case when (status = 1) then N'Đang làm việc' else N'Đã nghỉ việc' end as N'Trạng thái'  from nhan_vien a left join loai_nv b on a.ma_loainv = b.ma_loainv");
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
            cmnd.Text = "";
            heso.Text = "1";
            loainv.SelectedIndex = -1;
        }


        private void them_Click(object sender, RoutedEventArgs e)
        {
            if (manv.Text == "")
            {
                MessageBox.Show("Mã nhân viên không được để trống");
                return;
            }
            var displayList = DataPovider.Ins.DB.nhan_vien.Where(x => x.ma_nv == manv.Text);
            if (displayList == null || displayList.Count() != 0)
            {
                MessageBox.Show("Mã nhân viên đã tồn tại");
                return;
            }
            if(heso.Text=="")
            {
                MessageBox.Show("Hệ số chưa đúng định dạng");
                return;
            }    
            using (var ctx = new quanLyCafeEntities())
            {
                string query = string.Format("insert into nhan_vien values(N'{0}',N'{1}',N'{2}',N'{3}',N'{4}',N'{5}',{6},N'{7}',N'{8}')", manv.Text, ten.Text, diachi.Text, dienthoai.Text, email.Text, loainv.SelectedValue.ToString(), float.Parse(heso.Text), cmnd.Text, cbbheso.SelectedValue.ToString());
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand(query);
            }
            load_ds();
        }

        private void sua_Click(object sender, RoutedEventArgs e)
        {
            if (manv.Text == "")
            {
                MessageBox.Show("Mã nhân viên không được để trống");
                return;
            }
            var t = DataPovider.Ins.DB.nhan_vien.Where(x => x.ma_nv == manv.Text && x.ma_nv != ma);
            if (t.Count() > 0)
            {
                MessageBox.Show("Mã nhân viên đã tồn tại");
                return;
            }
            if (heso.Text == "")
            {
                MessageBox.Show("Hệ số chưa đúng định dạng");
                return;
            }
            using (var ctx = new quanLyCafeEntities())
            {
                int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("update nhan_vien set ma_nv = {0}, ten_nv = {1},dia_chi = {2}, sdt = {3}, email = {4}, ma_loainv = {5}, he_so = {6}, so_cmnd = {7}, status={8}  where rtrim(ma_nv) = {9}", manv.Text, ten.Text, diachi.Text, dienthoai.Text, email.Text, loainv.SelectedValue.ToString(), float.Parse(heso.Text), cmnd.Text, cbbheso.SelectedValue.ToString(), ma);
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
                    int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("delete nhan_vien where ma_nv = {0}", manv.Text);
                }
            }
            load_ds();
        }

        private void TextBox_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void TextBox_PreviewTextInput_2(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void TextBox_PreviewTextInput_3(object sender, TextCompositionEventArgs e)
        {
            var regex = new Regex(@"^[0-9]*(?:\.[0-9]*)?$");
            if (regex.IsMatch(e.Text) && !(e.Text == "." && ((TextBox)sender).Text.Contains(e.Text)))
                e.Handled = false;

            else
                e.Handled = true;
        }
    }
    
}
