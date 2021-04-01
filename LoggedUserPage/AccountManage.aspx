<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="AccountManage.aspx.cs" Inherits="AssignmentWebSitePrototype.AccountManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style22 {
        width: 403px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div> 
    <table style="width:100%;">
        <tr>
            <td class="auto-style22">
    <asp:DetailsView ID="dvcArtistDetails" runat="server" AutoGenerateRows="False" Height="50px" Width="291px" DataKeyNames="artistID" DataSourceID="SqlDataSource1" >
        <Fields>
            <asp:BoundField DataField="artistID" HeaderText="artistID" InsertVisible="False" ReadOnly="True" SortExpression="artistID" />
            <asp:BoundField DataField="artistName" HeaderText="artistName" SortExpression="artistName" />
            <asp:BoundField DataField="phoneNo" HeaderText="phoneNo" SortExpression="phoneNo" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="postcode" HeaderText="postcode" SortExpression="postcode" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
        </Fields>
    </asp:DetailsView>
                <asp:DetailsView ID="dvcCustomerDetails" runat="server" AutoGenerateRows="False" DataKeyNames="userID" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
                    <Fields>
                        <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                        <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
                        <asp:BoundField DataField="phoneNo" HeaderText="phoneNo" SortExpression="phoneNo" />
                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                        <asp:BoundField DataField="postcode" HeaderText="postcode" SortExpression="postcode" />
                        <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artistID], [artistName], [phoneNo], [address], [state], [postcode], [city] FROM [Artists] WHERE ([email] = @email)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="alice@gmail.com" Name="email" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userID], [userName], [phoneNo], [email], [address], [city], [postcode], [state] FROM [Users] WHERE ([email] = @email)" UpdateCommand="UPDATE [Users] SET [userName] = @userName, [phoneNo] = @phoneNo, [email] = @email, [address] = @address, [city] = @city, [postcode] = @postcode, [state] = @state WHERE [userID] = @userID">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="alice@" Name="email" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="userName" />
                        <asp:Parameter Name="phoneNo" />
                        <asp:Parameter Name="email" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="city" />
                        <asp:Parameter Name="postcode" />
                        <asp:Parameter Name="state" />
                        <asp:Parameter Name="userID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style22">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
</div>
</asp:Content>
