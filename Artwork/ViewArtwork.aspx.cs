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
            //lblArtworkId.Text = Request.QueryString["artistId"];
            lblArtworkId.Text = 1001.ToString();

            //if (PreviousPage != null && PreviousPage.IsCrossPagePostBack)
            {
                {
                    string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    SqlConnection con = new SqlConnection(strCon);

                    con.Open();

                    string strSelect = "SELECT preview FROM Artwork WHERE artworkID=@artworkID";

                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                    cmdSelect.Parameters.AddWithValue("@artworkID", Int16.Parse(lblArtworkId.Text)); // To be changed

                    object previewImg = cmdSelect.ExecuteScalar();
                    test.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])previewImg);

                    con.Close();
                }
            }
        }

        protected string GetImage(object img)
        {
            return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
        }

        protected void dvArtwork_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            uploadPreview.Visible = !uploadPreview.Visible;
        }

        protected void dvArtwork_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();

            string strUpdate = "UPDATE Artwork SET preview=@preview WHERE artworkID=@artworkID";

            SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

            System.IO.BinaryReader br = new System.IO.BinaryReader(uploadPreview.PostedFile.InputStream);
            byte[] bytes = br.ReadBytes(uploadPreview.PostedFile.ContentLength);

            cmdUpdate.Parameters.AddWithValue("@preview", bytes);
            cmdUpdate.Parameters.AddWithValue("@artworkID", Int16.Parse(lblArtworkId.Text)); // To be changed

            cmdUpdate.ExecuteNonQuery();
            con.Close();

            test.ImageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])bytes);
        }
    }
}