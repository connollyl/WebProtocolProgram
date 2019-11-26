using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.Prog3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnFindItem_Click(object sender, EventArgs e)
        {
            lblDNE.Text = "";
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UWPCS3870ConnectionString"].ConnectionString);
                conn.Open();
                string checkPID = "select count(*) from Product where ProductID ='" + txtPID.Text + "'";
                SqlCommand comm = new SqlCommand(checkPID, conn);
                int checkExists = (int)comm.ExecuteScalar();
                if (checkExists > 0)
                {
                    string getPInfo = "select * from Product where ProductID ='" + txtPID.Text + "'";
                    comm = new SqlCommand(getPInfo, conn);
                    using (SqlDataReader reader = comm.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            txtName.Text = reader["ProductName"].ToString();
                            txtPrice.Text = reader["UnitPrice"].ToString();
                        }
                    }
                }
                else
                {
                    lblDNE.Text = "Product does not exist";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
            }
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            txtSubtotal.Text = getSubtotal();
            txtTax.Text = getTax();
            txtGrandtotal.Text = getGrandtotal();
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