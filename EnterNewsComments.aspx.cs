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

public partial class EnterNewsComments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Int32.Parse(Session["NewsID"].ToString()) == 0)
            Response.Redirect("~/BrowseNews.aspx");
    }

    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
            try
            {
                int NewsID = Int32.Parse(Session["NewsID"].ToString());
                if (SDKClass.News_IsIPHasCommentsForNews(NewsID, Request.UserHostAddress))
                {
                    Label_Message.Text = "کاربر گرامی شما قبلا برای این خبر نظر خود را ثبت کرده اید";
                    Button_Save.Enabled = false;
                    Session["NewsID"] = 0;
                    return;
                }
                SqlDataSource_EnterNewsComments.InsertParameters["AddedByIP"].DefaultValue = Request.UserHostAddress;
                SqlDataSource_EnterNewsComments.Insert();
            }
            catch (Exception ex)
            {
                Label_Message.Text = "به دلیل خطای زیر نظر شما در بانک سایت ثبت نشد<br/>" + ex.Message;
            }
    }

    protected void SqlDataSource_EnterNewsComments_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        TextBox_Comment.Text = "";
        TextBox_Email.Text = "";
        TextBox_Name.Text = "";
        Label_Message.Text = "نظر شما با موفقیت در سایت ثبت شد";
        Session["NewsID"] = 0;
    }
}
