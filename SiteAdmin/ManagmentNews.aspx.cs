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

public partial class SiteAdmin_ManagmentNews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView_NewsList.Rows.Count; i++)
            {
                CheckBox CheckBox_Delete = (CheckBox)GridView_NewsList.Rows[i].Cells[4].FindControl("CheckBox_Delete");
                if (CheckBox_Delete.Checked)
                {
                    Label Label_ID = (Label)GridView_NewsList.Rows[i].Cells[4].FindControl("Label_ID");
                    SqlDataSource_News.DeleteParameters["ID"].DefaultValue = Label_ID.Text;
                    SqlDataSource_News.Delete();
                }
            }
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        }
    }

    protected void GridView_NewsList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label Label_ID = (Label)GridView_NewsList.Rows[GridView_NewsList.SelectedIndex].Cells[4].FindControl("Label_ID");
        string Information = SDKClass.News_NewsDetails(Int32.Parse(Label_ID.Text));
        if (Information != "")
        {
            string[] data = Information.Split('|');
            Label_Date.Text = SDKClass.GetFarsiDate((object)data[5], false);
            TextBox_Title.Text = data[0];
            TextBox_Abstruct.Text = data[1];
            FCKEditor_Body.Value = data[2];
            Label_FileName.Text = data[3];
            CheckBox_EnabledComments.Checked = Boolean.Parse(data[4]);
        }
    }

    protected void Button_Update_Click(object sender, EventArgs e)
    {
        string filename = DateTime.Now.Second.ToString() + FileUpload1.FileName;
        int index = GridView_NewsList.SelectedIndex;
        try
        {
            if (FileUpload1.HasFile)
            {
                if (SDKClass.IsValidFileType(filename))
                {
                    System.IO.File.Delete(Server.MapPath("~/NewsImage/") + Label_FileName);
                    FileUpload1.SaveAs(Server.MapPath("~/NewsImage/") + filename);
                    SqlDataSource_News.InsertParameters["NewsImage"].DefaultValue = filename;
                }
                else
                {
                    Label_Message.Text = "لطفا فایل عکس با یکی از پسوندهای .gif , .jpg , .jpeg را وارد نمایید";
                    return;
                }

            }
            else
                SqlDataSource_News.UpdateParameters["NewsImage"].DefaultValue = Label_FileName.Text;

            Label Label_ID = (Label)GridView_NewsList.Rows[index].Cells[4].FindControl("Label_ID");
            if (FCKEditor_Body.Value == "")
            {
                Label_Message.Text = "لطفا متن خبر را وارد نمایید";
                return;
            }
            else
                SqlDataSource_News.UpdateParameters["Body"].DefaultValue = FCKEditor_Body.Value;

            SqlDataSource_News.UpdateParameters["NewsID"].DefaultValue = Label_ID.Text;
            SqlDataSource_News.Update();
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه انتخابی بروزرسانی نشد<br/>" + ex.Message;
        }
    }

    protected void SqlDataSource_News_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "گزینه انتخابی با موفقیت بروزرسانی شد";
        GridView_NewsList.DataBind();
        Label_Date.Text = "";
        Label_FileName.Text = "";
        TextBox_Abstruct.Text = "";
        TextBox_Title.Text = "";
        FCKEditor_Body.Value = "";
        CheckBox_EnabledComments.Checked = false;
    }
}
