<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="DefaultHome.aspx.cs" Inherits="AssignmentWebSitePrototype.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style23 {
            height: 93px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="slideshow-container">

    <div class="Slides fade">
        
        <img src="images/artwork-4.jpg" style="width:100%;height:600px" />
        <div class="text"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoggedUserPage/BrowseArtwork.aspx" BorderColor="White" BorderStyle="Solid"><h3>TO BROWSE ART</h3></asp:HyperLink></div>
    </div>

    <div class="Slides fade">
        
        <img src="images/667336.jpg" style="width:100%;height:600px" />
        <div class="text"><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/LoggedUserPage/Cart.aspx" ForeColor="White" BorderStyle="Solid" BorderColor="White"><h3>TO ORDER CART</h3></asp:HyperLink></div>
    </div>

    <div class="Slides fade">
  
        <img src="images/image_907.jpeg" style="width:100%;height:600px"/>
        <div class="text">
            <asp:HyperLink ID="HyperLink3" runat="server" ForeColor="White" NavigateUrl="~/Artwork/ArtistDashboard.aspx" BorderStyle="Solid"><h3>TO ARTIST DASHBOARD</h3></asp:HyperLink></div>
    </div>

    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>

    </div>
    <br/>

    <div style="text-align:center">
        <span class="bullet" onclick="currentSlide(1)"></span> 
        <span class="bullet" onclick="currentSlide(2)"></span> 
        <span class="bullet" onclick="currentSlide(3)"></span> 
    </div>

    <div class="auto-style23">
    </div>
</asp:Content>
