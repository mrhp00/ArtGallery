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

public partial class BrowseArticles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton_Show_Click(object sender, EventArgs e)
    {
        LinkButton m = (LinkButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        Label Label_ID = (Label)GridView_ArticleList.Rows[i].Cells[6].FindControl("Label_ID");
        SqlDataSource_ArticleList.UpdateParameters["ArticleID"].DefaultValue = Label_ID.Text;
        SqlDataSource_ArticleList.Update();
        Response.Redirect("~/ShowArticle.aspx?ID=" + Label_ID.Text);
    }
}
