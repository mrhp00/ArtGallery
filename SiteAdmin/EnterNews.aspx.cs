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
using farhaniPersianDate;

public partial class SiteAdmin_EnterNewsAndNotics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label_Date.Text = SDKClass.GetFarsiDate(DateTime.Now, true);
    }

    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string filename = DateTime.Now.Second.ToString()+ FileUpload1.FileName;
            try
            {
                if (FileUpload1.HasFile)
                {
                    if (SDKClass.IsValidFileType(filename))
                    
                    FileUpload1.SaveAs(Server.MapPath("~/NewsImage/") + filename);
                        else 
                    {
                        Label_Message.Text = "لطفا فایل عکس با یکی از پسوندهای .gif , .jpg , .jpeg را وارد نمایید";
                        return;
                    }
                }
                SqlDataSource_SaveNews.InsertParameters["NewsImage"].DefaultValue = filename;
                SqlDataSource_SaveNews.InsertParameters["Body"].DefaultValue = FCKEditor_Body.Value;
                SqlDataSource_SaveNews.Insert();
            }
            catch (Exception ex)
            {
                Label_Message.Text = "به دلیل خطای زیر عمل مورد نظر با شکست روبرو شد<br/>" + ex.Message;
            }
        }
    }
    protected void SqlDataSource_SaveNews_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "خبر مورد نظر با موفقیت در سایت ثبت شد.";
        TextBox_Abstruct.Text = "";
        FCKEditor_Body.Value = "";
        TextBox_Title.Text = "";
        CheckBox_EnabledComments.Checked = false;
    }
}
