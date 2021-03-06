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

public partial class SiteAdmin_EnterQuastionsPolls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
            try
            {
                if (CheckBox_IsCurrentPolls.Checked)
                    SqlDataSource_InsertPollsQuastions.InsertParameters["IsCurrentQuestion"].DefaultValue = "1";
                else
                    SqlDataSource_InsertPollsQuastions.InsertParameters["IsCurrentQuestion"].DefaultValue = "0";

                if (CheckBox_IsArchived.Checked)
                    SqlDataSource_InsertPollsQuastions.InsertParameters["Archived"].DefaultValue = "1";
                else
                    SqlDataSource_InsertPollsQuastions.InsertParameters["Archived"].DefaultValue = "0";

                SqlDataSource_InsertPollsQuastions.Insert();

            }
            catch (Exception ex)
            {
                Label_Message.Text = "نظر سنجی مورد نظر به دلیل خطای زیر در سایت ثبت نشد<br/>" + ex.Message;
            }
    }
    protected void SqlDataSource_InsertPollsQuastions_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "نظر سنجی مورد نظر با موفقیت در سایت ثبت شد";
        TextBox_Quastions.Text = "";
        CheckBox_IsCurrentPolls.Checked = true;
        CheckBox_IsArchived.Checked = false;
    }
    protected void Button_Show_Click(object sender, EventArgs e)
    {
        GridView_QustionPollsList.DataBind();
    }
}
