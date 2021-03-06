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

public partial class EnterArticleComments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Int32.Parse(Session["ArticleID"].ToString()) == 0)
            Response.Redirect("~/BrowseArticleCategories.aspx");
        
        /*TextBox_Comment.Attributes.Add("onfocus", string.Format("this.className = '{0}';", "highlight"));
        TextBox_Comment.Attributes.Add("onblur", "this.className = '';");

        TextBox_Email.Attributes.Add("onfocus", string.Format("this.className = '{0}';", "highlight"));
        TextBox_Email.Attributes.Add("onblur", "this.className = '';");

        TextBox_Name.Attributes.Add("onfocus", string.Format("this.className = '{0}';", "highlight"));
        TextBox_Name.Attributes.Add("onblur", "this.className = '';");*/
    }

    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
            try
            {
                int ArticleID = Int32.Parse(Session["ArticleID"].ToString());
                if (SDKClass.Articles_IsIPHasCommentsForArticle(ArticleID, Request.UserHostAddress))
                {
                    Label_Message.Text = "کاربر گرامی شما قبلا برای این مقاله نظر خود را ثبت کرده اید";
                    Button_Save.Enabled = false;
                    Session["ArticleID"] = 0;
                    return;
                }
                SqlDataSource_EnterArticleComments.InsertParameters["AddedByIP"].DefaultValue = Request.UserHostAddress;
                SqlDataSource_EnterArticleComments.Insert();
            }
            catch (Exception ex)
            {
                Label_Message.Text = "به دلیل خطای زیر نظر شما در بانک سایت ثبت نشد<br/>" + ex.Message;
            }
    }

    protected void SqlDataSource_EnterArticleComments_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        TextBox_Comment.Text = "";
        TextBox_Email.Text = "";
        TextBox_Name.Text = "";
        Label_Message.Text = "نظر شما با موفقیت در سایت ثبت شد";
        Session["ArticleID"] = 0;
    }
}
