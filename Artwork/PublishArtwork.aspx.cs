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

            if (Request.UrlReferrer!= null && Request.UrlReferrer.AbsolutePath.Equals("/Artwork/DraftArtwork.aspx"))
            {
                retrieveDraft();
            }

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

        protected void retrieveDraft()
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();

            string strSelect = "SELECT title,description,imageUrl,price,quantity FROM Artwork WHERE artworkID=@artworkID";

            SqlCommand cmdInsert = new SqlCommand(strSelect, con);
            cmdInsert.Parameters.AddWithValue("@artworkID", Request.QueryString["artworkID"]);

            SqlDataReader reader = cmdInsert.ExecuteReader();
            while (reader.Read())
            {
                txtTitle.Text = (string)reader[0];
                txtDesc.Text = (string)reader[1];
                lblImagePath.Text = (string)reader[2];
                txtPrice.Text = reader[3].ToString();
                txtQuantity.Text = reader[4].ToString();
            }
            con.Close();

            imgPreview.ImageUrl = "~/images/" + lblImagePath.Text;
            imgPreview.Visible = true;
        }

        protected void storeToDatabase_Click(object sender, EventArgs e)
        {
            rfvTitle.Validate();

            if (rfvTitle.IsValid) {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);

                con.Open();

                string strInsert = "INSERT INTO Artwork (artistID,title,description,imageUrl,price,quantity,isDraft) VALUES (@artistID,@title,@desc,@imageUrl,@price,@quantity,@isDraft)";

                SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                cmdInsert.Parameters.AddWithValue("@artistID", 1002); // To be changed
                cmdInsert.Parameters.AddWithValue("@title", txtTitle.Text == null? null: txtTitle.Text);
                cmdInsert.Parameters.AddWithValue("@desc", txtDesc.Text == null? null : txtDesc.Text);

                if (Session["ImageUpload"] != null)
                {
                    uploadPreview = (FileUpload)Session["ImageUpload"];
                    string imagePath = Server.MapPath("/images/" + lblImagePath.Text);
                    uploadPreview.SaveAs(imagePath);

                    cmdInsert.Parameters.AddWithValue("@imageUrl", lblImagePath.Text);
                }
                else
                {
                    cmdInsert.Parameters.AddWithValue("@imageUrl", "");
                }

                cmdInsert.Parameters.AddWithValue("@price", Double.Parse(txtPrice.Text == "" ? "0" : txtPrice.Text));
                cmdInsert.Parameters.AddWithValue("@quantity", Int16.Parse(txtQuantity.Text == "" ? "0" : txtQuantity.Text));

                if (sender.Equals(btnDraft))
                {
                    cmdInsert.Parameters.AddWithValue("@isDraft", 1);
                    cmdInsert.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("~/Artwork/DraftArtwork.aspx");
                }
                else
                {
                    cmdInsert.Parameters.AddWithValue("@isDraft", 0);
                    cmdInsert.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("~/Artwork/ArtistDashboard.aspx");
                }
            }
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