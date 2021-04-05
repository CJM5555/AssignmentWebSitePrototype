<%@ Page Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="AssignmentWebSitePrototype.OrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <br />
            <br />
            <br />
            &nbsp;Order History<br />
            <br />
           <asp:ListView ID="summaryItemList" runat="server" DataKeyNames="OrderId" DataSourceID="OrderList">
                <LayoutTemplate>
                    <table>
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                <tr runat="server" style="">
                                    <th runat="server">OrderId</th>
                                    <th runat="server">ReceipientName</th>
                                    <th runat="server">DeliveryAddress</th>
                                    <th runat="server">PaymentMethod</th>
                                    <th runat="server">TotalPayment</th>
                                    <th runat="server">OrderDate</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server"/>
                        <td runat="server" style=""></td>
                    </table>
                </LayoutTemplate>   
                <AlternatingItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ReceipientNameLabel" runat="server" Text='<%# Eval("ReceipientName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DeliveryAddressLabel" runat="server" Text='<%# Eval("DeliveryAddress") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PaymentMethodLabel" runat="server" Text='<%# Eval("PaymentMethod") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalPaymentLabel" runat="server" Text='<%# Eval("TotalPayment") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("OrderDate")).Date  %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="OrderIdLabel1" runat="server" Text='<%# Eval("OrderId") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ReceipientNameTextBox" runat="server" Text='<%# Bind("ReceipientName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DeliveryAddressTextBox" runat="server" Text='<%# Bind("DeliveryAddress") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PaymentMethodTextBox" runat="server" Text='<%# Bind("PaymentMethod") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TotalPaymentTextBox" runat="server" Text='<%# Bind("TotalPayment") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Convert.ToDateTime(Eval("OrderDate")).Date  %>' />
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="ReceipientNameTextBox" runat="server" Text='<%# Bind("ReceipientName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DeliveryAddressTextBox" runat="server" Text='<%# Bind("DeliveryAddress") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PaymentMethodTextBox" runat="server" Text='<%# Bind("PaymentMethod") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TotalPaymentTextBox" runat="server" Text='<%# Bind("TotalPayment") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Convert.ToDateTime(Eval("OrderDate")).Date  %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                    <td>
                        <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                        </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("ReceipientName") %>' ID="ReceipientNameLabel" />
                    </td>
                    <td>
                        <asp:Label runat="server" Text='<%# Eval("DeliveryAddress") %>' ID="DeliveryAddressLabel" />
                    </td>
                        <td>
                            <asp:Label ID="PaymentMethodLabel" runat="server" Text='<%# Eval("PaymentMethod") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalPaymentLabel" runat="server" Text='<%# Eval("TotalPayment") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("OrderDate")).Date  %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Eval("OrderId") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ReceipientNameLabel" runat="server" Text='<%# Eval("ReceipientName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DeliveryAddressLabel" runat="server" Text='<%# Eval("DeliveryAddress") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PaymentMethodLabel" runat="server" Text='<%# Eval("PaymentMethod") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TotalPaymentLabel" runat="server" Text='<%# Eval("TotalPayment") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Convert.ToDateTime(Eval("OrderDate")).Date %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="OrderList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OrderId], [ReceipientName], [DeliveryAddress], [PaymentMethod], [TotalPayment], [OrderDate], [status] FROM [Order] WHERE ([userId] = @userId)">
                <SelectParameters>
                    <asp:SessionParameter Name="userId" SessionField="loginID" Type="Int32" DefaultValue="1001" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoggedUserPage/BrowseArtwork.aspx">Back To Browse Artwork</asp:HyperLink>
            <br />
            <br />
        </div>
</asp:Content>
