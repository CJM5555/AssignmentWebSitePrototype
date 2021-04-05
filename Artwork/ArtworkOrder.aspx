<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="ArtworkOrder.aspx.cs" Inherits="AssignmentWebSitePrototype.Artwork.ArtworkOrder" %>
<%@ Register TagPrefix="Nav" TagName="Bar" Src="~/Artwork/ArtistNavigation.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
                    <tr>
                        <td style="padding:0; padding-top:20px; vertical-align:top">
                            <Nav:Bar ID="navBar" runat="server"/>
                            &nbsp;</td>
                        <td>
                        <br />
                            Orders Placed
                            <asp:TextBox style="float:right" ID="txtTrackNo" runat="server" placeholder="Enter tracking number..."></asp:TextBox>
                            <asp:RequiredFieldValidator style="float:right" ID="rfvTrackNo" runat="server" ErrorMessage="Please fill in the track number " ForeColor="Red" ControlToValidate="txtTrackNo"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:ListView ID="orderList" runat="server">
                                <LayoutTemplate>
                                    <table cellpadding="2" runat="server">
                                    <tr runat="server">
                                        <th runat="server">Order Item</th>
                                        <th runat="server">Order Details</th>
                                        <th runat="server">Delivery Details</th>
                                        <th runat="server"></th>
                                        <th runat="server"></th>
                                    </tr>
                                    <tr runat="server" id="itemPlaceholder"/>
                                    </table>
                                    <asp:DataPager runat="server" ID="artworkDataPager" PageSize="10" class="pager">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true"
                                        FirstPageText="|&lt;&lt; " LastPageText=" &gt;&gt;|"
                                        NextPageText=" &gt; " PreviousPageText=" &lt; " />
                                    </Fields>
                                    </asp:DataPager>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr runat="server" class="zoom">
                                    <td>
                                        <asp:Label runat="Server" Text='<%# "Order Item ID: " + Eval("OrderItem") %>' /><br />
                                        <asp:Image Height="100px" Width="100px" runat="Server" ImageUrl='<%# "~/images/" + Eval("imageUrl") %>' /><br />
                                        <asp:Label runat="Server" Text='<%# "Artwork Title: " + Eval("title") %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="Server" Text='<%# "Order Date: " + Eval("OrderDate") %>' /><br />
                                        <asp:Label runat="Server" Text='<%# "Item Status: " + ((Convert.ToInt16(Eval("delivered")))==0? "Not delivered":"Delivered") %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="Server" Text='<%# "Receipient Name: " + Eval("ReceipientName") %>' />
                                        <br />
                                        <asp:Label runat="Server" Text='<%# "Delivery Address: " + Eval("DeliveryAddress") %>' />
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button runat="server" OnCommand="UpdateTrackNo" CommandName="UpdateTrackNo" Text="Deliver" CommandArgument='<%# Eval("OrderItem") %>' Visible='<%#((Convert.ToInt16(Eval("delivered")))==0? true:false) %>'/>
                                    </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyItemTemplate>
                                    <tr runat="server" class="zoom">
                                    <td>
                                        <asp:Label runat="Server" Text='No Order found' />             
                                    </td>
                                    </tr>
                                </EmptyItemTemplate>

                             </asp:ListView>
                        </td>
                    </tr>
                </table>
</asp:Content>
