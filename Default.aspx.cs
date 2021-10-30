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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton_ShowNews_Click(object sender, EventArgs e)
    {
        LinkButton m = (LinkButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        Label Label_ID = (Label)GridView_NewsList.Rows[i].Cells[0].FindControl("Label_ID");
        SqlDataSource_News.UpdateParameters["NewsID"].DefaultValue = Label_ID.Text;
        SqlDataSource_News.Update();
        Response.Redirect("~/ShowNews.aspx?ID=" + Label_ID.Text);
    }

    protected void LinkButton_ShowArticle_Click(object sender, EventArgs e)
    {
        LinkButton m = (LinkButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        Label Label_ID = (Label)GridView_ArticleList.Rows[i].Cells[0].FindControl("Label_ID");
        SqlDataSource_ArticleList.UpdateParameters["ArticleID"].DefaultValue = Label_ID.Text;
        SqlDataSource_ArticleList.Update();
        Response.Redirect("~/ShowArticle.aspx?ID=" + Label_ID.Text);
    }

    

}
