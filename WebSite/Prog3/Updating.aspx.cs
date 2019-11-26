using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.App_Code;

namespace WebSite.Prog3
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private SQLDataClass sqlDC = new SQLDataClass();
        private int DTIndex;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                sqlDC.fillDataTable();
                if (string.IsNullOrEmpty(Session["Index"] as string))
                {
                    DTIndex = 0;
                    Session["Index"] = DTIndex.ToString();
                }
                else
                {
                    DTIndex = Int32.Parse(Session["Index"].ToString());
                }
                txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
                txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
                txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
                txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
                txtMessage.Text = "";
            }
            else
            {
                DTIndex = Int32.Parse(Session["Index"].ToString());
                sqlDC.fillDataTable();
                //txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
                //txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
                //txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
                //txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
            }
        }

        protected void btnFirst_Click(object sender, EventArgs e)
        {
            DTIndex = 0;
            Session["Index"] = DTIndex.ToString();
            txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
            txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
            txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
            txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
        }

        protected void btnLast_Click(object sender, EventArgs e)
        {
            int lastRow = sqlDC.dTable.Rows.Count - 1;
            DTIndex = lastRow;
            Session["Index"] = DTIndex.ToString();
            txtPID.Text = sqlDC.dTable.Rows[lastRow]["ProductID"].ToString();
            txtName.Text = sqlDC.dTable.Rows[lastRow]["ProductName"].ToString();
            txtPrice.Text = sqlDC.dTable.Rows[lastRow]["UnitPrice"].ToString();
            txtDesc.Text = sqlDC.dTable.Rows[lastRow]["Description"].ToString();
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            DTIndex = Int32.Parse(Session["Index"].ToString());
            if (DTIndex > 0)
            {
                DTIndex = DTIndex - 1;
                Session["Index"] = DTIndex.ToString();
                txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
                txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
                txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
                txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            DTIndex = Int32.Parse(Session["Index"].ToString());
            if (DTIndex < sqlDC.dTable.Rows.Count - 1)
            {
                DTIndex = DTIndex + 1;
                Session["Index"] = DTIndex.ToString();
                try
                {
                    txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
                    txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
                    txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
                    txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
                }
                catch (Exception ex)
                {
                    txtMessage.Text = "Error getting next item";
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (btnDelete.Text.Equals("Delete"))
            {
                DTIndex = Int32.Parse(Session["Index"].ToString());
                if (DTIndex == sqlDC.dTable.Rows.Count - 1)
                {
                    sqlDC.dTable.Rows[DTIndex].Delete();
                    DTIndex = DTIndex - 1;
                    txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
                    txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
                    txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
                    txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
                    try
                    {
                        sqlDC.updateDatabase();

                    }
                    catch (Exception ex)
                    {
                        txtMessage.Text = "Error updating database.";
                    }
                }
                else
                {
                    sqlDC.dTable.Rows[DTIndex].Delete();
                    DTIndex = DTIndex + 1;
                    txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
                    txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
                    txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
                    txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
                    try
                    {
                        sqlDC.updateDatabase();
                    }
                    catch (Exception ex)
                    {
                        txtMessage.Text = "Error updating database.";
                    }
                }
            }
            else
            {
                txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
                txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
                txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
                txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
                btnUpdate.Enabled = true;
                btnFirst.Enabled = true;
                btnPrevious.Enabled = true;
                btnNext.Enabled = true;
                btnLast.Enabled = true;
                txtPID.ReadOnly = true;
                btnNew.Text = "New";
                btnDelete.Text = "Delete";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            sqlDC.dTable.Rows[DTIndex]["ProductName"] = txtName.Text;
            sqlDC.dTable.Rows[DTIndex]["UnitPrice"] = txtPrice.Text;
            sqlDC.dTable.Rows[DTIndex]["Description"] = txtDesc.Text;
            try
            {
                sqlDC.updateDatabase();
            }
            catch (Exception ex)
            {
                txtMessage.Text = "Error updating database.";
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            if (btnNew.Text.Equals("New"))
            {
                txtPID.Text = "";
                txtName.Text = "";
                txtPrice.Text = "";
                txtDesc.Text = "";
                btnNew.Text = "Save New";
                btnDelete.Text = "Cancel";
                btnUpdate.Enabled = false;
                btnFirst.Enabled = false;
                btnPrevious.Enabled = false;
                btnNext.Enabled = false;
                btnLast.Enabled = false;
                txtPID.ReadOnly = false;
            }
            else
            {
                try
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["UWPCS3870ConnectionString"].ConnectionString);
                    conn.Open();
                    string insertCom = "insert into Product (ProductID, ProductName, UnitPrice, Description) values (@ID, @name, @price, @description)";
                    SqlCommand com = new SqlCommand(insertCom, conn);
                    com.Parameters.AddWithValue("@id", txtPID.Text);
                    com.Parameters.AddWithValue("@name", txtName.Text);
                    com.Parameters.AddWithValue("@price", txtPrice.Text);
                    com.Parameters.AddWithValue("@description", txtDesc.Text);
                    com.ExecuteNonQuery();
                    conn.Close();
                    DTIndex = Int32.Parse(Session["Index"].ToString());
                    txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
                    txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
                    txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
                    txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
                    btnUpdate.Enabled = true;
                    btnFirst.Enabled = true;
                    btnPrevious.Enabled = true;
                    btnNext.Enabled = true;
                    btnLast.Enabled = true;
                    txtPID.ReadOnly = true;
                    btnNew.Text = "New";
                    btnDelete.Text = "Delete";
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                    txtMessage.Text = "Error updating database.";
                    txtPID.Text = sqlDC.dTable.Rows[DTIndex]["ProductID"].ToString();
                    txtName.Text = sqlDC.dTable.Rows[DTIndex]["ProductName"].ToString();
                    txtPrice.Text = sqlDC.dTable.Rows[DTIndex]["UnitPrice"].ToString();
                    txtDesc.Text = sqlDC.dTable.Rows[DTIndex]["Description"].ToString();
                    btnUpdate.Enabled = true;
                    btnFirst.Enabled = true;
                    btnPrevious.Enabled = true;
                    btnNext.Enabled = true;
                    btnLast.Enabled = true;
                    txtPID.ReadOnly = true;
                    btnNew.Text = "New";
                    btnDelete.Text = "Delete";
                }
            }
        }
    }
}