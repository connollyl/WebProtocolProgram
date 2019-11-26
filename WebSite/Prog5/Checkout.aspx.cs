using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.App_Code;

namespace WebSite.Prog5
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            ShoppingBag sb = (ShoppingBag)Session["ShoppingBag"];
            GVShoppingBag.DataSource = sb.getBag();
            GVShoppingBag.DataBind();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Session["GVI"] = "";
            Session["DeVI"] = "";
            Session["Username"] = "";
            Session["ShoppingBag"] = new object();
            Response.Redirect("../Login.aspx");
        }
    }
}