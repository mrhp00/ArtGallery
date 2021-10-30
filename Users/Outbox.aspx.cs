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

public partial class Users_Outbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView_OutBox_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow item = e.Row;
        if (item.DataItem == null)
        {
            return;
        }

        HyperLink HyperLink_Subject = (HyperLink)item.FindControl("HyperLink_Subject");
        CheckBox CheckBox_IsRead = (CheckBox)item.FindControl("CheckBox_IsRead");
        Image Image_Read = (Image)item.FindControl("Image_Read");

        if (CheckBox_IsRead.Checked)
        {
            HyperLink_Subject.Font.Bold = false;
            Image_Read.ImageUrl = "~/Images/ReadMessage.gif";
        }
        else
        {
            HyperLink_Subject.Font.Bold = true;
            Image_Read.ImageUrl = "~/Images/NewMessage.gif";
        }
    }
}
