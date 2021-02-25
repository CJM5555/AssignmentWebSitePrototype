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
                string strInsert = "Insert into Users (userName, email, password, accountStatus, isArtist) Values (@nameNew, @emailNew, @passNew, @statusOn, @notArtistYet)";
                cmdInsert = new SqlCommand(strInsert, con);

                cmdInsert.Parameters.AddWithValue("@nameNew", txtNameRegister.Text);
                cmdInsert.Parameters.AddWithValue("@emailNew", txtEmailRegister.Text);
                cmdInsert.Parameters.AddWithValue("@passNew", txtPasswordRegister.Text);
                cmdInsert.Parameters.AddWithValue("@statusOn", true);
                cmdInsert.Parameters.AddWithValue("@notArtistYet", false);
                int n = cmdInsert.ExecuteNonQuery();
                if (n > 0) { 
                    Response.Write("Record is added");
                    isLogin = true;
                }
                else
                    Response.Write("Ops! Unable to register.");
            }
            con.Close();

            if(isLogin)
                btnSubmit1.PostBackUrl = "~/DefaultHome.aspx";

        }
    }
}