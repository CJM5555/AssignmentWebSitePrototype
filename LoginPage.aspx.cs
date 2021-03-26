using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace AssignmentWebSitePrototype
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegisterPage.aspx");//redirect to register page
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //Boolean isLogin = false;
            string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            SqlCommand cmdSelect;
            string strSelect = "Select * from Users WHERE email= @emailAccount AND password= @pass";
            cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@emailAccount", txtEmailLogin.Text);
            cmdSelect.Parameters.AddWithValue("@pass", txtPasswordLogin.Text);
            SqlDataReader dtrUsers = cmdSelect.ExecuteReader();
            //
            //
            if (dtrUsers.HasRows)
            {
                Session["userEmail"] = txtEmailLogin.Text;
                Session["userPassword"] = txtPasswordLogin.Text;
                Session["userID"] = Convert.ToInt32(dtrUsers["userID"]);
                Session["isLogin"] = 1;
                //isLogin = true;
                Response.Write("records exist");
            }
            else
            {
                Response.Write("No records retrieved");
                Session["isLogin"] = null;
            }
            con.Close();
            //if (isLogin)
            //btnLogin.PostBackUrl = "~/DefaultHome.aspx";
        }
    }
}