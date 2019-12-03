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
    public partial class Shopping : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                DataSourceSelectArguments args = new DataSourceSelectArguments();
                DataView view = (DataView)SDSServer.Select(args);
                dt = view.ToTable();
                txtPID.Text = "";
                txtName.Text = "";
                txtPrice.Text = "";
                txtQuantity.Text = "";
                txtSubtotal.Text = "";
                txtTax.Text = "";
                txtGrandtotal.Text = "";
                txtPID.Focus();
                btnAdd.Enabled = false;
            }
            else
            {
                DataSourceSelectArguments args = new DataSourceSelectArguments();
                DataView view = (DataView)SDSServer.Select(args);
                dt = view.ToTable();
            }
        }

        protected void btnFindItem_Click(object sender, EventArgs e)
        {
            lblDNE.Text = "";
            txtName.Text = "";
            txtPrice.Text = "";
            txtQuantity.Text = "";
            txtSubtotal.Text = "";
            txtTax.Text = "";
            txtGrandtotal.Text = "";
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ProductID"].Equals(txtPID.Text))
                    {
                        txtName.Text = dr["ProductName"].ToString();
                        txtPrice.Text = dr["UnitPrice"].ToString();
                        lblDNE.Text = "";
                        break;
                    }
                    else
                    {
                        lblDNE.Text = "Product does not exist";
                        txtName.Text = "";
                        txtPrice.Text = "";
                    }
                }
            }
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (btnCalculate.Text.Equals("Calculate"))
            {
                txtSubtotal.Text = getSubtotal();
                txtTax.Text = getTax();
                txtGrandtotal.Text = getGrandtotal();
                btnCalculate.Text = "Clear";
                txtPID.ReadOnly = true;
                txtQuantity.ReadOnly = true;
                btnAdd.Enabled = true;
            }
            else if(btnCalculate.Text.Equals("Clear"))
            {
                btnCalculate.Text = "Calculate";
                txtPID.ReadOnly = false;
                txtQuantity.ReadOnly = false;
                btnAdd.Enabled = false;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ShoppingBag sb = (ShoppingBag)Session["ShoppingBag"];
            bool exists = false;
            foreach (DataRow dtr in sb.getBag().Rows)
            {
                if (dtr["ProductID"].Equals(txtPID.Text))
                {
                    exists = true;
                    break;
                }
                else
                {
                    exists = false;
                }
            }
            if (!exists)
            {
                DataRow dr = sb.getBag().NewRow();
                dr["ProductID"] = txtPID.Text;
                dr["ProductName"] = txtName.Text;
                dr["UnitPrice"] = txtPrice.Text;
                dr["Quantity"] = txtQuantity.Text;
                dr["GrandTotal"] = txtGrandtotal.Text;
                sb.AddRow(dr);
                Session["ShopppingBag"] = sb;
                btnCalculate.Text = "Calculate";
                txtPID.ReadOnly = false;
                txtQuantity.ReadOnly = false;
                btnAdd.Enabled = false;
                txtPID.Focus();
            }
            else
            {
                foreach (DataRow dr in sb.getBag().Rows)
                {
                    if (dr["ProductID"].ToString().Equals(txtPID.Text))
                    {
                        dr["ProductName"] = txtName.Text;
                        dr["UnitPrice"] = txtPrice.Text;
                        dr["Quantity"] = txtQuantity.Text;
                        dr["GrandTotal"] = txtGrandtotal.Text;
                        Session["ShopppingBag"] = sb;
                        btnCalculate.Text = "Calculate";
                        txtPID.ReadOnly = false;
                        txtQuantity.ReadOnly = false;
                        btnAdd.Enabled = false;
                        txtPID.Focus();
                        break;
                    }
                }
            }
        }

        private string getSubtotal()
        {
            double price = Double.Parse(txtPrice.Text);
            int quantity = Int32.Parse(txtQuantity.Text);
            double subtotal = price * quantity;
            return subtotal.ToString("0.00");
        }

        private string getTax()
        {
            double subtotal = Double.Parse(txtSubtotal.Text);
            float taxRate = 0.055f;
            double tax = subtotal * taxRate;
            return tax.ToString("0.00");
        }

        private string getGrandtotal()
        {
            double subtotal = Double.Parse(txtSubtotal.Text);
            double tax = Double.Parse(txtTax.Text);
            double grandTotal = subtotal + tax;
            return grandTotal.ToString("0.00");
        }
    }
}