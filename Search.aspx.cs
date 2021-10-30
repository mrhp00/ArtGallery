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

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Search2_Click(object sender, EventArgs e)
    {
        Session.Add("SearchType","user");
        Session.Add("UserName",TextBox_UserName.Text);
        Session.Add("DropDown", DropDownList_Type2.SelectedValue);
        Response.Redirect("~/SearchResult.aspx");
    }

    protected void Button_Serach_Click(object sender, EventArgs e)
    {
        Session.Add("SearchType", "topic");
        Session.Add("KeyWord", TextBox_KeyWord.Text);
        Session.Add("DropDown", DropDownList_Type.SelectedValue);
        Response.Redirect("~/SearchResult.aspx");
    }
}
