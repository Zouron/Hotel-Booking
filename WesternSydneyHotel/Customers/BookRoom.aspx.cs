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
    public partial class BookRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime now = DateTime.Now;
            CheckinValidator.ValueToCompare = now.ToString("yyy-MM-dd");
        }

        protected void Submit_OnClientClick(object sender, EventArgs e)
        {
            String connectionString = WebConfigurationManager.ConnectionStrings["customerConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            String query;
            query = "SELECT customers.gname AS[First Name], customers.sname AS[Last Name], bookings.rid AS[Room ID], bookings.checkin AS[Check - In], bookings.checkout AS[Check - Out], bookings.cost AS[Total Cost], bookings.btime AS[Booking Time] FROM bookings INNER JOIN customers ON bookings.username = customers.username WHERE(customers.username = @user)";
            SqlCommand cmdQ = new SqlCommand(query, con);
            string sql;
            sql = "INSERT INTO bookings (rid, username, checkin, checkout, cost, btime) VALUES (@roomSelection, @user @checkinInput, @checkoutInput)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("roomSelection", RoomSelection.SelectedValue);
            cmd.Parameters.AddWithValue("username", User.Identity.Name);
            cmd.Parameters.AddWithValue("checkinInput", CheckinInput.Text);
            cmd.Parameters.AddWithValue("checkoutInput", CheckoutInput.Text);

            using (con)
            {
                con.Open();
                int rowCount = cmdQ.ExecuteNonQuery();
                if (rowCount > 0)
                    lblResult.Text = "Success. Their are available rooms";

                if (Submit.CausesValidation == true)
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
}