using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.Prog6.Admin
{
    public partial class SetRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            }
            else
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            }
        }

        protected void btnAddRole_Click(object sender, EventArgs e)
        {
            txtbxMessage.Text = "I could not figure out how to add custom roles to user";
        }

        protected void btnRemoveRole_Click(object sender, EventArgs e)
        {
            txtbxMessage.Text = "I could not figure out how to add custom roles to user";
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            SDSUsers.Delete();
        }

        protected void btnRoleToUser_Click(object sender, EventArgs e)
        {
            if(ddlRoles.SelectedValue.Equals("Admin"))
            {
                SDSAdmin.Insert();
            }
            else if (ddlRoles.SelectedValue.Equals("Member"))
            {
                SDSMember.Insert();
            }
        }

        protected void btnRoleFromUser_Click(object sender, EventArgs e)
        {
            if (ddlRoles.SelectedValue.Equals("Admin"))
            {
                SDSAdmin.Delete();
            }
            else if (ddlRoles.SelectedValue.Equals("Member"))
            {
                SDSMember.Delete();
            }
        }

        protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlRoles.SelectedValue.Equals("Admin"))
            {
                DataTable dt = (DataTable)SDSAdmin.Select(DataSourceSelectArguments.Empty);
                foreach(DataRow dr in dt.Rows)
                {
                    ddlSUsers.Items.Add(dr["Username"].ToString());
                }
            }
            else if (ddlRoles.SelectedValue.Equals("Member"))
            {
                DataTable dt = (DataTable)SDSMember.Select(DataSourceSelectArguments.Empty);
                foreach (DataRow dr in dt.Rows)
                {
                    ddlSUsers.Items.Add(dr["Username"].ToString());
                }
            }
        }
    }
}