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
    public partial class Payment : System.Web.UI.Page
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

            try
            {
                lblReceipientName.Text = Request.QueryString["name"];
                lblDeliveryAddress.Text = Request.QueryString["address"];
                lblPaymentMethod.Text = Request.QueryString["type"];
                lblOrderDate.Text = DateTime.Now.Date.ToString();
            }
            catch
            {
                Response.Redirect("~/CheckOut.aspx");
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

            summaryItemList.DataSource = cartListData;
            summaryItemList.DataBind();

            double totalPayment = 0;
            foreach (DataRow row in cartListData.Tables[0].Rows)
            {
                totalPayment += Convert.ToDouble(row["price"]);
            }
            lblTotal.Text = Convert.ToString(totalPayment);

            con.Close();
        }

       

    }

    
}