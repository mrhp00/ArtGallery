using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class SiteAdmin_EditUser : System.Web.UI.Page
{
    string userName = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        userName = this.Request.QueryString["UserName"];

        if (!this.IsPostBack)
        {
            // show the user's details
            MembershipUser user = Membership.GetUser(userName);
            lblUserName.Text = user.UserName;
            lnkEmail.Text = user.Email;
            lnkEmail.NavigateUrl = "mailto:" + user.Email;
            lblRegistered.Text = SDKClass.GetFarsiDate(user.CreationDate, false);
            lblLastLogin.Text = SDKClass.GetFarsiDate(user.LastLoginDate, false);
            lblLastActivity.Text = SDKClass.GetFarsiDate(user.LastActivityDate, false);
            chkOnlineNow.Checked = user.IsOnline;
            chkApproved.Checked = user.IsApproved;
            chkLockedOut.Checked = user.IsLockedOut;
            chkLockedOut.Enabled = user.IsLockedOut;

            BindRoles();
        }
    }

    private void BindRoles()
    {
        // fill the CheckBoxList with all the available roles, and then select
        // those that the user belongs to
        chklRoles.DataSource = Roles.GetAllRoles();
        chklRoles.DataBind();
        foreach (string role in Roles.GetRolesForUser(userName))
            chklRoles.Items.FindByText(role).Selected = true;
    }

    protected void btnUpdateRoles_Click(object sender, EventArgs e)
    {
        // first remove the user from all roles...
        string[] currRoles = Roles.GetRolesForUser(userName);
        if (currRoles.Length > 0)
            Roles.RemoveUserFromRoles(userName, currRoles);
        // and then add the user to the selected roles
        List<string> newRoles = new List<string>();
        foreach (ListItem item in chklRoles.Items)
        {
            if (item.Selected)
                newRoles.Add(item.Text);
        }
        if (newRoles.Count == 0)
            newRoles.Add("Users");
        Roles.AddUserToRoles(userName, newRoles.ToArray());

        Label_Message.Text= "گروه کاربری با موفقیت تغییر یافت";

    }

    protected void chkApproved_CheckedChanged(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser(userName);
        user.IsApproved = chkApproved.Checked;
        Membership.UpdateUser(user);
    }

    protected void chkLockedOut_CheckedChanged(object sender, EventArgs e)
    {
        if (!chkLockedOut.Checked)
        {
            MembershipUser user = Membership.GetUser(userName);
            user.UnlockUser();
            chkLockedOut.Enabled = false;
        }
    }
}
