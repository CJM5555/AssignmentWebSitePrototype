<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArtistNavigation.ascx.cs" Inherits="AssignmentWebSitePrototype.Artwork.ArtistNavigation" %>

<link href="<%= ResolveUrl("~/Artwork/ArtistNavigationBar.css") %>" rel="stylesheet" />

<div class="drawer">
<br />
<asp:Label ID="lblNavigate" runat="server" Text="Menu" CssClass="menu"></asp:Label>
<br />
<br />
<asp:HyperLink ID="hlDashboard" runat="server" NavigateUrl="~/Artwork/ArtistDashboard.aspx" CssClass="navItem">Dashboard</asp:HyperLink>
<br />
<asp:HyperLink ID="hlDraft" runat="server" NavigateUrl="~/Artwork/DraftArtwork.aspx" CssClass="navItem">Drafts</asp:HyperLink>
</div>