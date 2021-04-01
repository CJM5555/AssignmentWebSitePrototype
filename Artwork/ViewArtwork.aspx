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
                                    <asp:TemplateField HeaderText="title" SortExpression="title">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv4" runat="server" ErrorMessage="Title is required" Text="*" ForeColor="Red" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="description" SortExpression="description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="Description is required" Text="*" ForeColor="Red" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="price" SortExpression="price">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Price is required" Text="*" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="rv2" runat="server" ErrorMessage="Price cannot be negative" ForeColor="Red" MinimumValue="1" MaximumValue="999999999" ControlToValidate="TextBox1">*</asp:RangeValidator>                                                                                
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
                                            <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Quantity is required" Text="*" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                           <asp:RangeValidator ID="rv1" runat="server" ErrorMessage="Quantity cannot be negative" ForeColor="Red" MinimumValue="1" MaximumValue="999999999" ControlToValidate="TextBox2">*</asp:RangeValidator>                                        
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
                                <FooterTemplate>
                                    <asp:ValidationSummary ID="vSummary" runat="server" ForeColor="Red" />
                                </FooterTemplate>
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
