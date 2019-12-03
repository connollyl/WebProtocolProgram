using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.App_Code;

namespace WebSite.Prog7.Member
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShoppingBag sb = (ShoppingBag)Session["ShoppingBag"];
            DataTable theTable = sb.getBag();
            DataRow row;
            double total = 0;

            ShoppingItem item;

            for (int i = 0; i < theTable.Rows.Count; i++)
            {
                row = theTable.Rows[i];
                item = (ShoppingItem)LoadControl("../ShoppingItem.ascx");
                item.TheID = row[0].ToString();
                item.TheName = row[1].ToString();
                item.TheQuantity = int.Parse(row[3].ToString());
                item.ThePrice = Double.Parse(row[2].ToString().Remove(0, 1));
                item.TheCost = Double.Parse(row[4].ToString().Remove(0, 1));

                total += item.TheCost;
               // item.ItemChanged += HandleChangeEvent;
                Panel1.Controls.Add(item);
            }

            txtTotal.Text = string.Format("{0:C}", total);

        }

        private void HandleChangeEvent(ShoppingItem x, bool valid)
        {
            if (valid)
            {
                DataTable theTable = (DataTable)Session["ShoppingBag"];
                double total = 0;
                DataRow row;
                for (int i = 0; i < theTable.Rows.Count; i++)
                {
                    row = theTable.Rows[i];
                    if (row[0].ToString() == x.TheID)
                    {
                        row[2] = x.TheQuantity;
                        row[4] = x.TheCost;
                    }
                    total += double.Parse(row[4].ToString());
                }
                txtTotal.Text = string.Format("{0:C}", total);

            }
            else
            {
                txtTotal.Text = "";
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Session["GVI"] = "";
            Session["DeVI"] = "";
            Session["Username"] = "";
            Session["ShoppingBag"] = new ShoppingBag();
            Response.Redirect("../Login.aspx");
        }
    }
}