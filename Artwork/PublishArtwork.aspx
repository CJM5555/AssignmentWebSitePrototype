<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="PublishArtwork.aspx.cs" Inherits="AssignmentWebSitePrototype.Artwork.PublishArtwork" %>
<%@ Register TagPrefix="Nav" TagName="Bar" Src="~/Artwork/ArtistNavigation.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
                    <tr>
                        <td style="padding:0; padding-top:20px; vertical-align:top; width:232px">
                            <Nav:Bar ID="navBar" runat="server"/>
                            &nbsp;</td>
                        <td>
                            <br />
                            Publish Artwork<br />

                            <table style:"margin-top:15px">
                                                    <tr>
                        <td>
                            Title</td>
                        <td>
                            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="Artwork Title is required" EnableTheming="True" ForeColor="Red" ValidationGroup="publish"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Preview Image</td>
                        <td>
                            <asp:FileUpload ID="uploadPreview" runat="server"  onchange="imageUploaded()"/>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="uploadPreview" ErrorMessage="Artwork image is required" ForeColor="Red" ValidationGroup="publish"></asp:RequiredFieldValidator>
                            <br />
                            <asp:Image ID="imgPreview" runat="server" Height="200px" ImageUrl="" Width="200px" Visible="False"/>
                            <br />
                            <asp:Label ID="lblImagePath" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description</td>
                        <td>
                            <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDesc" ErrorMessage="Artwork Description is required" ForeColor="Red" ValidationGroup="publish"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Price</td>
                        <td>
                            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number"></asp:TextBox>
                            <br />
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPrice" ErrorMessage="Artwork Price cannot be negative! " MinimumValue="1" MaximumValue="9999999999999" ForeColor="Red" ValidationGroup="publish"></asp:RangeValidator>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPrice" ErrorMessage="Artwork Price is required" ForeColor="Red" ValidationGroup="publish"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Quantity</td>
                        <td>
                            <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number"></asp:TextBox>
                            <br />
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="Artwork Quantity cannot be negative! " MinimumValue="1" MaximumValue="9999999999999" ForeColor="Red" ValidationGroup="publish"></asp:RangeValidator>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Artwork Quantity is required" ForeColor="Red" ValidationGroup="publish"></asp:RequiredFieldValidator>
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
&nbsp;<asp:Button ID="btnPublish" runat="server" Text="Publish" OnClick="storeToDatabase_Click" ValidationGroup="publish" />
                        </td>
                    </tr>
                            </table>

                        </td>
                    </tr>
                </table>
</asp:Content>
