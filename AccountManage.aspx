<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="AccountManage.aspx.cs" Inherits="AssignmentWebSitePrototype.AccountManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [userID] = @userID" InsertCommand="INSERT INTO [Users] ([userName], [phoneNo], [email], [address], [city], [postcode], [state]) VALUES (@userName, @phoneNo, @email, @address, @city, @postcode, @state)" SelectCommand="SELECT [userID], [userName], [phoneNo], [email], [address], [city], [postcode], [state] FROM [Users] WHERE ([email] = @email)" UpdateCommand="UPDATE [Users] SET [userName] = @userName, [phoneNo] = @phoneNo, [email] = @email, [address] = @address, [city] = @city, [postcode] = @postcode, [state] = @state WHERE [userID] = @userID">
        <DeleteParameters>
            <asp:Parameter Name="userID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="phoneNo" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="postcode" Type="String" />
            <asp:Parameter Name="state" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="alice@gmail.com" Name="email" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="phoneNo" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="city" Type="String" />
            <asp:Parameter Name="postcode" Type="String" />
            <asp:Parameter Name="state" Type="String" />
            <asp:Parameter Name="userID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="userID" DataSourceID="SqlDataSource1" Height="50px" Width="291px">
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
    <br />
</p>
</asp:Content>
