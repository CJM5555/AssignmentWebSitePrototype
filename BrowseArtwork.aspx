<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="BrowseArtwork.aspx.cs" Inherits="AssignmentWebSitePrototype.Artwork.BrowseArtwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>

                            <br />
                            Artwork List<br />
                            <asp:TextBox ID="txtSearch" runat="server" TextMode="Search"></asp:TextBox>
                            &nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                            <br />

                            <asp:ListView ID="artworkList" runat="server" DataSourceID="artworkData" GroupItemCount="3">
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
                                        <asp:Button Text="Add To Cart" runat="server"/>
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
                                        <asp:Button Text="Add To Cart" runat="server"/>
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
                                    <asp:DataPager runat="server" ID="artworkDataPager" PageSize="9" class="pager">
                                    <Fields>
                                        <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true"
                                        FirstPageText="|&lt;&lt; " LastPageText=" &gt;&gt;|"
                                        NextPageText=" &gt; " PreviousPageText=" &lt; " />
                                    </Fields>
                                    </asp:DataPager>
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
                            <asp:SqlDataSource ID="artworkData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Artwork.title, Artwork.description, Artwork.imageUrl, Artwork.price, Artwork.quantity, Artists.artistName FROM Artwork INNER JOIN Artists ON Artwork.artistID=Artists.artistID WHERE (Artwork.isDraft = 0)"></asp:SqlDataSource>

                        </td>
                </table>
</asp:Content>
