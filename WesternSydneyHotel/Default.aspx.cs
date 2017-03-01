using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WesternSydneyHotel
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            defineWelcomeMessage();
        }

        protected void defineWelcomeMessage()
        {
            if (HttpContext.Current.User.IsInRole("customer"))
            {
                cusWelcome.Visible = true;
            }
            else if (HttpContext.Current.User.IsInRole("administrator"))
            {
                adminWelcome.Visible = true;
            }
            else
            {
                anonWelcome.Visible = true;
            }
        }
    }
}