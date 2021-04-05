<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="AssignmentWebSitePrototype.RegisterPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            width: 50%;
            height: 265px;
        }
        .auto-style9 {
            width: 234px;
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
        .auto-style23 {
            width: 448px;
        }
        .auto-style24 {
            width: 558px;
        }
        .auto-style25 {
            width: 234px;
            height: 50px;
        }
        .auto-style26 {
            width: 228px;
            height: 50px;
        }
        .auto-style27 {
            width: 200px;
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="auto-style11">
    <table class="auto-style7">
        <tr style="padding:0px 10px 10px">
            <td class="auto-style25" style="padding:0px 10px 10px"></td>
            <td class="auto-style26" style="padding:0px 10px 0px"><h3 class="auto-style23" style="padding:0px 10px 0px">CREATE YOUR ACCOUNT</h3></td>
            <td class="auto-style27" style="padding:0px 10px 10px"></td>
        </tr>
        <tr>
            <td class="auto-style9" style="padding:0px 10px 10px">
                &nbsp;</td>
            <td class="auto-style24" style="padding:0px 10px 10px">
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" ContinueDestinationPageUrl="~/LoginPage.aspx" Height="16px" Width="568px">
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server" >
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td align="center" colspan="2" style="padding:0px 10px 10px">Sign Up for Your New Account</td>
                                        <td align="center" style="padding:0px 10px 10px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="padding:0px 10px 10px">
                                            <asp:Label ID="Label1" runat="server" Text="Register As:"></asp:Label>
                                        </td>
                                        <td style="padding:0px 10px 10px">
                                            <asp:RadioButtonList ID="RegisterAs" runat="server" DataSourceID="SqlDataSource1" DataTextField="RoleName" DataValueField="RoleName" RepeatDirection="Horizontal" >
                                            </asp:RadioButtonList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [RoleId], [RoleName] FROM [vw_aspnet_Roles]"></asp:SqlDataSource>
                                        </td>
                                        <td style="padding:0px">
                                            &nbsp;</td>
                                    </tr>
                                    <tr >
                                        <td align="right" style="padding:0px 10px 10px">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                        <td style="padding:0px 10px 10px">
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="padding:0px 10px 10px">
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ForeColor="Red" ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="padding:0px 10px 10px">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td style="padding:0px 10px 10px">
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td style="padding:0px 10px 10px">
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ForeColor="Red" ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding:0px 10px 10px">
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                        </td>
                                        <td style="padding:0px 10px 10px">
                                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td style="padding:0px 10px 10px">
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ForeColor="Red" ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="padding:0px 10px 10px">
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                        </td>
                                        <td style="padding:0px 10px 10px">
                                            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="padding:0px 10px 10px">
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ForeColor="Red" ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Invalid email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="CreateUserWizard1">*</asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="padding:0px 10px 10px">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                        </td>
                                        <td align="center" style="padding:0px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;padding:0px " >
                                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                        <td align="center" style="color:Red;padding:0px ">&nbsp;</td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep runat="server" >
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td align="center">Complete</td>
                                    </tr>
                                    <tr>
                                        <td>Your account has been successfully created.</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="Continue" ValidationGroup="CreateUserWizard1" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style24">&nbsp;</td>
            <td class="auto-style12">&nbsp;</td>
        </tr>
        </table>
    </div>
    <div></div>
</asp:Content>
