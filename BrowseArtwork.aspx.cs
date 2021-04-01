using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWebSitePrototype.Artwork
{
    public partial class BrowseArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();

            string strSelect = "SELECT Artwork.title, Artwork.description, Artwork.imageUrl, Artwork.price, Artwork.quantity, Artists.artistName FROM Artwork INNER JOIN Artists ON Artwork.artistID=Artists.artistID WHERE (Artwork.isDraft = 0)";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            artworkList.DataSource = cmdSelect.ExecuteReader();
            artworkList.DataBind();

            con.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            con.Open();

            string strSelect = "SELECT Artwork.title, Artwork.description, Artwork.imageUrl, Artwork.price, Artwork.quantity, Artists.artistName " +
                "FROM Artwork INNER JOIN Artists ON Artwork.artistID=Artists.artistID " +
                "WHERE (Artwork.isDraft = 0) AND (Artwork.title LIKE @search OR Artwork.description LIKE @search)" +
                "UNION SELECT Artwork.title, Artwork.description, Artwork.imageUrl, Artwork.price, Artwork.quantity, Artists.artistName " +
                "FROM Artwork INNER JOIN Artists ON Artwork.artistID=Artists.artistID, Item_Tag, Tag " +
                "WHERE Artwork.artworkID = Item_Tag.artworkID AND Item_Tag.tagID = Tag.tagID AND Tag.title LIKE @search";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@search", "%" + txtSearch.Text + "%");

            artworkList.DataSource = cmdSelect.ExecuteReader();
            artworkList.DataBind();

            con.Close();
        }
    }
}