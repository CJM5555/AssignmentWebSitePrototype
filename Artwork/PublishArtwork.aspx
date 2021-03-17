<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="PublishArtwork.aspx.cs" Inherits="AssignmentWebSitePrototype.Artwork.PublishArtwork" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
                    <tr>
                        <td rowspan="8">
                            &nbsp;</td>
                        <td colspan="2">
                            Publish Artwork</td>
                    </tr>
                    <tr>
                        <td>
                            Title</td>
                        <td>
                            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Preview Image</td>
                        <td>
                            <asp:FileUpload ID="uploadPreview" runat="server"  onchange="imageUploaded()"/>
                            <br />
                            <asp:Image ID="imgPreview" runat="server" Height="200px" ImageUrl="" Width="200px" Visible="False"/>
                            <asp:Label ID="lblImagePath" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description</td>
                        <td>
                            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Price</td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Quantity</td>
                        <td>
                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tags</td>
                        <td>
                            <asp:DropDownList ID="ddlTags" runat="server" DataSourceID="tagData" DataTextField="title" DataValueField="tagID">
                            </asp:DropDownList>
                            &nbsp;<asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                            <asp:SqlDataSource ID="tagData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Tag]"></asp:SqlDataSource>
&nbsp;<br />
                            <asp:Label ID="lblTags" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnDraft" runat="server" Text="Save As Draft" OnClick="storeToDatabase_Click" />
&nbsp;<asp:Button ID="btnPublish" runat="server" Text="Publish" OnClick="storeToDatabase_Click" />
                        </td>
                    </tr>
                </table>
</asp:Content>
