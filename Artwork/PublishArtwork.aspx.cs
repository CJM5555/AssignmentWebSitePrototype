using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace AssignmentWebSitePrototype.Artwork
{
    public partial class PublishArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void storeToDatabase_Click(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();

            string strInsert = "INSERT INTO Artwork (artistID,title,description,preview,price,quantity,isDraft) VALUES (@artistID,@title,@desc,@preview,@price,@quantity,@isDraft)";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);
            cmdInsert.Parameters.AddWithValue("@artistID", 1006); // To be changed
            cmdInsert.Parameters.AddWithValue("@title", txtTitle.Text);
            cmdInsert.Parameters.AddWithValue("@desc", txtDesc.Text);

            BinaryReader br = new BinaryReader(uploadPreview.PostedFile.InputStream);
            byte[] bytes = br.ReadBytes(uploadPreview.PostedFile.ContentLength);

            cmdInsert.Parameters.AddWithValue("@preview", bytes);
            cmdInsert.Parameters.AddWithValue("@price", Double.Parse(txtPrice.Text));
            cmdInsert.Parameters.AddWithValue("@quantity", Int16.Parse(txtQuantity.Text));

            if (sender.Equals(btnDraft))
            {
                cmdInsert.Parameters.AddWithValue("@isDraft", 1);
            }
            else
            {
                cmdInsert.Parameters.AddWithValue("@isDraft", 0);
            }

            cmdInsert.ExecuteNonQuery();
            con.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string tags = txtTag.Text;

            if (lblTags.Text.Equals(""))
            {
                lblTags.Text += tags;
            }
            else
            {
                lblTags.Text += ", " + tags;
            }
        }
    }
}