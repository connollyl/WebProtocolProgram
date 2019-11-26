using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.Prog5
{
    public partial class Prog5MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblLogin1.Text = Session["Username"].ToString();
            lblLogin2.Text = Session["Username"].ToString();
        }
    }
}