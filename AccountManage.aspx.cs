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
    public partial class AccountManage : System.Web.UI.Page
    {
        String userEmail = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //userEmail = Session["userEmail"].ToString();
            string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
           // con.Open();
            //SqlCommand cmdSelect;
            //string strSelect = "Select * from Users WHERE email= @emailAccount";
           //cmdSelect = new SqlCommand(strSelect, con);

            //Link
            // cmdSelect.Parameters.AddWithValue("@emailAccount", userEmail);
            //cmdSelect.Parameters.AddWithValue("@pass", txtPasswordLogin.Text);
            // SqlDataReader dtrUsers = cmdSelect.ExecuteReader();
            //con.Close();
            //SELECT userID, userName, phoneNo, email, address, state, postcode, city, isArtist FROM Users WHERE(email = @email)
        }

        
    }
}