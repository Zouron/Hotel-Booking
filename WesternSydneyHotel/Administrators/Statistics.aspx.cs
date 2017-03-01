using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

namespace WesternSydneyHotel.Account.Administrators
{
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangeChartType(object sender, EventArgs e)
        {
            RoomCountChart.Series["RoomCountSeries"].ChartType = (SeriesChartType) Enum.Parse(typeof(SeriesChartType), ChartTypeSelection.SelectedValue);
            MonthCountChart.Series["MonthCountSeries"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ChartTypeSelection.SelectedValue);
        }

        protected void ChangeChart(object sender, EventArgs e)
        {
            int chartDimension = ChartDimensionSelection.SelectedIndex;
            if (chartDimension == 0)
            {
                RoomCountChart.ChartAreas["RoomCountArea"].Area3DStyle.Enable3D = false;
                MonthCountChart.ChartAreas["MonthCountArea"].Area3DStyle.Enable3D = false;
                RoomCountChart.Series["RoomCountSeries"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ChartTypeSelection.SelectedValue);
                MonthCountChart.Series["MonthCountSeries"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ChartTypeSelection.SelectedValue);
            }
            else
            {
                RoomCountChart.ChartAreas["RoomCountArea"].Area3DStyle.Enable3D = true;
                MonthCountChart.ChartAreas["MonthCountArea"].Area3DStyle.Enable3D = true;
                RoomCountChart.Series["RoomCountSeries"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ChartTypeSelection.SelectedValue);
                MonthCountChart.Series["MonthCountSeries"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ChartTypeSelection.SelectedValue);
            }
                
        }
    }
}