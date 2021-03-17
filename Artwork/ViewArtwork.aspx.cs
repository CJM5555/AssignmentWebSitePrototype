using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace AssignmentWebSitePrototype.Artwork
{
    public partial class ViewArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblArtworkId.Text = Request.QueryString["artworkId"];
            uploadPreview.Attributes["onchange"] = "this.form.submit()";

            if (IsPostBack && uploadPreview.HasFile)
            {
                uploadPreview.Visible = false;
                Session["ImageUpload"] = uploadPreview;
                lblImagePath.Text = uploadPreview.FileName;
                uploadPreview.Visible = !uploadPreview.Visible;

                System.IO.BinaryReader br = new System.IO.BinaryReader(uploadPreview.PostedFile.InputStream);
                image.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String(br.ReadBytes(uploadPreview.PostedFile.ContentLength));
            }
            else
            {
                try{
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(strCon);

                    con.Open();

                    string strSelect = "SELECT imageUrl FROM Artwork WHERE artworkID=@artworkID";

                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                    cmdSelect.Parameters.AddWithValue("@artworkID", Int16.Parse(lblArtworkId.Text)); // To be changed

                    object previewImg = cmdSelect.ExecuteScalar();
                    image.ImageUrl = "~/images/" + previewImg;

                    con.Close();
                }
                catch(Exception ex)
                {
                    //Invalid artworkID provided in querystring
                }
            }

        }

        protected void dvArtwork_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            uploadPreview.Visible = !uploadPreview.Visible;
        }

        protected void dvArtwork_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            if (Session["ImageUpload"] != null)
            {
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);

                con.Open();

                string strUpdate = "UPDATE Artwork SET imageUrl=@imageUrl WHERE artworkID=@artworkID";

                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                uploadPreview = (FileUpload)Session["ImageUpload"];
                string imagePath = Server.MapPath("/images/" + lblImagePath.Text);
                uploadPreview.SaveAs(imagePath);

                cmdUpdate.Parameters.AddWithValue("@imageUrl", lblImagePath.Text);
                cmdUpdate.Parameters.AddWithValue("@artworkID", Int16.Parse(lblArtworkId.Text)); // To be changed

                cmdUpdate.ExecuteNonQuery();
                con.Close();

                image.ImageUrl = "~/images/" + lblImagePath.Text;
            }
        }
    }
}