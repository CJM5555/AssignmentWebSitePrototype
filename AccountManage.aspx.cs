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
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //userEmail = Session["userEmail"].ToString();
            //if(userEmail != null) { 
            //id = (int)Session["userID"];
            //}
            //string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
            //SqlConnection con = new SqlConnection(strCon);
            //con.Open();
            //SqlCommand cmdSelect1;
            //string strSelect1 = "Select userID from Users WHERE email= @emailAccount";
            //cmdSelect1 = new SqlCommand(strSelect1, con);

            ////Link
            //cmdSelect1.Parameters.AddWithValue("@emailAccount", "alice@gmail.com");
            ////cmdSelect.Parameters.AddWithValue("@pass", txtPasswordLogin.Text);
            //SqlDataReader dtrUsers = cmdSelect1.ExecuteReader();

            //int userIDNum;
            //if (dtrUsers.HasRows) { 
            //    while (dtrUsers.Read()){
            //        userIDNum = Convert.ToInt32(dtrUsers["userID"]);

            //    }
            //}
            //con.Close();



            //SELECT userID, userName, phoneNo, email, address, state, postcode, city, isArtist FROM Users WHERE(email = @email)
        }

       
    }
}