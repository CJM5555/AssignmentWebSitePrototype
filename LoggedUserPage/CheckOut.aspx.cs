using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWebSitePrototype
{
    public partial class CheckOut : System.Web.UI.Page
    {
        List<int> cartList = new List<int>();
        DataSet cartListData = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();

        int userId = 1001; //to be changed

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

            summaryItemList.DataSource = cartListData;
            summaryItemList.DataBind();

            double totalPayment = 0;
            foreach(DataRow row in cartListData.Tables[0].Rows)
            {
                totalPayment += Convert.ToDouble(row["price"]);
            }
            lblTotalPayment.Text = Convert.ToString(totalPayment);

            con.Close();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            rfvDeliveryAddress.Validate();
            rfvReceipientName.Validate();
            rfvPaymentType.Validate();

            if (rfvDeliveryAddress.IsValid && rfvReceipientName.IsValid && rfvPaymentType.IsValid)
            {
                //Update order database
                DateTime orderDate = DateTime.Now;

                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);

                con.Open();

                string strInsert = "INSERT INTO [Order] VALUES (@ReceipientName,@DeliveryAddress,@PaymentMethod,@TotalPayment,@OrderDate,@userId,@status); SELECT SCOPE_IDENTITY();";

                SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                cmdInsert.Parameters.Clear();
           
                cmdInsert.Parameters.AddWithValue("@ReceipientName", txtReceipientName.Text);
                cmdInsert.Parameters.AddWithValue("@DeliveryAddress", txtDeliveryAddress.Text);
                cmdInsert.Parameters.AddWithValue("@PaymentMethod", rblPaymentType.SelectedValue.ToString());
                cmdInsert.Parameters.AddWithValue("@TotalPayment", Convert.ToDouble(lblTotalPayment.Text));
                cmdInsert.Parameters.AddWithValue("@OrderDate", orderDate);
                cmdInsert.Parameters.AddWithValue("@userId", userId); 
                cmdInsert.Parameters.AddWithValue("@status", "Created"); 

                int orderID = Convert.ToInt16(cmdInsert.ExecuteScalar());
                string strUpdateQty;

                //Update order item database
                foreach (int orderedItem in cartList)
                {
                    strInsert = "INSERT INTO [OrderItem] (orderId,artworkId,delivered) VALUES (@orderId,@artworkId,0)";
                    SqlCommand cmdInsertItem = new SqlCommand(strInsert, con);
               
                    cmdInsertItem.Parameters.Clear();
                    cmdInsertItem.Parameters.AddWithValue("@orderId", orderID);
                    cmdInsertItem.Parameters.AddWithValue("artworkId", orderedItem);
                    cmdInsertItem.ExecuteNonQuery();

                    //Update artwork quantity
                    strUpdateQty = "UPDATE Artwork SET quantity=quantity-1 WHERE artworkID=@artworkID";
                    SqlCommand cmdUpdateQty = new SqlCommand(strUpdateQty, con);

                    cmdUpdateQty.Parameters.Clear();
                    cmdUpdateQty.Parameters.AddWithValue("@artworkID", orderedItem);
                    try
                    {
                        cmdUpdateQty.ExecuteNonQuery();
                    }
                    catch
                    {
                        //Out of stock
                    }
                }

                con.Close();
                sendEmailNotification();
                Response.Redirect("~/LoggedUserPage/OrderSuccess.aspx?" + "name=" + txtReceipientName.Text + "&address=" + txtDeliveryAddress.Text + "&type=" + rblPaymentType.SelectedValue.ToString());
                
            }
        }
 
        protected void sendEmailNotification()
        {
            string to = "jiamin555555@gmail.com"; //To address  (to be changed)

            if (Session["loginEmail"] != null)
            {
                to = Convert.ToString(Session["loginEmail"]);
            }

            string from = "artisnotifications@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = "You have created an order! The details are as followed:<br/>" +
                "Receipient Name: " + txtReceipientName.Text + "<br/>" +
                "Delivery Address: " + txtDeliveryAddress.Text + "<br/>" +
                "Payment type:" + rblPaymentType.SelectedValue.ToString() + "<br/>" +
                "Total Payment:" + lblTotalPayment.Text + "<br/>" +
                "Items: <br/>";

            foreach(DataRow row in cartListData.Tables[0].Rows)
            {
                mailbody += row["title"].ToString() + "<br/>";
            }

            message.Subject = "Order Received";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); 
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("artisnotifications@gmail.com", "artis1234");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}