<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="AssignmentWebSitePrototype.RegisterPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            width: 50%;
            height: 265px;
        }
        .auto-style9 {
            width: 159px;
        }
        .auto-style10 {
            width: 22px;
        }
        .auto-style11 {
            width: 100%;
        }
        .auto-style12 {
            width: 162px;
        }
        .auto-style13 {
            width: 159px;
            height: 28px;
        }
        .auto-style14 {
            width: 162px;
            height: 28px;
        }
        .auto-style15 {
            width: 22px;
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="auto-style11">
    <table class="auto-style7">
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td colspan="2"><h3>CREATE YOUR ACCOUNT</h3></td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style12">User Name:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtNameRegister" runat="server" Width="155px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style12">E-mail:
                                
            </td>
            <td class="auto-style10">
                <asp:TextBox ID="txtEmailRegister" runat="server"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style12">Password:
                </td>
            <td class="auto-style10">
                <asp:TextBox ID="txtPasswordRegister" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style12">Confirm-Password:</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtCheckPassRegister" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style14"></td>
            <td class="auto-style15">
                <asp:Button ID="btnSubmit1" runat="server" Text="Submit" OnClick="btnSubmit1_Click" />
            </td>
        </tr>
    </table>
    </div>
    <div></div>
</asp:Content>
