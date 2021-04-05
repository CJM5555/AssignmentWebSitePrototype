<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="AccountManage.aspx.cs" Inherits="AssignmentWebSitePrototype.AccountManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style23 {
            width: 683px;
        }
        .auto-style24 {
            width: 682px;
        }
        .auto-style25 {
            width: 681px;
        }
        .auto-style26 {
            width: 556px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div> 
    <table style="width:100%;">
        <tr>
            <td class="auto-style26">
                &nbsp;</td>
            <td class="auto-style23">
                Account Information</td>
            <td class="auto-style24">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26">
                <div>
                    <asp:Image ID="ProfileImage" runat="server" ImageUrl='<%# "~/images/" + Eval("imageUrl") %>' Height="78px" OnDataBinding="Page_Load" Width="92px"/>
                </div>&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" Visible="False" onchange="imageUploaded()"/>
                <asp:Button ID="btnChangeImg" runat="server" OnClick="Button1_Click" Text="Edit Image" Width="183px" />
                <asp:Button ID="btnSaveImg" runat="server" Text="Save" Visible="False" Width="162px" OnClick="btnSaveImg_Click" />
            </td>
            <td class="auto-style23">
    <asp:DetailsView ID="dvcArtistDetails" runat="server" AutoGenerateRows="False" Height="50px" Width="352px" DataKeyNames="artistID" DataSourceID="SqlDataSource1" >
        <CommandRowStyle Font-Bold="True" Font-Underline="False" ForeColor="#0000CC" />
        <Fields>
            <asp:BoundField DataField="artistID" HeaderText="artistID" InsertVisible="False" ReadOnly="True" SortExpression="artistID" />
            <asp:BoundField DataField="artistName" HeaderText="artistName" ReadOnly="True" SortExpression="artistName" />
            <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
            <asp:BoundField DataField="phoneNo" HeaderText="phoneNo" SortExpression="phoneNo" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
            <asp:BoundField DataField="postcode" HeaderText="postcode" SortExpression="postcode" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
                <asp:DetailsView ID="dvcCustomerDetails" runat="server" AutoGenerateRows="False" Height="50px" Width="221px" DataKeyNames="userID" DataSourceID="SqlDataSource2">
                    <Fields>
                        <asp:BoundField DataField="userID" HeaderText="userID" InsertVisible="False" ReadOnly="True" SortExpression="userID" />
                        <asp:BoundField DataField="userName" HeaderText="userName" ReadOnly="True" SortExpression="userName" />
                        <asp:BoundField DataField="email" HeaderText="email" ReadOnly="True" SortExpression="email" />
                        <asp:BoundField DataField="phoneNo" HeaderText="phoneNo" SortExpression="phoneNo" />
                        <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                        <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                        <asp:BoundField DataField="postcode" HeaderText="postcode" SortExpression="postcode" />
                        <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artistID], [artistName], [phoneNo], [email], [address],[city],[postcode], [state] FROM [Artists] WHERE ([artistName] = @artistName)" UpdateCommand="UPDATE [Artists] SET [phoneNo] = @phoneNo, [address] = @address, [city] = @city, [postcode] = @postcode, [state] = @state WHERE [artistID] = @artistID">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="artistName" SessionField="loginName" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="phoneNo" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="city" />
                        <asp:Parameter Name="postcode" />
                        <asp:Parameter Name="state" />
                        <asp:Parameter Name="artistID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userID], [userName], [phoneNo], [email], [address], [city], [postcode], [state] FROM [Users] WHERE ([userName] = @userName)" UpdateCommand="UPDATE [Users] SET [phoneNo] = @phoneNo, [address] = @address, [city] = @city, [postcode] = @postcode, [state] = @state WHERE [userID] = @userID" >
                    <SelectParameters>
                        <asp:SessionParameter Name="userName" SessionField="loginName" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="phoneNo" />
                        <asp:Parameter Name="address" />
                        <asp:Parameter Name="city" />
                        <asp:Parameter Name="postcode" />
                        <asp:Parameter Name="state" />
                        <asp:Parameter Name="userID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style24">
                <div class="auto-style25" style="height:100%">


                </div>
                <br />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26">
                &nbsp;</td>
            <td class="auto-style23">
                &nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style26">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
</div>
</asp:Content>
