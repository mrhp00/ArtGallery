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
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Forum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void GridView_ArchivNews_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.DataItem == null)
        {
            return;
        }
        GridView gridview2 = (GridView)row.FindControl("GridView2");
        Label Label_ID = (Label)row.FindControl("Label2");

        gridview2.DataSource = SDKClass.Forums_ForumListByForumID(Int32.Parse(Label_ID.Text));
        gridview2.DataBind();

    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.DataItem == null)
        {
            return;
        }
        Label Label_ForumID = (Label)row.FindControl("Label_ForumID");
        Label Label_TopicCount = (Label)row.FindControl("Label_TopicCount");
        Label Label_WriterCount = (Label)row.FindControl("Label_WriterCount");
        Label Label_BY = (Label)row.FindControl("Label_BY"); ;
        Label Label_Date = (Label)row.FindControl("Label_Date"); ;
        HyperLink HyperLink_TopicTitle = (HyperLink)row.FindControl("HyperLink_TopicTitle"); ;
        HyperLink HyperLink_UserName = (HyperLink)row.FindControl("HyperLink_UserName"); ;

        Label_TopicCount.Text = SDKClass.Forums_ForumTopicsCount(Int32.Parse(Label_ForumID.Text)).ToString();
        Label_WriterCount.Text = SDKClass.Forums_ForumWritesCount(Int32.Parse(Label_ForumID.Text)).ToString();

        string Information = SDKClass.Forums_ForumsLastWrites(Int32.Parse(Label_ForumID.Text));
        if (Information != "")
        {
            string[] str = Information.Split(';');
            Label_BY.Visible = true;
            Label_Date.Visible = true;
            HyperLink_TopicTitle.Visible = true;
            HyperLink_UserName.Visible = true;
            Label_BY.Text = " بوسیله ";
            HyperLink_TopicTitle.Text = str[0];
            HyperLink_UserName.NavigateUrl = "~/ShowProfile.aspx?"+str[3];
            HyperLink_TopicTitle.NavigateUrl = "~/ShowThread.aspx?tid=" + str[1];
            HyperLink_UserName.Text = str[3];
            Label_Date.Text = SDKClass.GetFarsiDate(DateTime.Parse(str[2]), false);
        }
        else
        {
            HyperLink_TopicTitle.Text = "تاکنون عنوانی ثبت نشده است";
            HyperLink_TopicTitle.Visible = true;
        }
    }
}
