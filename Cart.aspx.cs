using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWebSitePrototype
{
    public partial class Cart : System.Web.UI.Page
    {
        List<int> cartList = new List<int>();
        DataSet cartListData = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["cartList"] != null)
            {
                cartList = (List<int>)Session["cartList"];

                refreshList();
            }
        }

        protected void refreshList()
        {
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);

            cartListData.Clear();

            con.Open();

            foreach (int item in cartList)
            {
                string strSelect = "SELECT Artwork.artworkID, Artwork.title, Artwork.description, Artwork.imageUrl, Artwork.price " +
                                    "FROM Artwork " +
                                    "WHERE Artwork.artworkID = " + item.ToString();
                da = new SqlDataAdapter(strSelect, con);
                da.Fill(cartListData);
            }

            cartItemList.DataSource = cartListData;
            cartItemList.DataBind();

            con.Close();
        }


        protected void RemoveItem(object sender, CommandEventArgs e)
        {
            cartList.Remove(Convert.ToInt16(e.CommandArgument));
            Session["cartList"] = cartList;

            refreshList();
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CheckOut.aspx");
        }
    }
}