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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Cafe_Management3
{
    /// <summary>
    /// Interaction logic for CharColumn.xaml
    /// </summary>
    public partial class ChartColumn : Window
    {
        private List<Item> Items { get; set; }
        int tex;
        public ChartColumn(int a)
        {
            tex = a;
            InitializeComponent();
            var context = new quanLyCafeEntities();
            var table = new DataTable();
            string query = String.Format("exec column_chart {0}",tex);
            SqlConnection connection = new SqlConnection(context.Database.Connection.ConnectionString);
            using (var da = new SqlDataAdapter(query, connection))
            {
                da.Fill(table);
            }
            Items = new List<Item>()
            {
            new Item(){Header= "Tháng 1", Value = Int32.Parse(table.Rows[0]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 2", Value = Int32.Parse(table.Rows[1]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 3", Value = Int32.Parse(table.Rows[2]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 4", Value = Int32.Parse(table.Rows[3]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 5", Value = Int32.Parse(table.Rows[4]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 6", Value = Int32.Parse(table.Rows[5]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 7", Value = Int32.Parse(table.Rows[6]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 8", Value = Int32.Parse(table.Rows[7]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 9", Value = Int32.Parse(table.Rows[8]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 10", Value = Int32.Parse(table.Rows[9]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 11", Value = Int32.Parse(table.Rows[10]["thanh_toan"].ToString())/100000},
                new Item(){Header= "Tháng 12", Value = Int32.Parse(table.Rows[11]["thanh_toan"].ToString())/100000},
            };

            Paint();
        }

        private void Paint()
        {
            try
            {
                float chartWidth = 1200, chartHeight = 750, axisMargin = 100, yAxisInterval = 50,
                    blockWidth = 50, blockMargin = 25;
                mainCanvas.Width = chartWidth;
                mainCanvas.Height = chartHeight;

                Point yAxisEndPoint = new Point(axisMargin, axisMargin);
                Point origin = new Point(axisMargin, chartHeight - axisMargin);
                Point xAxisEndPoint = new Point(chartWidth - axisMargin, chartHeight - axisMargin);

                // for illustration
                //Ellipse yAxisEndPointEllipse = new Ellipse()
                //{
                //    Fill = Brushes.Red,
                //    Width = 10,
                //    Height = 10,
                //};
                //mainCanvas.Children.Add(yAxisEndPointEllipse);
                //Canvas.SetLeft(yAxisEndPointEllipse, yAxisEndPoint.X - 5);
                //Canvas.SetTop(yAxisEndPointEllipse, yAxisEndPoint.Y - 5);

                //Ellipse originEllipse = new Ellipse()
                //{
                //    Fill = Brushes.Red,
                //    Width = 10,
                //    Height = 10,
                //};
                //mainCanvas.Children.Add(originEllipse);
                //Canvas.SetLeft(originEllipse, origin.X - 5);
                //Canvas.SetTop(originEllipse, origin.Y - 5);

                //Ellipse xAxisEndPointEllipse = new Ellipse()
                //{
                //    Fill = Brushes.Blue,
                //    Width = 10,
                //    Height = 10,
                //};
                //mainCanvas.Children.Add(xAxisEndPointEllipse);
                //Canvas.SetLeft(xAxisEndPointEllipse, xAxisEndPoint.X - 5);
                //Canvas.SetTop(xAxisEndPointEllipse, xAxisEndPoint.Y - 5);

                //Line yAxisStartLine = new Line()
                //{
                //    Stroke = Brushes.LightGray,
                //    StrokeThickness = 1,
                //    X1 = yAxisEndPoint.X,
                //    Y1 = yAxisEndPoint.Y,
                //    X2 = origin.X,
                //    Y2 = origin.Y,
                //};
                //mainCanvas.Children.Add(yAxisStartLine);

                //Line yAxisEndLine = new Line()
                //{
                //    Stroke = Brushes.LightGray,
                //    StrokeThickness = 1,
                //    X1 = xAxisEndPoint.X,
                //    Y1 = xAxisEndPoint.Y,
                //    X2 = xAxisEndPoint.X,
                //    Y2 = yAxisEndPoint.Y,
                //};
                //mainCanvas.Children.Add(yAxisEndLine);


                double yValue = 0;
                var yAxisValue = origin.Y;
                while (yAxisValue >= yAxisEndPoint.Y)
                {
                    // for illustration
                    //Ellipse lEllipse = new Ellipse()
                    //{
                    //    Fill = Brushes.Red,
                    //    Width = 10,
                    //    Height = 10,
                    //};

                    //Ellipse rEllipse = new Ellipse()
                    //{
                    //    Fill = Brushes.Blue,
                    //    Width = 10,
                    //    Height = 10,
                    //};

                    //mainCanvas.Children.Add(lEllipse);
                    //mainCanvas.Children.Add(rEllipse);

                    //Canvas.SetLeft(lEllipse, origin.X - 5);
                    //Canvas.SetTop(lEllipse, yAxisValue - 5);

                    //Canvas.SetLeft(rEllipse, xAxisEndPoint.X - 5);
                    //Canvas.SetTop(rEllipse, yAxisValue - 5);



                    Line yLine = new Line()
                    {
                        Stroke = Brushes.LightGray,
                        StrokeThickness = 1,
                        X1 = origin.X,
                        Y1 = yAxisValue,
                        X2 = xAxisEndPoint.X,
                        Y2 = yAxisValue,
                    };
                    mainCanvas.Children.Add(yLine);

                    TextBlock yAxisTextBlock = new TextBlock()
                    {
                        Text = $"{yValue*100}",
                        Foreground = Brushes.Black,
                        FontSize = 16,
                    };
                    mainCanvas.Children.Add(yAxisTextBlock);

                    Canvas.SetLeft(yAxisTextBlock, origin.X - 100);
                    Canvas.SetTop(yAxisTextBlock, yAxisValue - 12.5);


                    yAxisValue -= yAxisInterval;
                    yValue += yAxisInterval;
                }
                TextBlock yAxisTextBlock2 = new TextBlock()
                {
                    Text = "Đơn vị: 100 VNĐ",
                    Foreground = Brushes.Black,
                    FontSize = 16,
                };
                mainCanvas.Children.Add(yAxisTextBlock2);

                var margin = origin.X + blockMargin;
                foreach (var item in Items)
                {
                    Rectangle block = new Rectangle()
                    {
                        Fill = Brushes.Gold,
                        //Fill = new SolidColorBrush(Color.FromRgb(68, 114, 196)),
                        Width = blockWidth,
                        Height = item.Value,
                    };

                    mainCanvas.Children.Add(block);
                    Canvas.SetLeft(block, margin);
                    Canvas.SetTop(block, origin.Y - block.Height);

                    TextBlock blockHeader = new TextBlock()
                    {
                        Text = item.Header,
                        FontSize = 16,
                        Foreground = Brushes.Black,
                    };
                    mainCanvas.Children.Add(blockHeader);
                    Canvas.SetLeft(blockHeader, margin );
                    Canvas.SetTop(blockHeader, origin.Y + 5);

                    margin += (blockWidth + blockMargin);
                }              
            }
            catch (Exception exception)
            {
            }
        }
    }

    public class Item
    {
        public string Header { get; set; }
        public int Value { get; set; }
    }
}
