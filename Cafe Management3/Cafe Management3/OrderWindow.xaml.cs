using Cafe_Management3.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for OrderWindow.xaml
    /// </summary>
    public partial class OrderWindow : Window
    {
        public OrderWindow()
        {
            InitializeComponent();
        }

        private void loginWindow_Loaded(object sender, RoutedEventArgs e)
        {
            string r = "";
            load_listFood(r);
        }

        public void load_listFood(string a)
        {
            x.Children.Clear();
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("SELECT * FROM mon where dbo.fChuyenCoDauThanhKhongDau(ten_mon) like dbo.fChuyenCoDauThanhKhongDau(N'%{0}%') order by ten_mon", a);
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            for (int i = 0; i < table.Rows.Count; i++)
            {

                string text = table.Rows[i]["ten_mon"].ToString();
                string text2 = decimal.Parse(table.Rows[i]["gia"].ToString()).ToString("#,##0");
                int text3 = i;
                string text4 = table.Rows[i]["ma_mon"].ToString();
                Button b1 = new Button();
                //BitmapImage btm = new BitmapImage(new Uri("cafe.jpg", UriKind.Relative));
                //Image img = new Image();
                //img.Source = btm;
                //img.Stretch = Stretch.Fill;
                //StackPanel stackPnl = new StackPanel();
                //stackPnl.Orientation = Orientation.Horizontal;
                //stackPnl.Children.Add(img);
                b1.Content = new TextBlock
                {
                    Text = text + "\n" + text2+" VNĐ",
                    TextWrapping = TextWrapping.Wrap,
                    Margin = new Thickness(-12, 0, -12, -0),
                    //VerticalAlignment = VerticalAlignment.Stretch,
                    //HorizontalAlignment = HorizontalAlignment.Stretch
                   

                };
                //stackPnl.Children.Add(aaa);
                //b1.Content = stackPnl;
                b1.Background = Brushes.LightSteelBlue;
                b1.BorderBrush = Brushes.DarkGreen;
                b1.Foreground = Brushes.Black;
                Thickness marginThickness = b1.Margin;
                b1.Margin = new Thickness(5);
                b1.Height = 100;
                b1.Width = 100;
                b1.HorizontalAlignment = HorizontalAlignment.Left;
                b1.MouseDoubleClick += new MouseButtonEventHandler((s, e) => buttonClick(s, e, text, text2, text3, text4));
                x.Children.Add(b1);
            }
        }

        private void ComboBox_TextChanged(object sender, EventArgs e)
        {
            x.Children.Clear();
            load_listFood(cb_mon.Text);
        }
        private void buttonClick(object sender, EventArgs e, string a, string b, int c, string d)
        {
            Button clicked = (Button)sender;
            int k = 0;
            int j= 0;
            decimal thanh_tien;
            string r;
            for (int i = -1; i < list_View.Items.Count - 1; i++)
            {
                if(c == decimal.Parse((list_View.Columns[0].GetCellContent(list_View.Items[i+1]) as TextBlock).Text))
                {
                    k++;
                    r = ((list_View.Columns[2].GetCellContent(list_View.Items[i + 1]) as TextBlock).Text);
                    j = Int32.Parse(r) + 1;
                   ((list_View.Columns[2].GetCellContent(list_View.Items[i + 1]) as TextBlock).Text) = j.ToString("#,##0");
                    thanh_tien = j * decimal.Parse(b);
                    ((list_View.Columns[6].GetCellContent(list_View.Items[i + 1]) as TextBlock).Text) = thanh_tien.ToString("#,##0");
                    tinh_tien_hang();
                }
            }
            if (k == 0)
            {
                add(a, b, 1, c, d);
                if (list_View.Items.Count == 1)
                {
                    tien_hang.Text = b.ToString();
                }
                else
                {
                    tinh_tien_hang2(b);
                }
            }

        }
        public struct list_view
        {
            public int id { get; set; }
            public string ma_mon { get; set; }

            public string ten_mon { get; set; }
            public string so_luong { get; set; }
            public string don_gia { get; set; }
            public string thanh_tien { get; set; }
        }
        public struct DateTime0
        {
            public int year { get; set; }
            public int month { get; set; }
            public int day { get; set; }
            public int hour { get; set; }
            public int minute { get; set; }
            public int second { get; set; }
        }

        private void add(string v, string x, int sl, int id, string c)
        {
            decimal a ;
            if (x != "")
            {
                 a = decimal.Parse(x) * sl;
            }
            else
            {
                a = 0;
            }
            //list_View.Items.Add(new list_view
            //{
            //    ten_mon = v,
            //    so_luong = sl.ToString(),
            //    don_gia = x,
            //    thanh_tien = a.ToString()
            //}) ;
            HashSet<list_view> DATA = new HashSet<list_view>()
            {
                new list_view()
                {
                    id = id,
                    ma_mon = c,
                    ten_mon = v,
                    so_luong = sl.ToString("#,##0"),
                    don_gia = x, 
                    thanh_tien= a.ToString("#,##0")
                }
            };
            list_View.Items.Add(DATA);
        }
        public void tinh_tien_hang()
        {
            decimal sum = 0;
            int i;
            for (i = 0; i < list_View.Items.Count; i++)
            {
                sum += (decimal.Parse((list_View.Columns[6].GetCellContent(list_View.Items[i]) as TextBlock).Text));
            }
            tien_hang.Text = sum.ToString();
        }
        public void tinh_tien_hang2(string b)
        {
            decimal sum = 0;
            int i;
            for (i = 0; i < list_View.Items.Count-1; i++)
            {
                sum += (decimal.Parse((list_View.Columns[6].GetCellContent(list_View.Items[i]) as TextBlock).Text));
            }
            sum += decimal.Parse(b);
            tien_hang.Text = sum.ToString();
        }
        public void tinh_tien_hang3(string b)
        {
            decimal sum = 0;
            int i;
            for (i = 0; i < list_View.Items.Count; i++)
            {
                sum += decimal.Parse(b) + (decimal.Parse((list_View.Columns[6].GetCellContent(list_View.Items[i]) as TextBlock).Text));
            }
            tien_hang.Text = sum.ToString();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var dialogResult = MessageBox.Show("Xác nhận thanh toán", "", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (dialogResult == MessageBoxResult.Yes)
            {
                if (list_View.Items.Count == 0)
                {
                    return;
                }
                {
                    string a = DateTime.Now.ToString("dd/MM/yyyHH:mm:ss.fff");
                    //RegexOptions options = RegexOptions.None;
                    //Regex regex = new Regex(@"[ ]{2,}", options);
                    //string t = "HD" + Regex.Replace(a, @"\s+", "");s
                    string t = "HD" + a;
                    using (var ctx = new quanLyCafeEntities())
                    {
                        int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("insert into hoa_don values({0},{1},{2},{3},{4},{5},{6})", t, "", decimal.Parse(tien_hang.Text), decimal.Parse(giam_gia.Text), decimal.Parse(thanh_toan.Text), DateTime.Now,"0");
                    }
                    for (int i = 0; i < list_View.Items.Count; i++)
                    {
                        int ma_cthd = i + 1;
                        string ma_mon = (((list_View.Columns[8].GetCellContent(list_View.Items[i]) as TextBlock).Text));
                        int so_luong = (Int32.Parse((list_View.Columns[2].GetCellContent(list_View.Items[i]) as TextBlock).Text));
                        decimal don_gia = (decimal.Parse((list_View.Columns[5].GetCellContent(list_View.Items[i]) as TextBlock).Text));
                        decimal thanh_tien = (decimal.Parse((list_View.Columns[6].GetCellContent(list_View.Items[i]) as TextBlock).Text));
                        using (var ctx = new quanLyCafeEntities())
                        {
                            int noOfRowUpdated = ctx.Database.ExecuteSqlCommand("insert into chi_tiet_hoa_don values({0},{1},{2},{3},{4},{5},{6})", ma_cthd, t, ma_mon, so_luong, don_gia, thanh_tien, DateTime.Now);
                        }
                    }
                    list_View.Items.Clear();
                    tien_hang.Text = "0";
                    giam_gia.Text = "0";
                    thanh_toan.Text = "0";
                }
            }
            else if (dialogResult == MessageBoxResult.No)
            {
                return;
            }
           
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            string r, don_gia;
            int j;
            decimal thanh_tien;
            int index = list_View.SelectedIndex;
            r = ((list_View.Columns[2].GetCellContent(list_View.Items[index]) as TextBlock).Text);
            j = Int32.Parse(r) - 1;
            ((list_View.Columns[2].GetCellContent(list_View.Items[index]) as TextBlock).Text) = j.ToString();
            don_gia = ((list_View.Columns[5].GetCellContent(list_View.Items[index]) as TextBlock).Text);
            thanh_tien = j * decimal.Parse(don_gia);
            ((list_View.Columns[6].GetCellContent(list_View.Items[index]) as TextBlock).Text) = thanh_tien.ToString("#,##0");
            tinh_tien_hang();

        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            string r, don_gia;
            int j ;
            decimal thanh_tien;
            int index = list_View.SelectedIndex;
            r = ((list_View.Columns[2].GetCellContent(list_View.Items[index]) as TextBlock).Text);
            j = Int32.Parse(r) + 1;
            ((list_View.Columns[2].GetCellContent(list_View.Items[index]) as TextBlock).Text) = j.ToString();
            don_gia = ((list_View.Columns[5].GetCellContent(list_View.Items[index]) as TextBlock).Text);
            thanh_tien = j * decimal.Parse(don_gia);
            ((list_View.Columns[6].GetCellContent(list_View.Items[index]) as TextBlock).Text) = thanh_tien.ToString("#,##0");
            tinh_tien_hang();

        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            int index = list_View.SelectedIndex;
            list_View.Items.RemoveAt(index);
            tinh_tien_hang();

        }
        public void thanh_toan_tien()
        {
            decimal a;
            decimal b;
            decimal c;
            if ((tien_hang.Text.ToString()) != "" && decimal.Parse(tien_hang.Text.ToString()) != 0)
            {
                a = decimal.Parse(tien_hang.Text.ToString());
                if (giam_gia.Text.ToString() != "" && decimal.Parse(giam_gia.Text.ToString()) != 0)
                {
                    
                    b = decimal.Parse(giam_gia.Text.ToString());
                    c = a - (b / 100) * a;
                    thanh_toan.Text = c.ToString("#,##0");
                }
                else
                { 
                    thanh_toan.Text = a.ToString("#,##0");
                }
            }
            else

            {
                return;
            }
        }
        private void giam_gia_PreviewTextInput_1(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void giam_gia_TextChanged(object sender, TextChangedEventArgs e)
        {
            thanh_toan_tien();
            giam_gia.Text = decimal.Parse(giam_gia.Text).ToString("#,##0");
        }

        private void tien_hang_TextChanged(object sender, TextChangedEventArgs e)
        {
            thanh_toan_tien();
            tien_hang.Text = decimal.Parse(tien_hang.Text).ToString("#,##0");
        }

        private void TabControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            load_hd();
        }
        public void load_hd()
        {
            hoa_don.SelectedIndex = -1;
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("select rtrim(ma_hoadon) as N'Mã hóa đơn', ngay_hd as 'Ngày hóa đơn',  Format(thanh_tien, '#,##0') as N'Tổng cộng', Format(giam_gia, '#,##0') as N'Giảm giá', Format(thanh_toan, '#,##0') as N'Thanh toán' from hoa_don  where status = 0 order by ngay_hd");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
           hoa_don.DataContext = table.DefaultView;
        }

        private void hoa_don_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if(tabcontrol.SelectedIndex == 1)
            {   
                int index = hoa_don.SelectedIndex;
          
                if (index >= 0)
                {
                    string a = (((hoa_don.Columns[0].GetCellContent(hoa_don.Items[index]) as TextBlock).Text));
                    cthd vm = new cthd(a, index);
                    vm.ShowDialog();
                    hoa_don.SelectedIndex = -1;
                    e.Handled = true;
                }
            }
        }
    }
       
}
