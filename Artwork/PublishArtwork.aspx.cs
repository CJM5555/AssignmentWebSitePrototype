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
        List<int> tagList = new List<int>();

        protected void Page_Load(object sender, EventArgs e)
        {
            uploadPreview.Attributes["onchange"] = "this.form.submit()";

            if (Request.UrlReferrer != null && Request.UrlReferrer.AbsolutePath.Equals("/Artwork/DraftArtwork.aspx"))
            {
                retrieveDraft();
            }

            if (IsPostBack && uploadPreview.HasFile)
            {
                uploadPreview.Visible = false;
                Cache.Insert("ImageUpload", uploadPreview);
                lblImagePath.Text = uploadPreview.FileName;

                System.IO.BinaryReader br = new System.IO.BinaryReader(uploadPreview.PostedFile.InputStream);
                imgPreview.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(br.ReadBytes(uploadPreview.PostedFile.ContentLength));
                imgPreview.Visible = true;
            }

            if (Session["TagList"] != null)
            {
                tagList = (List<int>)Session["TagList"];
            }
        }

        protected void retrieveDraft()
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();

            string strSelect = "SELECT title,description,imageUrl,price,quantity FROM Artwork WHERE artworkID=@artworkID";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            cmdSelect.Parameters.AddWithValue("@artworkID", Request.QueryString["artworkID"]);

            SqlDataReader reader = cmdSelect.ExecuteReader();
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

                //Update Artwork database
                string strInsert = "INSERT INTO Artwork (artistID,title,description,imageUrl,price,quantity,isDraft) VALUES (@artistID,@title,@desc,@imageUrl,@price,@quantity,@isDraft); SELECT SCOPE_IDENTITY();";

                SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                cmdInsert.Parameters.AddWithValue("@artistID", Convert.ToInt16(Session["loginID"])); // To be changed
                cmdInsert.Parameters.AddWithValue("@title", txtTitle.Text == null? null: txtTitle.Text);
                cmdInsert.Parameters.AddWithValue("@desc", txtDesc.Text == null? null : txtDesc.Text);

                if (Cache["ImageUpload"] != null)
                {
                    uploadPreview = (FileUpload)Cache["ImageUpload"];
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

                int artworkID;
                if (sender.Equals(btnDraft))
                {
                    cmdInsert.Parameters.AddWithValue("@isDraft", 1);
                    try
                    {
                        artworkID = Convert.ToInt16(cmdInsert.ExecuteScalar());
                        updateTagItem(artworkID, con);
                    }
                    catch
                    {
                        Response.Write("<script>alert('Something went wrong! Please relogin your account');</script>");
                    }
                    con.Close();
                    Response.Redirect("~/Artwork/DraftArtwork.aspx");
                }
                else
                {
                    cmdInsert.Parameters.AddWithValue("@isDraft", 0);
                    try
                    {
                        artworkID = Convert.ToInt16(cmdInsert.ExecuteScalar());
                        updateTagItem(artworkID, con);
                    }
                    catch
                    {
                        Response.Write("<script>alert('Something went wrong! Please relogin your account');</script>");
                    }
                    con.Close();
                    Response.Redirect("~/Artwork/ArtistDashboard.aspx");
                }
            }
        }

        protected void updateTagItem(int artworkID, SqlConnection con)
        {
            foreach(int tagID in tagList)
            {
                //Update Item_Tag database
                string strTagInsert = "INSERT INTO Item_Tag (artworkID,tagID) VALUES (@artworkID,@tagID)";

                SqlCommand cmdTagInsert = new SqlCommand(strTagInsert, con);
                cmdTagInsert.Parameters.AddWithValue("@artworkID", artworkID);
                cmdTagInsert.Parameters.AddWithValue("@tagID",tagID);
                cmdTagInsert.ExecuteNonQuery();
            }
            Session["TagList"] = null;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string tags = ddlTags.SelectedItem.ToString();

            if (lblTags.Text.Equals(""))
            {
                lblTags.Text += tags;
                tagList.Add(Int32.Parse(ddlTags.SelectedItem.Value));
            }
            else
            {
                if (!(tagList.Contains(Int32.Parse(ddlTags.SelectedItem.Value)))){
                    lblTags.Text += ", " + tags;
                    tagList.Add(Int32.Parse(ddlTags.SelectedItem.Value));
                }
            }
            btnClearTag.Visible = true;
            Session["TagList"] = tagList;
        }

        protected void btnClearTag_Click(object sender, EventArgs e)
        {
            Session["TagList"] = null;
            lblTags.Text = "";
            btnClearTag.Visible = false;
        }

    }
}