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
            uploadPreview.Attributes["onchange"] = "this.form.submit()";

            if (IsPostBack && uploadPreview.HasFile)
            {
                uploadPreview.Visible = false;
                Session["ImageUpload"] = uploadPreview;
                lblImagePath.Text = uploadPreview.FileName;

                System.IO.BinaryReader br = new System.IO.BinaryReader(uploadPreview.PostedFile.InputStream);
                imgPreview.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(br.ReadBytes(uploadPreview.PostedFile.ContentLength));
                imgPreview.Visible = true;
            }
        }

        protected void storeToDatabase_Click(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();

            string strInsert = "INSERT INTO Artwork (artistID,title,description,imageUrl,price,quantity,isDraft) VALUES (@artistID,@title,@desc,@imageUrl,@price,@quantity,@isDraft)";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);
            cmdInsert.Parameters.AddWithValue("@artistID", 1002); // To be changed
            cmdInsert.Parameters.AddWithValue("@title", txtTitle.Text);
            cmdInsert.Parameters.AddWithValue("@desc", txtDesc.Text);

            uploadPreview = (FileUpload) Session["ImageUpload"];
            string imagePath = Server.MapPath("/images/" + lblImagePath.Text);
            uploadPreview.SaveAs(imagePath);

            cmdInsert.Parameters.AddWithValue("@imageUrl", lblImagePath.Text);
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
            string tags = ddlTags.SelectedItem.ToString();

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