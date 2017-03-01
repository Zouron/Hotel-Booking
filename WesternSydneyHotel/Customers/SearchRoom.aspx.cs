using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace WesternSydneyHotel.Customers
{
    public partial class SearchRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkInDateVal.ValueToCompare = DateTime.Now.ToShortDateString();
        }

        protected void submitConfirm_OnClientClick(object sender, EventArgs e)
        {      
        String connectionString = WebConfigurationManager.ConnectionStrings["customerConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(connectionString);
        string sql;
        sql = "select * from rooms where beds=@num_bed and orientation=@ori and rooms.rid not in (select rooms.rid from rooms inner join bookings on rooms.beds = @num_bed and rooms.orientation = @ori and rooms.rid = bookings.rid and @checkin< bookings.checkout and @checkout > bookings.checkin)";
            SqlCommand cmd = new SqlCommand(sql, con);

            using (con)
            {
                con.Open();
                int rowCount = cmd.ExecuteNonQuery();
                if (rowCount > 0)
                    lblResult.Text = "Success. Here are available rooms";
            }

        
            if (submitConfirm.CausesValidation == true)
            {
                GridView1.Visible = true;
            }
            else
            {
                GridView1.Visible = false;
            }
        }
    }
}