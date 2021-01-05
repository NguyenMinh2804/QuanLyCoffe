using Cafe_Management3.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Excel = Microsoft.Office.Interop.Excel;
using Microsoft.Office.Interop.Excel;
using System.Windows.Forms;

namespace Cafe_Management3
{
    /// <summary>
    /// Interaction logic for ItemWindow.xaml
    /// </summary>
    public partial class ImportSiteeReport : System.Windows.Window
    {
        public ImportSiteeReport()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            var context = new quanLyCafeEntities();
            var table = new System.Data.DataTable();
            string query = String.Format("exec bao_cao_nhap_kho '{0}','{1}'", vatu.SelectedValue, den_ngay.SelectedDate);
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            doanh_thu.DataContext = table.DefaultView;
        }
            
        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            string a = DateTime.Now.ToString("dd/MM/yyy");
            den_ngay.Text = a;
            var context = new quanLyCafeEntities();
            var table = new System.Data.DataTable();
            string query = String.Format("exec bao_cao_nhap_kho '{0}','{1}'", "", "");
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            doanh_thu.DataContext = table.DefaultView;
            var table1 = new System.Data.DataTable();

            query = String.Format("Select * from vat_tu order by ten_vt");
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table1);
            }
            vatu.ItemsSource = table1.DefaultView;
            vatu.DisplayMemberPath = table1.Columns["ten_vt"].ToString();
            vatu.SelectedValuePath = table1.Columns["ma_vt"].ToString();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Microsoft.Office.Interop.Excel._Application app = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel._Workbook workbook = app.Workbooks.Add(Type.Missing);
            Microsoft.Office.Interop.Excel._Worksheet worksheet = null;
            worksheet = workbook.Sheets["Sheet1"];
            worksheet = workbook.ActiveSheet;
            worksheet.Name = "Báo cáo nhập kho";
            for (int i = 1; i < doanh_thu.Columns.Count + 1; i++)
            {
                worksheet.Cells[1, i] = doanh_thu.Columns[i - 1].Header;
            }
            for (int i = 0; i < doanh_thu.Items.Count; i++)
            {
                for (int j = 0; j < doanh_thu.Columns.Count; j++)
                {
                    worksheet.Cells[i + 2, j + 1] = ((doanh_thu.Columns[j].GetCellContent(doanh_thu.Items[i]) as TextBlock).Text);
                }
            }
            var saveFileDialogo = new SaveFileDialog();
            saveFileDialogo.FileName = "Báo cáo nhập kho";
            saveFileDialogo.DefaultExt = ".xlsx";

            if (saveFileDialogo.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                workbook.SaveAs(saveFileDialogo.FileName, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            }
            app.Quit();
        }
    }
}
