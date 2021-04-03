<%@ Page Language="C#" enableEventValidation="false" MasterPageFile="~/SiteMain.Master"  AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="AssignmentWebSitePrototype.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <br />
            Order Cart<br />
            <br />
            
            <asp:ListView ID="cartItemList" runat="server">
                <LayoutTemplate>
                    <table cellpadding="2" runat="server">
                    <tr runat="server">
                        <th runat="server">Preview</th>
                        <th runat="server">Artwork Details</th>
                        <th runat="server">Price</th>
                        <th></th>
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
                    <td>
                        <asp:Button runat="Server" Text='Remove' OnCommand="RemoveItem" CommandName="Remove" CommandArgument='<%#Eval("artworkID") %>'/>
                    </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
        <asp:Button style="float:right;" ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" />
            <br />
            <br />
            <br />
        </div>
</asp:Content>
