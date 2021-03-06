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

public partial class ShowArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckBox CheckBox_OnlyForMembers = (CheckBox)FormView_ShowArticle.FindControl("CheckBox_OnlyForMembers");
        if (CheckBox_OnlyForMembers.Checked)
        {
            if (!User.Identity.IsAuthenticated)
            {
                FormView_ShowArticle.Visible = false;
                FormView_Comment.Visible = false;
                Div_ArticleComments.Visible = false;
                FormView_Comment.Visible = false;
                Label_Message.Text = "برای دیدن این مقاله باید عضو سایت باشید";
                Label_Message.Visible = true;
                return;
            }
        }

        Label Label_ID = (Label)FormView_ShowArticle.FindControl("Label_ID");

        CheckBox CheckBox_CommentsEnabled = (CheckBox)FormView_ShowArticle.FindControl("CheckBox_CommentsEnabled");
        if (CheckBox_CommentsEnabled.Checked)
        {
            FormView_Comment.Visible = true;
            Div_ArticleComments.Visible = true;
            if (User.IsInRole("Admin"))
            {
                GridView_ArticleCommentsList.Columns[2].Visible = true;
                GridView_ArticleCommentsList.Columns[5].Visible = true;
            }
            else
            {
                GridView_ArticleCommentsList.Columns[2].Visible = false;
                GridView_ArticleCommentsList.Columns[5].Visible = false;
            }
            Session["ArticleID"] = Label_ID.Text;
        }
        else
        {
            FormView_Comment.Visible = false;
            Div_ArticleComments.Visible = false;
        }
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        LinkButton m = (LinkButton)sender;
        int RowIndex = Int32.Parse(m.CommandArgument);
        Label Label_ID = (Label)GridView_ArticleCommentsList.Rows[RowIndex].Cells[5].FindControl("Label_ID");
        SqlDataSource_CommentsArticleList.DeleteParameters["CommentID"].DefaultValue = Label_ID.Text;
        SqlDataSource_CommentsArticleList.Delete();
    }
}
