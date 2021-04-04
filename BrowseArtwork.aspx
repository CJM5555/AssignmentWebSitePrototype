<%@ Page Title="" Language="C#" enableEventValidation="false" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="BrowseArtwork.aspx.cs" Inherits="AssignmentWebSitePrototype.Artwork.BrowseArtwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>

                            <asp:HyperLink style="float:right; text-decoration:none; " ID="cartHyperlink" runat="server" NavigateUrl="~/Cart.aspx" Text="Cart"></asp:HyperLink>
                            &nbsp;
                            <br />
                            <div style="width:100%; padding:0px 50px 0px 50px;">
                            Artwork List<br />
                            <asp:TextBox ID="txtSearch" runat="server" TextMode="Search" Width="560px" placeholder="Please input keywords like artwork title, desciptrion or tags"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                            </div>
                            <br />

                            <asp:ListView ID="artworkList" runat="server" GroupItemCount="3">
                                <AlternatingItemTemplate>
                                    <td runat="server" style="">
                                        <asp:Image runat="server" ID="preview" ImageUrl='<%# "~/images/" + Eval("imageUrl") %>' Width="200px" Height="200px" />
                                        <br />Title:
                                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                        <br />Description:
                                        <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                                        <br />Price:
                                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                        <br />Quantity:
                                        <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                                        <br />Artist Name:
                                        <asp:Label ID="artistNameLabel" runat="server" Text='<%# Eval("artistName") %>' />
                                        <br /><br />
                                        <asp:Button Text="Add To Cart" runat="server" CommandName="AddToCart" OnCommand="AddToCart" CommandArgument='<%# Eval("artworkID")  %>'/>
                                    </td>
                                </AlternatingItemTemplate>
                                <EmptyDataTemplate>
                                    <table runat="server" style="">
                                        <tr>
                                            <td>No data was returned.</td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <EmptyItemTemplate>
                                    <td runat="server" />
                                </EmptyItemTemplate>
                                <GroupTemplate>
                                    <tr id="itemPlaceholderContainer" runat="server">
                                        <td id="itemPlaceholder" runat="server"></td>
                                    </tr>
                                </GroupTemplate>
                                <ItemTemplate>
                                    <td runat="server" style="">
                                        <asp:Image runat="server" ID="preview" ImageUrl='<%# "~/images/" + Eval("imageUrl") %>' Width="200px" Height="200px" />
                                        <br />Title:
                                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                        <br />Description:
                                        <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                                        <br />Price:
                                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                        <br />Quantity:
                                        <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                                        <br />Artist Name:
                                        <asp:Label ID="artistNameLabel" runat="server" Text='<%# Eval("artistName") %>' />
                                        <br /><br />
                                        <asp:Button Text="Add To Cart" runat="server"  CommandName="AddToCart" OnCommand="AddToCart" CommandArgument='<%# Eval("artworkID")  %>'/>
                                    </td>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                                    <tr id="groupPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <td runat="server" style="">
                                        <asp:Image runat="server" ID="preview" ImageUrl='<%# "~/images/" + Eval("imageUrl") %>' Width="200px" Height="200px" />
                                        <br />Title:
                                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                                        <br />Description:
                                        <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                                        <br />Price:
                                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                                        <br />Quantity:
                                        <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>' />
                                        <br />Artist Name:
                                        <asp:Label ID="artistNameLabel" runat="server" Text='<%# Eval("artistName") %>' />
                                        <br /></td>
                                </SelectedItemTemplate>
                            </asp:ListView>

                        </td>
                </table>
</asp:Content>
