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

public partial class SiteAdmin_EnterForums : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                SqlDataSource_Forums.Insert();
            }
            catch (Exception ex)
            {
                Label_Message.Text = " به دلیل خطای زیرعمل مورد نظر انجام نشد<br/>" + ex.Message;
            }
        }
    }
    protected void SqlDataSource_Forums_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "انجمن مورد نظر با موفقیت در تالار "+DropDownList_Category.SelectedItem.Text + " ثبت شد " ;
        TextBox_Name.Text = "";
        TextBox_Position.Text = "";
        TextBox_Description.Text = "";
    }
}
