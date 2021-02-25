<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="AssignmentWebSitePrototype.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            width: 50%;
        height: 265px;
    }
        .auto-style10 {
            width: 599px;
        }
        .auto-style11 {
            width: 100%;
        height: 391px;
    }
        .auto-style13 {
            width: 680px;
        }
        .auto-style14 {
            width: 987px;
        }
    .auto-style15 {
        width: 50%;
        height: 535px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style11">
    <table class="auto-style15">
        <tr>
            <td class="auto-style14" rowspan="5">&nbsp;</td>
            <td class="auto-style13"><h3>SIGN IN</h3></td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Your E-mail<br />
&nbsp;<asp:TextBox ID="txtEmailLogin" runat="server" Height="25px"></asp:TextBox>
                
            </td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">Password<br />
&nbsp;<asp:TextBox ID="txtPasswordLogin" runat="server"></asp:TextBox>
                </td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click" PostBackUrl = "~/DefaultHome.aspx"/>
            </td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                Not A Member Yet?
                <br />
                <asp:Button ID="btnRegister" runat="server" Height="51px" OnClick="btnRegister_Click" Text="Create New Account" Width="225px" />
            </td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>
