using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace AssignmentWebSitePrototype
{
    public partial class SiteMain : System.Web.UI.MasterPage
    {
        String userEmail = null;
        String userPass = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           
 
            //if (Session["email"] != null && Session["password"] != null)
            if (Session["isLogin"] != null)
             {
                    userEmail = Session["loginEmail"].ToString();
                    btnRegister.Visible = false;  
                    linkAccount.Text = userEmail;
                    linkAccount.Visible = true;

             }
             else
             {
                    btnRegister.Visible = true;
                    linkAccount.Text = null;
                    linkAccount.Visible = false;
              }

           

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/RegisterPage.aspx");//redirect to register page
        }


        protected void linkAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoggedUserPage/AccountManage.aspx");
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Session.Abandon();
        }
    }
}