<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="DraftArtwork.aspx.cs" Inherits="AssignmentWebSitePrototype.Artwork.DraftArtwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <br />
                            Drafted artwork<br />
                            <asp:ListView ID="artworkList" runat="server" DataSourceID="artworkData" >
                                <LayoutTemplate>
                                    <table cellpadding="2" runat="server">
                                    <tr runat="server">
                                        <th runat="server">Preview</th>
                                        <th runat="server">Artwork Details</th>
                                        <th runat="server">Price</th>
                                        <th runat="server">Quantity</th>
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
                                    <tr runat="server">
                                    <td>
                                        <asp:Image Height="100px" Width="100px" runat="Server" ImageUrl='<%# GetImage(Eval("preview")) %>' />                                    </td>
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
                                    </tr>
                                </ItemTemplate>

                            </asp:ListView>
                            <asp:SqlDataSource ID="artworkData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [title], [preview], [description], [price], [quantity] FROM [Artwork] WHERE ([isDraft] = @isDraft)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="isDraft" Type="Int16" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
</asp:Content>
