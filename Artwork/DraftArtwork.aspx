<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="DraftArtwork.aspx.cs" Inherits="AssignmentWebSitePrototype.Artwork.DraftArtwork" %>
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
                            Drafted artwork<br />
                            <br />
                            <asp:ListView ID="artworkList" runat="server" DataSourceID="artworkData" >
                                <LayoutTemplate>
                                    <table cellpadding="2" runat="server">
                                    <tr runat="server">
                                        <th runat="server">Preview</th>
                                        <th runat="server">Artwork Details</th>
                                        <th runat="server">Price</th>
                                        <th runat="server">Quantity</th>
                                        <th></th>
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
                                        <asp:Image Height="100px" Width="100px" runat="Server" ImageUrl='<%# "~/images/" + Eval("imageUrl") %>' />                                    </td>
                                    <td>
                                        <asp:Label runat="Server" Text='<%#Eval("title") %>' />
                                        <br />
                                        <asp:Label runat="Server" Text='<%#Eval("description") %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="Server" Text='<%#Eval("price") %>' />
                                    </td>
                                    <td>
                                        <asp:Label runat="Server" Text='<%#Eval("quantity") %>' />
                                    </td>
                                    <td>
                                        <asp:Button runat="Server" Text='Publish' OnClick='buttonClick' CommandArgument='<%#Eval("artworkID")%>' CommandName='publish'/>
                                    </td>
                                    </tr>
                                </ItemTemplate>
                                <EmptyItemTemplate>
                                    <tr runat="server" class="zoom">
                                    <td>
                                        <asp:Label runat="Server" Text='No Draft found' />             
                                    </td>
                                    </tr>
                                </EmptyItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="artworkData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artworkID], [title], [imageUrl], [description], [price], [quantity] FROM [Artwork] WHERE ([isDraft] = @isDraft) AND artistID=@artistID">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="isDraft" Type="Int16" />
                                    <asp:SessionParameter DefaultValue="1001" Name="artistID" SessionField="loginID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
</asp:Content>
