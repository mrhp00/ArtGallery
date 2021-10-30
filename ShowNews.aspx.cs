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

public partial class ShowNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label Label_ID = (Label)FormView_Show.FindControl("Label_ID");
        CheckBox CheckBox_CommentEnabeld = (CheckBox)FormView_Show.FindControl("CheckBox_CommentEnabeld");
        if (CheckBox_CommentEnabeld.Checked)
        {
            FormView_Comment.Visible = true;
            Div_CommentsNews.Visible = true;
            if (User.IsInRole("Admin"))
            {
                GridView_NewsCommentsList.Columns[2].Visible = true;
                GridView_NewsCommentsList.Columns[5].Visible = true;
            }else
            {
                GridView_NewsCommentsList.Columns[2].Visible = false;
                GridView_NewsCommentsList.Columns[5].Visible = false;
            }
            Session["NewsID"] = Label_ID.Text;
        }
        else
        {
            FormView_Comment.Visible = false;
            Div_CommentsNews.Visible = false;
        }
    }

    protected void LinkButton_Delete_Click(object sender, EventArgs e)
    {
        LinkButton m = (LinkButton)sender;
        int RowIndex = Int32.Parse(m.CommandArgument);
        Label Label_ID = (Label)GridView_NewsCommentsList.Rows[RowIndex].Cells[5].FindControl("Label_ID");
        SqlDataSource_CommentsNewsList.DeleteParameters["CommentID"].DefaultValue = Label_ID.Text;
        SqlDataSource_CommentsNewsList.Delete();
    }
}
