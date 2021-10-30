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

public partial class SiteAdmin_EnterOptionsPoll : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
            try
            {
                SqlDataSource_PollQuastions.Insert();
            }
            catch (Exception ex)
            {
                Label_Message.Text = "گزینه مورد نظر به دلیل خطای زیر در بانک سایت ثبت نشد<br/>" + ex.Message;
            }
    }
    protected void SqlDataSource_PollQuastions_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        TextBox_Option.Text = "";
        Label_Message.Text = "گزینه مورد نظر با موفقیت در سایت ثبت شد";
        if (DropDownList_Quastions.Items.Count>0)
            DropDownList_Quastions.SelectedIndex = 0;
    }
}
