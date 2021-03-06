using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                    userEmail = Session["userEmail"].ToString();
                    userPass = Session["userPassword"].ToString();
                   
                    btnLogout.Visible = true;
                    btnLogin.Visible = false;
                    btnRegister.Visible = false;
                    lblGuest.Visible = false;
                    linkAccount.Text = userEmail;
                    linkAccount.Visible = true;

                }
                else
                {
                    btnLogout.Visible = false;
                    btnLogin.Visible = true;
                    btnRegister.Visible = true;
                    linkAccount.Text = null;
                    lblGuest.Visible = true;
                    linkAccount.Visible = false;
                }

           

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/RegisterPage.aspx");//redirect to register page
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("~/LoginPage.aspx");//redirect to register page
        }
       
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["userEmail"] = null;
            Session["userPassword"] = null;
            Session["isLogin"] = null;
        }


        protected void linkAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AccountManage.aspx");
        }
    }
}