using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.App_Code;

namespace WebSite.Prog6.Member
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            ShoppingBag sb = (ShoppingBag)Session["ShoppingBag"];
            GVShoppingBag.DataSource = sb.getBag();
            GVShoppingBag.DataBind();
            txtbxTotal.Text = Total(sb).ToString();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Session["GVI"] = "";
            Session["DeVI"] = "";
            Session["Username"] = "";
            Session["ShoppingBag"] = new ShoppingBag();
            Response.Redirect("../Login.aspx");
        }

        protected double Total (ShoppingBag sb)
        {
            DataTable dt = sb.getBag();
            double total = 0;
            foreach(DataRow dr in dt.Rows)
            {
                total += Double.Parse(dr["GrandTotal"].ToString());
            }
            return total;
        }
    }
}