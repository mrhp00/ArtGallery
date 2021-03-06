using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class BrowseUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView_BrowseUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.DataItem == null)
        {
            return;
        }
        Label Label_Date = (Label)row.FindControl("Label_Date");
        Label Label_WriteCount = (Label)row.FindControl("Label_WriteCount");
        Label Label_TypeUser = (Label)row.FindControl("Label_TypeUser");
        HyperLink HyperLink_UserName = (HyperLink)row.FindControl("HyperLink_UserName"); ;

        MembershipUser UserInformation = Membership.GetUser(HyperLink_UserName.Text);
        Label_Date.Text = SDKClass.GetFarsiDate(UserInformation.CreationDate, false);

        Label_TypeUser.Text = SDKClass.Membership_TypeUser(HyperLink_UserName.Text);
        Label_WriteCount.Text = SDKClass.Forums_PostCountForUser(HyperLink_UserName.Text).ToString();

        Image Image_Online = (Image)row.FindControl("Image_Online");

        
        if (UserInformation.IsOnline)
        {
            Image_Online.ImageUrl = "~/Images/user_online.gif";
            Image_Online.ToolTip = "کاربر مورد نظر هم اکنون در سایت حضور دارد";
        }
        else
        {
            Image_Online.ImageUrl = "~/Images/user_offline.gif";
            Image_Online.ToolTip = "کاربر مورد نظر هم اکنون در سایت حضور ندارد";
        }
    }

    protected void LinkButton_All_Click(object sender, EventArgs e)
    {
        SqlDataSource_BrowseUsers.SelectCommand = "Forums_GetAllUsers";
        SqlDataSource_BrowseUsers.SelectParameters.Clear();
        GridView_BrowseUsers.DataBind();
    }

    protected void LinkButton_A_Click(object sender, EventArgs e)
    {
        LinkButton LinkButton_Temp = (LinkButton)sender;
        SqlDataSource_BrowseUsers.SelectCommand = "Forums_UserList";
        SqlDataSource_BrowseUsers.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
        SqlDataSource_BrowseUsers.SelectParameters["Letter"].DefaultValue=LinkButton_Temp.CommandArgument;
        GridView_BrowseUsers.DataBind();
    }
}
