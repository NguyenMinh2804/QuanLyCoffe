using System;
using System.Collections.Generic;
using System.Data;
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

namespace Cafe_Management3
{
    /// <summary>
    /// Interaction logic for SustenanceWindow.xaml
    /// </summary>
    public partial class SustenanceWindow : Window
    {
        public SustenanceWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(cbb.SelectedIndex == -1)
            {
                MessageBox.Show("Chưa chọn loại món");
            }    
        }
    }
}
