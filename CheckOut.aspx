<%@ Page Language="C#" MasterPageFile="~/SiteMain.Master"  AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="AssignmentWebSitePrototype.CheckOut" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">\
    <div>
            <br />
            Check Out Details<br />
            <br />
            <br />
            <br />
            Ordered Items<br />
            <br />
                    <asp:ListView ID="summaryItemList" runat="server">
                <LayoutTemplate>
                    <table cellpadding="2" runat="server">
                    <tr runat="server">
                        <th runat="server">Preview</th>
                        <th runat="server">Artwork Details</th>
                        <th runat="server">Price</th>
                    </tr>
                    <tr runat="server" id="itemPlaceholder"/>
                    </table>
                </LayoutTemplate>   
                <ItemTemplate>
                    <tr runat="server" class="zoom">
                    <td>
                        <asp:Image Height="100px" Width="100px" runat="Server" ImageUrl='<%# "~/images/" + Eval("imageUrl") %>' />                                    </td>
                    <td>
                        <asp:Label runat="Server" Text='<%#Eval("title") %>' />
                        <br />
                        <asp:Label runat="Server" Text='<%#Eval("description") %>' />
                    </td>
                    <td>
                        <asp:Label runat="Server" Text='<%#Eval("price") %>' />
                    </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>

            <br />

        </div>
    Shipping &amp; Delivery<br />
    <table style="width:100%;">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Delivery Address"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDeliveryAddress" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Receipient Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtReceipientName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Payment Type"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="rblPaymentType" runat="server">
                    <asp:ListItem>Credit Card</asp:ListItem>
                    <asp:ListItem>Online Banking</asp:ListItem>
                    <asp:ListItem>Tng Ewallet</asp:ListItem>
                    <asp:ListItem>COD</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Total Payment (RM) : "></asp:Label>
    <asp:Label ID="lblTotalPayment" runat="server"></asp:Label>
    <br />
        <asp:Button style="float:right;" ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" />
        <br />
    <br />
    <br />
</asp:Content>
