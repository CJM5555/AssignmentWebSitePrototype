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
        //Session["loginName"] 
        //Session["loginEmail"] 
        //Session["loginID"] 
       // Session["isLogin"]
        protected void Page_Load(object sender, EventArgs e)
        {

            //userEmail = Session["userEmail"].ToString();
            //if(userEmail != null) { 
            //id = (int)Session["userID"];
            //}
            //string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(strCon)) { 
                //con.Open();
                //SqlCommand cmdSelect1;
            //string strSelect1 = "Select userID from Users WHERE email= @emailAccount";
                //string strSelect1 = "SELECT userID, userName, phoneNo, email, address, city, postcode, state FROM Users WHERE email = @email";
                //cmdSelect1 = new SqlCommand(strSelect1, con);
            ////Link
                //cmdSelect1.Parameters.AddWithValue("@email", "alice@gmail.com");
            //cmdSelect.Parameters.AddWithValue("@pass", txtPasswordLogin.Text);
               // SqlDataReader dtrUsers = cmdSelect1.ExecuteReader();
                //dvcAccountDetails.DataSource = dtrUsers;
                //dvcAccountDetails.DataBind();
            
            //con.Close();
            }

        


        //SELECT userID, userName, phoneNo, email, address, state, postcode, city, isArtist FROM Users WHERE(email = @email)
    }

       
    
}