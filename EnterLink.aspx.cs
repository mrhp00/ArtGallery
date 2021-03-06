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

public partial class EnterLink : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource_Link_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "نام سایت با موفقیت ثبت شد";
        TextBox_Address.Text = "";
        TextBox_Name.Text = "";
    }

    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                SqlDataSource_Link.Insert();
            }
            catch (Exception ex)
            {
                Label_Message.Text = "به دلیل خطای زیر لینک در سایت ثبت نشد<br/>" + ex.Message;
            }
        }

    }
}
