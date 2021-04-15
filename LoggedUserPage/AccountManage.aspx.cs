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
        String usersEmail = null;
        String usersName = null;
        int id;
        string role;
        //Session["loginName"] 
        //Session["loginEmail"] 
        //Session["loginID"] 
        //Session["isLogin"]
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["loginName"] != null)
            {
                usersEmail = Session["loginEmail"].ToString();
                usersName = Session["loginName"].ToString();
                id = (int)Session["loginID"];
                role = Session["loginRole"].ToString();
            }


            if (role == "Artists")
            {
                string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmdSelect1;
                string strSelect1 = "Select profileImage from Artists WHERE artistName = @artistName";
                cmdSelect1 = new SqlCommand(strSelect1, con);
                cmdSelect1.Parameters.AddWithValue("@artistName", usersName);

                String dtrImg = cmdSelect1.ExecuteScalar().ToString();
                ProfileImage.ImageUrl = "~/image/ProfileImg/" + dtrImg.ToString();
                Session["ProfileImage"] = dtrImg.ToString();
                con.Close();
            }
            else if (role == "Customers")
            {
                string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmdSelect1;
                string strSelect1 = "Select profileImage from Users WHERE userName = @userName";
                cmdSelect1 = new SqlCommand(strSelect1, con);
                cmdSelect1.Parameters.AddWithValue("@userName", usersName);

                String dtrImg = cmdSelect1.ExecuteScalar().ToString();

                ProfileImage.ImageUrl = "~/image/ProfileImg/" + dtrImg.ToString();
                Session["ProfileImage"] = dtrImg.ToString();
                con.Close();
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FileUpload1.Visible = true;
            btnSaveImg.Visible = true;
        }

        protected void btnSaveImg_Click(object sender, EventArgs e)
        {
            
            string imagePath = Server.MapPath("/images/ProfileImg/" + Session["ProfileImage"].ToString());
            FileUpload1.SaveAs(imagePath);

            if (role == "Artists")
            {
                string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmdUpdate;

                string strUpdate = "UPDATE [Artists] SET [profileImage] = @profileImage WHERE [artistID] = @artistID";
                cmdUpdate = new SqlCommand(strUpdate, con);
                cmdUpdate.Parameters.AddWithValue("@profileImage", Session["ProfileImage"].ToString());
                cmdUpdate.Parameters.AddWithValue("@artistID", id);
                cmdUpdate.ExecuteNonQuery();
                con.Close();
            }
            else if (role == "Customers")
            {
                string strCon = ConfigurationManager.ConnectionStrings["conDatabase"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);
                con.Open();
                SqlCommand cmdUpdate;

                string strUpdate = "UPDATE [Users] SET [profileImage] = @profileImage WHERE [userID] = @userID";
                cmdUpdate = new SqlCommand(strUpdate, con);
                cmdUpdate.Parameters.AddWithValue("@profileImage", Session["ProfileImage"].ToString());
                cmdUpdate.Parameters.AddWithValue("@userID", id);
                con.Close();
            }
            FileUpload1.Visible = false;
            btnSaveImg.Visible = false;
        }

        






        //SELECT userID, userName, phoneNo, email, address, state, postcode, city, isArtist FROM Users WHERE(email = @email)
    }

       
    
}
