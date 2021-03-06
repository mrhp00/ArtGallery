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

public partial class TopTopics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView_TopTopicsList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.DataItem == null)
        {
            return;
        }
        Label Label_Date = (Label)row.FindControl("Label_Date");
        Label Label_ID = (Label)row.FindControl("Label_ID");
        Label Label_By = (Label)row.FindControl("Label_By"); ;
        Label Label_ReplyCount = (Label)row.FindControl("Label_ReplyCount"); ;
        HyperLink HyperLink_UserName = (HyperLink)row.FindControl("HyperLink_UserName"); ;

        Label_ReplyCount.Text = SDKClass.Forums_TopicsReplyCount(Int32.Parse(Label_ID.Text)).ToString();

        string Information = SDKClass.Forums_TopicsLastReply(Int32.Parse(Label_ID.Text));
        if (Information != "")
        {
            string[] str = Information.Split(';');
            Label_By.Visible = true;
            Label_Date.Visible = true;
            HyperLink_UserName.Visible = true;
            Label_By.Text = " بوسیله ";
            HyperLink_UserName.NavigateUrl = "~/ShowProfile.aspx?uid=" + str[1];
            HyperLink_UserName.Text = str[1];
            Label_Date.Text = SDKClass.GetFarsiDate(DateTime.Parse(str[0]), false);
        }
        else
        {
            Label_Date.Text = "تاکنون پاسخی داده نشده است";
            Label_Date.Visible = true;
        }
    }
}
