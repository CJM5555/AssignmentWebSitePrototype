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

namespace AssignmentWebSitePrototype.Artwork
{
    public partial class ArtworkOrder : System.Web.UI.Page
    {
        DataSet orderListData = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();

        int artistID = 1002;

        protected void Page_Load(object sender, EventArgs e)
        {
            refreshOrderList();
        }

        protected void refreshOrderList()
        {
            orderListData.Clear();
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "SELECT OI.OrderItem, AR.imageUrl, AR.title, O.OrderDate, OI.delivered, O.ReceipientName, O.DeliveryAddress " +
                                "FROM Artists A, Artwork AR, [Order] O, OrderItem OI " +
                                "WHERE O.OrderId = OI.OrderID AND " +
                                "OI.artworkID = AR.artworkID AND " +
                                "AR.artistID = A.artistID AND " +
                                "A.artistID = " + artistID +
                                "ORDER BY O.OrderDate ASC ";

            da = new SqlDataAdapter(strSelect, con);
            da.Fill(orderListData);

            orderList.DataSource = orderListData;
            orderList.DataBind();

            con.Close();
        }

        protected void UpdateTrackNo(object sender, CommandEventArgs e)
        {
            if (rfvTrackNo.IsValid)
            {
                string trackNo = txtTrackNo.Text;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(strCon);

                con.Open();
                string strUpdateTrackNo = "UPDATE [OrderItem] SET trackNo=@trackNo,delivered=1 WHERE OrderItem.OrderItem=@OrderItem";
                SqlCommand cmdUpdateTrackNo = new SqlCommand(strUpdateTrackNo, con);
                cmdUpdateTrackNo.Parameters.AddWithValue("@trackNo", trackNo);
                cmdUpdateTrackNo.Parameters.AddWithValue("@OrderItem", e.CommandArgument);
            
                try
                {
                    cmdUpdateTrackNo.ExecuteNonQuery();
                    refreshOrderList();

                    //Send notification to user
                    string strSelectUser = "SELECT Users.email FROM [Order] O, OrderItem OI, Users WHERE O.OrderId = OI.OrderID AND O.userId = Users.userId AND OrderItem.OrderItem=@OrderItem";
                    SqlCommand cmdSelectUser = new SqlCommand(strSelectUser, con);
                    cmdSelectUser.Parameters.AddWithValue("@OrderItem", e.CommandArgument);

                    string userEmail = Convert.ToString(cmdSelectUser.ExecuteScalar());

                    sendEmailNotification(trackNo,userEmail);
                }
                catch
                {
                    Response.Write("<script>alert('Something went wrong!');</script>");
                }

            }
        }

        protected void sendEmailNotification(string trackingNo,string to)
        {
            string from = "artisnotifications@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = "The artwork is being sent to you <br/>" +
                "The tracking number is " + trackingNo;
            message.Subject = "Track Your Order";
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

            catch 
            {
                Response.Write("<script>alert('Something went wrong! Email cannot sent out');</script>");
            }
        }

    }
}