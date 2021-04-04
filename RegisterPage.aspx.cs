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
    public partial class RegisterPage : System.Web.UI.Page
    {
        RadioButtonList rdRegisterAs;
        TextBox rgName;
        TextBox rgEmail;
        TextBox rgPassword;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                rdRegisterAs = (RadioButtonList)this.CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RegisterAs");
                rdRegisterAs.SelectedIndex = 0;
            }
               
        }

        protected void btnSubmit1_Click(object sender, EventArgs e)
        {
            

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            rdRegisterAs = (RadioButtonList)this.CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("RegisterAs");
            rgName = (TextBox)this.CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("UserName");
            rgEmail = (TextBox)this.CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Email");
            rgPassword = (TextBox)this.CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("Password");

            
            if (rdRegisterAs.SelectedValue == "Artists")
            {
                string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();

                SqlCommand cmdInsert;
                string strInsert = "Insert into Artists (artistName, email, password, accountStatus, isArtist) Values (@nameNew, @emailNew, @passNew, @statusOn, @isArtist)";
                cmdInsert = new SqlCommand(strInsert, con);

                cmdInsert.Parameters.AddWithValue("@nameNew", rgName.Text);
                cmdInsert.Parameters.AddWithValue("@emailNew", rgEmail.Text);
                cmdInsert.Parameters.AddWithValue("@passNew", rgPassword.Text);
                cmdInsert.Parameters.AddWithValue("@statusOn", true);
                cmdInsert.Parameters.AddWithValue("@isArtist", true);
                int n = cmdInsert.ExecuteNonQuery();

                if (n > 0)
                {
                    Response.Write("Record is added");
                    //isLogin = true;
                }
                else
                    Response.Write("Ops! Unable to register.");

                con.Close();
            }
            else if (rdRegisterAs.SelectedValue == "Customers")
            {
                string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();
              
                SqlCommand cmdInsert;
                string strInsert = "Insert into Users (userName, email, password, accountStatus, isArtist) Values (@nameNew, @emailNew, @passNew, @statusOn, @notArtist)";
                cmdInsert = new SqlCommand(strInsert, con);

                cmdInsert.Parameters.AddWithValue("@nameNew", rgName.Text);
                cmdInsert.Parameters.AddWithValue("@emailNew", rgEmail.Text);
                cmdInsert.Parameters.AddWithValue("@passNew", rgPassword.Text);
                cmdInsert.Parameters.AddWithValue("@statusOn", true);
                cmdInsert.Parameters.AddWithValue("@notArtist", false);
                int n = cmdInsert.ExecuteNonQuery();

                if (n > 0)
                {
                    Response.Write("Record is added");
                    //isLogin = true;
                }
                else
                    Response.Write("Ops! Unable to register.");
                
                con.Close();

            }

            Roles.AddUserToRole(rgName.Text, rdRegisterAs.SelectedItem.Text);
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {

                
        }
    }
}