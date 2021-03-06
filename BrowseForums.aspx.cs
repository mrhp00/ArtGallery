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

public partial class BrowseForums : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.IsInRole("Admin"))
            GridView_TopicsList.Columns[6].Visible = true;
        else
            GridView_TopicsList.Columns[6].Visible = false;

        if (User.Identity.IsAuthenticated)
        {
            ImageButton_NewTopic.Visible = true;
            ImageButton_NewTopic1.Visible = true;
        }
        else
        {
            ImageButton_NewTopic.Visible = false;
            ImageButton_NewTopic1.Visible = false;
        }

        if (!Page.IsPostBack)
        {
            int temp=0;
            if (Request.QueryString["FID"].ToString()!="")
                temp = Int32.Parse(Request.QueryString["FID"].ToString());
            Label_ForumName.Text = " انجمن: " + SDKClass.Forums_ForumName(temp);
        }
    }
    
    protected void ImageButton_NewTopic_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.QueryString["FID"].ToString() != "")
        {
            Session.Add("FID", Request.QueryString["FID"].ToString());
            Response.Redirect("~/EnterTopic.aspx");
        }
    }

    protected void GridView_TopicsList_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void ImageButton_Delete_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton m = (ImageButton)sender;
        int RowIndex = Int32.Parse(m.CommandArgument);
        Label Label_ID = (Label)GridView_TopicsList.Rows[RowIndex].Cells[0].FindControl("Label_ID");
        SqlDataSource_ForumList.DeleteParameters["TopicID"].DefaultValue = Label_ID.Text;
        SqlDataSource_ForumList.Delete();
    }
}
