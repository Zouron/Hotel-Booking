using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WesternSydneyHotel.Account.Customers
{
    public partial class MyBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            user.Text = User.Identity.Name;
            
            if (!IsPostBack)
            {
                BindGridView();
            }
            
        }
        
        protected void BindGridView()
        {
            DataTable dt = new DataTable();

            SqlConnection con = new SqlConnection("SELECT customers.gname AS[First Name], customers.sname AS[Last Name], bookings.rid AS[Room ID], bookings.checkin AS[Check - In], bookings.checkout AS[Check - Out], bookings.cost AS[Total Cost], bookings.btime AS[Booking Time] FROM bookings INNER JOIN customers ON bookings.username = customers.username WHERE(customers.username = @user)");
            SqlDataAdapter da = new SqlDataAdapter("Select username,gname,sname,address,state,postcode,mobile,suburb from customers", con);

            con.Open();
            da.Fill(dt);
            con.Close();

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
                ViewState["dt"] = dt;
                ViewState["sort"] = "Asc";
            }
        }
        
        protected void GridView1_Sorting(object sender, EventArgs e)
        {
            DataTable dt1 = (DataTable)ViewState["dt"];
            if (dt1.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sort"]) == "Asc")
                {
                    //dt1.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sort"] = "desc";
                }
                else
                {
                    //dt1.DefaultView.Sort = e.SortExpression + " Asc";
                }
                GridView1.DataSource = dt1;
                GridView1.DataBind();
            }
        } 

    }
}