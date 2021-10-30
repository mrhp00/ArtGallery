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
using farhaniPersianDate;
public partial class BrowseNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton_ShowNews_Click(object sender, EventArgs e)
    {
        LinkButton m = (LinkButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        Label Label_ID = (Label)GridView_NewsList.Rows[i].Cells[4].FindControl("Label_ID");
        SqlDataSource_NewsArchive.UpdateParameters["NewsID"].DefaultValue = Label_ID.Text;
        SqlDataSource_NewsArchive.Update();
        Response.Redirect("~/ShowNews.aspx?ID=" + Label_ID.Text);
    }
}
