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

public partial class Users_Inbox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void GridView_Inbox_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow item = e.Row;
        if (item.DataItem == null)
        {
            return;
        }

        LinkButton LinkButton_Subject = (LinkButton)item.FindControl("LinkButton_Subject");
        CheckBox CheckBox_IsRead = (CheckBox)item.FindControl("CheckBox_IsRead");
        Image Image_Read = (Image)item.FindControl("Image_Read");

        if (CheckBox_IsRead.Checked)
        {
            LinkButton_Subject.Font.Bold = false;
            Image_Read.ImageUrl = "~/Images/ReadMessage.gif";
        }
        else
        {
            LinkButton_Subject.Font.Bold = true;
            Image_Read.ImageUrl = "~/Images/NewMessage.gif";
        }


    }

    protected void ImageButton_Reply_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton m = (ImageButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        HyperLink HyperLink_Sender = (HyperLink)GridView_Inbox.Rows[i].FindControl("HyperLink_Sender");
        Session.Add("Reciver", HyperLink_Sender.Text);
        Response.Redirect("~/Users/SnedPMMessage.aspx");
    }

    protected void LinkButton_Subject_Click(object sender, EventArgs e)
    {
        LinkButton m = (LinkButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        Label Label_MessageID = (Label)GridView_Inbox.Rows[i].FindControl("Label_MessageID");
        SqlDataSource_Inbox.UpdateParameters["MessageID"].DefaultValue = Label_MessageID.Text;
        SqlDataSource_Inbox.Update();
        Response.Redirect("~/Users/ShowMessage.aspx?mid="+Label_MessageID.Text);
    }

    protected void ImageButton_Delete_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow row in GridView_Inbox.Rows)
        {
            CheckBox CheckBox_Delete = (CheckBox)row.FindControl("CheckBox_Delete");
            if (CheckBox_Delete.Checked)
            {
                Label Label_MessageID = (Label)row.FindControl("Label_MessageID");
                SqlDataSource_Inbox.DeleteParameters["MessageID"].DefaultValue = Label_MessageID.Text;
                SqlDataSource_Inbox.Delete();
            }
        }
    }
}
