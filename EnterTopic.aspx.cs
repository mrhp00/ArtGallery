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

public partial class EnterTopic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label_Date.Text = SDKClass.GetFarsiDate(DateTime.Now, false);
        Label_UserName.Text = User.Identity.Name;
    }

    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                if (FCKeditor_Message.Value == "")
                {
                    Label_Message.Text = " لطفا متن تاپیک را وارد نمایید";
                    return;
                }
                SqlDataSource_TopicSave.InsertParameters["Message"].DefaultValue = FCKeditor_Message.Value;
                SqlDataSource_TopicSave.InsertParameters["UserIP"].DefaultValue = Request.UserHostAddress;
                SqlDataSource_TopicSave.Insert();
            }
            catch(Exception ex)
            {
                Label_Message.Text = "به دلیل خطای زیر تاپیک شما ثبت نشد<br/>"+ex.Message;
            }

        }
    }

    protected void SqlDataSource_TopicSave_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Response.Redirect("~/BrowseForums.aspx?FID="+Session["FID"].ToString());
    }
}
