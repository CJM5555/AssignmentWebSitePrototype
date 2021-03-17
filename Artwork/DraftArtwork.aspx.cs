using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWebSitePrototype.Artwork
{
    public partial class DraftArtwork : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void buttonClick(Object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "publish")
            {
                Response.Redirect("~/Artwork/ArtistDashboard.aspx");
                
            }
        }
    }
}