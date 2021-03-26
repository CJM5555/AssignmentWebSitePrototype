<%@ Page Title="" Language="C#" MasterPageFile="~/SiteMain.Master" AutoEventWireup="true" CodeBehind="DefaultHome.aspx.cs" Inherits="AssignmentWebSitePrototype.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="slideshow-container">

    <div class="Slides fade">
        
        <img src="images/artwork-4.jpg" style="width:100%;height:600px" />
        <div class="text">Caption Text</div>
    </div>

    <div class="Slides fade">
        
        <img src="images/667336.jpg" style="width:100%;height:600px" />
        <div class="text">Caption Two</div>
    </div>

    <div class="Slides fade">
  
        <img src="images/image_907.jpeg" style="width:100%;height:600px"/>
        <div class="text">Caption Three</div>
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

    <div>

    </div>
</asp:Content>
