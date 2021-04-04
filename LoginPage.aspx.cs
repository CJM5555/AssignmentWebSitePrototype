using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;


namespace AssignmentWebSitePrototype
{
    public partial class LoginPage : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                RadioButtonList rdlLoginAs = (RadioButtonList)Login1.FindControl("LoginAs");
                rdlLoginAs.SelectedIndex = 0;
            }

            if (Session["failLoginArtist"] != null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Artist Account Records is Found! Have You Select The Correct Login Type?')", true);
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Account is Found!')", true);
                Session.Remove("failLoginArtist");
            }else if(Session["failLoginCustomer"] !=null)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Customer Account Records is Found! Have You Select The Correct Login Type?')", true);
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Account is Found!')", true);
                Session.Remove("failLoginCustomer");
            }


        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegisterPage.aspx");//redirect to register page
        }


        protected void LoginButton_Click1(object sender, EventArgs e)
        {
            RadioButtonList rdlLoginAs = (RadioButtonList)Login1.FindControl("LoginAs");
            TextBox lgName = (TextBox)Login1.FindControl("UserName");
            TextBox lgPassword = (TextBox)Login1.FindControl("Password");
           
            
            if (rdlLoginAs.SelectedValue == "Artists")
            {

                string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmdSelect;
                string strSelect = "Select * from Artists WHERE artistName= @user AND password= @pass";
                cmdSelect = new SqlCommand(strSelect, con);


                cmdSelect.Parameters.AddWithValue("@user", lgName.Text);
                cmdSelect.Parameters.AddWithValue("@pass", lgPassword.Text);
                SqlDataReader dtrUsers = cmdSelect.ExecuteReader();
                //
                //
                if (dtrUsers.HasRows)
                {
                    dtrUsers.Read();

                    Session["loginName"] = dtrUsers["artistName"].ToString();
                    Session["loginEmail"] = dtrUsers["email"].ToString();
                    Session["loginID"] = Convert.ToInt32(dtrUsers["artistID"]);
                    Session["isLogin"] = 1;
                    Session["loginRole"] = "Artists";
                    //Response.Write("records exist");
                    con.Close();
                }
                else
                {
                    Session["failLoginArtist"] = 1;
                    FormsAuthentication.SignOut();
                    FormsAuthentication.RedirectToLoginPage();
                    Response.Redirect(FormsAuthentication.LoginUrl);
                    //Response.Write();
                    
                    con.Close();

                }
               
            }
            else if (rdlLoginAs.SelectedValue == "Customers")
            {
                string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmdSelect;
                string strSelect = "Select * from Users WHERE userName= @user AND password= @pass";
                cmdSelect = new SqlCommand(strSelect, con);

                cmdSelect.Parameters.AddWithValue("@user", lgName.Text);
                cmdSelect.Parameters.AddWithValue("@pass", lgPassword.Text);
                SqlDataReader dtrUsers = cmdSelect.ExecuteReader();
                //
                //
                if (dtrUsers.HasRows)
                {
                    dtrUsers.Read();
                    Session["loginEmail"] = dtrUsers["email"].ToString();
                    Session["loginName"] = dtrUsers["userName"].ToString();
                    Session["loginID"] = Convert.ToInt32(dtrUsers["userID"]);
                    Session["isLogin"] = 1;
                    Session["loginRole"] = "Customers";

                }
                else
                {
                    Session["failLoginCustomer"] = 1;
                    //Response.Write("No records retrieved");
                    FormsAuthentication.SignOut();
                    FormsAuthentication.RedirectToLoginPage();
                    Response.Redirect(FormsAuthentication.LoginUrl);
                }
                con.Close();

                
            }

    
        }
    }
}