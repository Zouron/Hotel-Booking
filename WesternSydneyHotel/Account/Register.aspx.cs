using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WesternSydneyHotel.Models;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WesternSydneyHotel.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {

                String connectionString = WebConfigurationManager.ConnectionStrings["customerConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                string sql;
                sql = "insert customers (username, gname, sname, address, state, postcode, mobile, suburb) values (@Email, @gName, @sName, @address, @state, @postCode, @mobileP, @suburb)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("Email", Email.Text);
                cmd.Parameters.AddWithValue("gName", gName.Text);
                cmd.Parameters.AddWithValue("sName", sName.Text);
                cmd.Parameters.AddWithValue("address", address.Text);
                cmd.Parameters.AddWithValue("state", state.SelectedValue);
                cmd.Parameters.AddWithValue("postCode", postCode.Text);
                cmd.Parameters.AddWithValue("mobileP", mobileP.Text);
                cmd.Parameters.AddWithValue("suburb", suburb.Text);


                using (con)
                {
                    con.Open();
                    int rowCount = cmd.ExecuteNonQuery();
                    if (rowCount > 0)
                        lblResult.Text = "Success. New User Inserted";
                }
                // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }

            // Add the registered user to the role of "customer"
            IdentityResult resultAdd = manager.AddToRole(manager.FindByEmail(Email.Text).Id, "customer");
            if (resultAdd.Succeeded)
            {
                // on success, sign in this user and redirect this user to ReturnUrl
                signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                // display the error message otherwise
                ErrorMessage.Text = resultAdd.Errors.FirstOrDefault();
            }
        }

        

    }
}