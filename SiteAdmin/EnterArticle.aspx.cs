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

public partial class SiteAdmin_AddArticle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label_Date.Text = SDKClass.GetFarsiDate(DateTime.Now, false);
    }

    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                if (FCKeditor_Body.Value == "")
                {
                    Label_Message.Text = "لطفا متن مقاله را وارد کنید";
                    return;
                }
                SqlDataSource_Article.InsertParameters["Body"].DefaultValue = FCKeditor_Body.Value;
                SqlDataSource_Article.Insert();
            }
            catch (Exception ex)
            {
                Label_Message.Text = " به دلیل خطای زیرعمل مورد نظر انجام نشد<br/>" + ex.Message;
            }
        }
    }

    protected void SqlDataSource_Article_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text =String.Format("مقاله مورد نظر با موفقیت در گروه {0} سایت ثبت شد",DropDownList_Category.SelectedItem.ToString());
        TextBox_Abstruct.Text = "";
        TextBox_Title.Text = "";
        TextBox_UserName.Text = "";
        CheckBox_CommentsEnabled.Checked = true;
        CheckBox_OnlyForMembers.Checked = false;
        FCKeditor_Body.Value = "";
    }
}
