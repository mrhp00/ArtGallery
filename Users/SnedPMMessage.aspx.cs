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

public partial class Users_SnedPMMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label_Date.Text = SDKClass.GetFarsiDate(DateTime.Now, false);
        Label_Reciver.Text = Session["Reciver"].ToString();
        Label_Sender.Text = User.Identity.Name;
    }

    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                if (FCKeditor_Message.Value == "")
                {
                    Label_Message.Text = " لطفا متن پیغام را وارد نمایید";
                    return;
                }
                SqlDataSource_Message.InsertParameters["Message"].DefaultValue = FCKeditor_Message.Value;
                SqlDataSource_Message.Insert();
            }
            catch (Exception ex)
            {
                Label_Message.Text = "به دلیل خطای زیر پیغام شما ارسال نشد<br/>" + ex.Message;
            }

        }
    }

    protected void SqlDataSource_Message_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "پیغام شما با موفقیت ارسال شد";
        TextBox_Subject.Text = "";
        FCKeditor_Message.Value = "";
    }
}
