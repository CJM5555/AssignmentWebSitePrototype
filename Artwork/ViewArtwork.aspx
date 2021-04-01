<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="ViewArtwork.aspx.cs" Inherits="AssignmentWebSitePrototype.Artwork.ViewArtwork" %>
<%@ Register TagPrefix="Nav" TagName="Bar" Src="~/Artwork/ArtistNavigation.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
                    <tr>
                        <td style="padding:0; padding-top:20px; vertical-align:top">
                            <Nav:Bar ID="navBar" runat="server"/>
                            &nbsp;</td>
                        <td style="width:50%">
                            <asp:HyperLink ID="hBack" runat="server" NavigateUrl="~/Artwork/ArtistDashboard.aspx">Back To Dashboard</asp:HyperLink>
                            <br />
                            <br />
                           <asp:Image Width="500px" Height="500px" ID="image" runat="server" />
                            <br />
                            <asp:FileUpload ID="uploadPreview" runat="server" Visible="False" />
                            <asp:Label ID="lblImagePath" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td style="width:50%">
                            Artwork Id :
                            <asp:Label ID="lblArtworkId" runat="server"></asp:Label>
                            <br />
                            <asp:DetailsView ID="dvArtwork" runat="server" DataSourceID="artworkData" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="artworkID" OnModeChanging="dvArtwork_ModeChanging" OnItemUpdating="dvArtwork_ItemUpdating">
                                <EmptyDataTemplate>
                                    No Artwork found!
                                </EmptyDataTemplate>
                                <Fields>
                                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                                    <asp:TemplateField HeaderText="price" SortExpression="price">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="quantity" SortExpression="quantity">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Button" ShowEditButton="true" />
                                </Fields>
                            </asp:DetailsView>
                            <asp:SqlDataSource ID="artworkData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artworkID], [title], [description], [price], [quantity] FROM [Artwork] WHERE ([artworkID] = @artworkID)" DeleteCommand="DELETE FROM [Artwork] WHERE [artworkID] = @artworkID" InsertCommand="INSERT INTO [Artwork] ([title], [description], [price], [quantity]) VALUES (@title, @description, @price, @quantity)" UpdateCommand="UPDATE [Artwork] SET [title] = @title, [description] = @description, [price] = @price, [quantity] = @quantity WHERE [artworkID] = @artworkID">
                                <DeleteParameters>
                                    <asp:Parameter Name="artworkID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="title" Type="String" />
                                    <asp:Parameter Name="description" Type="String" />
                                    <asp:Parameter Name="price" Type="Decimal" />
                                    <asp:Parameter Name="quantity" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="lblArtworkId" Name="artworkID" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="title" Type="String" />
                                    <asp:Parameter Name="description" Type="String" />
                                    <asp:Parameter Name="price" Type="Decimal" />
                                    <asp:Parameter Name="quantity" Type="Int32" />
                                    <asp:Parameter Name="artworkID" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
</asp:Content>
