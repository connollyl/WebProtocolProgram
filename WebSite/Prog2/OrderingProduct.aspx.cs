using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.Prog2
{
    public partial class OrderingProduct : System.Web.UI.Page
    {
        double taxRate = .055;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            txtID.AutoPostBack = true;
            txtPrice.AutoPostBack = true;
            txtQuantity.AutoPostBack = true;
            txtSubtotal.AutoPostBack = true;
            txtTax.AutoPostBack = true;
            txtGrandtotal.AutoPostBack = true;
        }

        protected string getSubTotal()
        {
            double price = Double.Parse(txtPrice.Text);
            double quantity = Double.Parse(txtQuantity.Text);
            double subtotal = price*quantity;
            return subtotal.ToString();
        }

        protected string getTax()
        {
            double subtotal = Double.Parse(txtSubtotal.Text);
            double tax = subtotal * taxRate;
            return tax.ToString();
        }

        protected string getGrandTotal()
        {
            double subtotal = Double.Parse(txtSubtotal.Text);
            double tax = Double.Parse(txtTax.Text);
            double GrandTotal = subtotal + tax;
            return GrandTotal.ToString();
        }

        protected void btnCompute_Click(object sender, EventArgs e)
        {
            if (RequiredFieldValidator1.IsValid && RequiredFieldValidator2.IsValid && RequiredFieldValidator3.IsValid && RegularExpressionValidator1.IsValid && RegularExpressionValidator2.IsValid && RegularExpressionValidator3.IsValid && RangeValidator1.IsValid && RangeValidator2.IsValid)
            {
                txtID.ReadOnly = true;
                txtPrice.ReadOnly = true;
                txtQuantity.ReadOnly = true;
                txtSubtotal.Text = getSubTotal();
                txtTax.Text = getTax();
                txtGrandtotal.Text = getGrandTotal();
                txtID.AutoPostBack = true;
                txtPrice.AutoPostBack = true;
                txtQuantity.AutoPostBack = true;
                txtSubtotal.AutoPostBack = true;
                txtTax.AutoPostBack = true;
                txtGrandtotal.AutoPostBack = true;
                btnReset.Focus();
            }
            else
            {
                txtID.AutoPostBack = false;
                txtPrice.AutoPostBack = false;
                txtQuantity.AutoPostBack = false;
                txtSubtotal.AutoPostBack = false;
                txtTax.AutoPostBack = false;
                txtGrandtotal.AutoPostBack = false;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtGrandtotal.Text = String.Empty;
            txtTax.Text = String.Empty;
            txtSubtotal.Text = String.Empty;
            txtQuantity.Text = String.Empty;
            txtPrice.Text = String.Empty;
            txtID.Text = String.Empty;
            txtID.ReadOnly = false;
            txtPrice.ReadOnly = false;
            txtQuantity.ReadOnly = false;
            txtID.Focus();
        }
    }
}