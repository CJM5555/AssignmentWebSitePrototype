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
    public partial class RegisterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit1_Click(object sender, EventArgs e)
        {
            

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            Boolean isLogin = false;
            string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            SqlCommand cmdSelect;
            string strSelect = "Select * from Users WHERE email= @emailAccount";
            cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@emailAccount", txtEmailRegister.Text);

            SqlDataReader dtrUsers = cmdSelect.ExecuteReader();
            //
            //
            if (dtrUsers.HasRows)
            {
                Response.Write("Email already exist");
                dtrUsers.Close();
            }
            else
            {

                dtrUsers.Close();
                SqlCommand cmdInsert;
                string strInsert = "Insert into Users (userName, email, password, accountStatus, isArtist) Values (@nameNew, @emailNew, @passNew, @statusOn, @notArtist)";
                cmdInsert = new SqlCommand(strInsert, con);


                TextBox rgName = (TextBox)this.CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
                TextBox rgEmail = (TextBox)this.CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Email");
                TextBox rgPassword = (TextBox)this.CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Password");
                cmdInsert.Parameters.AddWithValue("@nameNew", rgName.Text);
                cmdInsert.Parameters.AddWithValue("@emailNew", rgEmail.Text);
                cmdInsert.Parameters.AddWithValue("@passNew", rgPassword.Text);
                cmdInsert.Parameters.AddWithValue("@statusOn", true);
                cmdInsert.Parameters.AddWithValue("@notArtist", false);
                int n = cmdInsert.ExecuteNonQuery();
                if (n > 0)
                {
                    Response.Write("Record is added");
                    isLogin = true;
                }
                else
                    Response.Write("Ops! Unable to register.");
            }
            con.Close();

            //if (isLogin)
               // btnSubmit1.PostBackUrl = "~/DefaultHome.aspx";
        }
    }
}