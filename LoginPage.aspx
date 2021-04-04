<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="AssignmentWebSitePrototype.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style10 {
        width: 599px;
    }
    .auto-style11 {
        width: 100%;
        
    }
    .auto-style13 {
        width: 680px;
    }
    .auto-style14 {
        width: 987px;
    }
    .auto-style15 {
        width: 50%;
        
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style11">
    <table class="auto-style15">
        <tr>
            <td class="auto-style14" rowspan="2">&nbsp;</td>
            <td class="auto-style13" align="bottom">&nbsp;</td>
            <td class="auto-style10">
                <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/DefaultHome.aspx" >
                    <LayoutTemplate>
                        <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2" style="padding:0px 10px 10px">
                                                <h3>LOG IN</h3>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="padding:0px 10px 10px">
                                               <asp:Label ID="LoginAsLabel" runat="server" AssociatedControlID="LoginAs">Login As :</asp:Label></td>
                                            
                                            <td style="padding:0px 10px 10px">
                                                <asp:RadioButtonList ID="LoginAs" runat="server" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleName" RepeatDirection="Horizontal"></asp:RadioButtonList>       
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [RoleId], [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="padding:0px 10px 10px">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            </td>
                                            <td style="padding:0px 10px 10px">
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" style="padding:0px 10px 10px">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td style="padding:0px 10px 10px">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="padding:0px 10px 10px">
                                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;" style="padding:0px 10px 10px">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" OnClick="LoginButton_Click1" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:Login>
            </td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;<br />
            </td>
            <td class="auto-style10">
                Not A Member Yet?<br />
                <asp:Button ID="btnRegister" runat="server" Height="51px" OnClick="btnRegister_Click" Text="Create New Account" Width="225px"/>
            </td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>
