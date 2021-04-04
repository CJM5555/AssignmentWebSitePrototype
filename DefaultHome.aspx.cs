using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentWebSitePrototype
{
   
    public partial class HomePage : System.Web.UI.Page
    {
        String usersEmail = null;
        String usersName = null;
        int id;
       
        protected void Page_PreInit(object sender, EventArgs e)
        {
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginName"] != null)
            {
                usersEmail = Session["loginEmail"].ToString();
                usersName = Session["loginName"].ToString();
                id = (int)Session["loginID"];

            }
            else
            {
               
            }



        }
    }
}