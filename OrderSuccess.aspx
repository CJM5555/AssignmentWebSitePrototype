<%@ Page Language="C#" MasterPageFile="~/SiteMain.Master"  AutoEventWireup="true" CodeBehind="OrderSuccess.aspx.cs" Inherits="AssignmentWebSitePrototype.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style23 {
            width: 241px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <br />
            &nbsp;Order Successful! An email notification is sent to your email.<br />
            <br />
            <table style="width:100%;">
                <tr>
                    <td class="auto-style23">Receipient Name</td>
                    <td>
                        <asp:Label ID="lblReceipientName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">Delivery Address</td>
                    <td>
                        <asp:Label ID="lblDeliveryAddress" runat="server"></asp:Label>
                    </td>
                </tr>
                 
                <tr>
                    <td class="auto-style23">Payment Method</td>
                    <td>
                        <asp:Label ID="lblPaymentMethod" runat="server"></asp:Label>
                    </td>
                </tr>
                 
                <tr>
                    <td class="auto-style23">
         <asp:Label ID="Label" runat="server" Text="Total Payment (RM) : "></asp:Label> 
                    </td>
                    <td>
         <asp:Label ID="lblTotal" runat="server"></asp:Label> 
                    </td>
                </tr>
                 
                <tr>
                    <td class="auto-style23">
                        Order Date</td>
                    <td>
         <asp:Label ID="lblOrderDate" runat="server"></asp:Label> 
                    </td>
                </tr>
                 
            </table>
            <br />
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
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoggedUserPage/BrowseArtwork.aspx">Back To Browse Artwork</asp:HyperLink>
            <br />
            <br />
        </div>
</asp:Content>
