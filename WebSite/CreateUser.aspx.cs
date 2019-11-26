using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class CreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            lblUsername.Text = "";
            try
            {
                DataView dv = (DataView)SDSServer.Select(DataSourceSelectArguments.Empty);
                DataTable dt = dv.ToTable();
                if (dt.Rows.Count != 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        if (dr["Username"].Equals(txtbxUsername.Text))
                        {
                            lblUsername.Text = "Username is already Taken";
                        }
                        else
                        {
                            txtbxUsername.Text = "";
                            txtbxPassword.Text = "";
                            txtbxEmail.Text = "";
                        }
                    }
                }
                else
                {
                    SDSServer.Insert();
                    txtbxUsername.Text = "";
                    txtbxPassword.Text = "";
                    txtbxEmail.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblUsername.Text = "Error creating user";
                Response.Write(ex.ToString());
            }
        }
    }
}