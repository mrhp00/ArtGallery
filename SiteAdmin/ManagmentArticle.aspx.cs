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

public partial class SiteAdmin_ManagmentArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView_ArticleList.Rows.Count; i++)
            {
                CheckBox CheckBox_Delete = (CheckBox)GridView_ArticleList.Rows[i].Cells[6].FindControl("CheckBox_Delete");
                if (CheckBox_Delete.Checked)
                {
                    Label Label_ID = (Label)GridView_ArticleList.Rows[i].Cells[6].FindControl("Label_ID");
                    SqlDataSource_Article.DeleteParameters["ArticleID"].DefaultValue = Label_ID.Text;
                    SqlDataSource_Article.Delete();

                }
            }
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        }
    }


    protected void GridView_ArticleList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label Label_ID = (Label)GridView_ArticleList.Rows[GridView_ArticleList.SelectedIndex].Cells[6].FindControl("Label_ID");
        string Information = SDKClass.Articles_ArticleDetails(Int32.Parse(Label_ID.Text));
        if (Information != "")
        {
            string[] data = Information.Split('|');
            //AddedDate + ";" + AddedBy + ";" + CategoryID + ";" + Title + ";" + Abstract + ";" + Body + ";" + CommentsEnabled + ";" + OnlyForMembers);
            Label_Date.Text = SDKClass.GetFarsiDate((object)data[0], false);
            TextBox_UserName.Text = data[1];
            for(int i=0;i<DropDownList_CategoryUpdate.Items.Count;i++)
                if(DropDownList_CategoryUpdate.Items[i].Value==data[2])
                {
                    DropDownList_CategoryUpdate.SelectedIndex = i;
                    break;
                }
            TextBox_Title.Text = data[3];
            TextBox_Abstruct.Text = data[4];
            FCKeditor_Body.Value = data[5];
            CheckBox_CommentsEnabled.Checked = Boolean.Parse(data[6]);
            CheckBox_OnlyForMembers.Checked = Boolean.Parse(data[7]);
        }
    }
    protected void Button_Update_Click(object sender, EventArgs e)
    {
        int index = GridView_ArticleList.SelectedIndex;
        try
        {
            Label Label_ID = (Label)GridView_ArticleList.Rows[index].Cells[6].FindControl("Label_ID");
            SqlDataSource_Article.UpdateParameters["ArticleID"].DefaultValue = Label_ID.Text;
            if (FCKeditor_Body.Value == "")
            {
                Label_Message.Text = "لطفا متن مقاله را وارد نمایید";
                return;
            }
            else
                SqlDataSource_Article.UpdateParameters["Body"].DefaultValue = FCKeditor_Body.Value;
            SqlDataSource_Article.Update();
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه انتخابی بروزرسانی نشد<br/>" + ex.Message;
        }
    }
    protected void SqlDataSource_Article_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "گزینه انتخابی با موفقیت بروزرسانی شد";
        GridView_ArticleList.DataBind();
        FCKeditor_Body.Value = "";
        TextBox_Abstruct.Text = "";
        TextBox_Title.Text = "";
        TextBox_UserName.Text = "";
        DropDownList_CategoryUpdate.SelectedIndex = 0;
        Label_Date.Text = "";
        CheckBox_CommentsEnabled.Checked = false;
        CheckBox_OnlyForMembers.Checked = false;
    }
    protected void DropDownList_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        FCKeditor_Body.Value = "";
        TextBox_Abstruct.Text = "";
        TextBox_Title.Text = "";
        TextBox_UserName.Text = "";
        DropDownList_CategoryUpdate.SelectedIndex = 0;
        Label_Date.Text = "";
        CheckBox_CommentsEnabled.Checked = false;
        CheckBox_OnlyForMembers.Checked = false;
    }
}
