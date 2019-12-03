using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)SDSServer.Select(DataSourceSelectArguments.Empty);
            DataTable dt = dv.ToTable();
            if (dt.Rows.Count != 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["Username"].Equals(txtbxUsername.Text))
                    {
                        if (dr["Password"].Equals(txtbxPassword.Text))
                        {
                            Session["Username"] = txtbxUsername.Text;
                            Response.Redirect("Prog7/Default.aspx");
                        }
                        else
                        {
                            lblPassword.Text = "Password is Incorrect";
                        }
                    }
                    else
                    {
                        lblUsername.Text = "Username is Unknown";
                    }
                }
            }
        }
    }
}