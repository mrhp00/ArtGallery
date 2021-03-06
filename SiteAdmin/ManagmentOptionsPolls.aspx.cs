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

public partial class SiteAdmin_ManagmentOptionsPolls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView_PollsOption.Rows.Count; i++)
            {
                CheckBox CheckBox_Delete = (CheckBox)GridView_PollsOption.Rows[i].Cells[3].FindControl("CheckBox_Delete");
                if (CheckBox_Delete.Checked)
                {
                    Label Label_ID = (Label)GridView_PollsOption.Rows[i].Cells[3].FindControl("Label_ID");
                    SqlDataSource_PollsOption.DeleteParameters["OptionID"].DefaultValue = Label_ID.Text;
                    SqlDataSource_PollsOption.Delete();
                }
            }
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        }
    }

    protected void GridView_PollsOption_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label Label_ID = (Label)GridView_PollsOption.Rows[GridView_PollsOption.SelectedIndex].Cells[3].FindControl("Label_ID");
        string Information = SDKClass.Polls_OptionsPollDetails(Int32.Parse(Label_ID.Text));
        if (Information != "")
        {
            string[] data = Information.Split(';');
            for (int i = 0; i < DropDownList_QuastionsUpdate.Items.Count; i++)
                if (DropDownList_QuastionsUpdate.Items[i].Value == data[1])
                {
                    DropDownList_QuastionsUpdate.SelectedIndex = i;
                    break;
                }
            TextBox_Option.Text = data[0];
        }
    }

    protected void Button_Update_Click(object sender, EventArgs e)
    {
        int index = GridView_PollsOption.SelectedIndex;
        try
        {
            Label Label_ID = (Label)GridView_PollsOption.Rows[index].Cells[3].FindControl("Label_ID");
            SqlDataSource_PollsOption.UpdateParameters["OptionID"].DefaultValue = Label_ID.Text;
            SqlDataSource_PollsOption.Update();
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه انتخابی بروزرسانی نشد<br/>" + ex.Message;
        }
    }

    protected void SqlDataSource_PollsOption_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "گزینه انتخابی با موفقیت بروزرسانی شد";
        GridView_PollsOption.DataBind();
        TextBox_Option.Text = "";
        DropDownList_QuastionsUpdate.SelectedIndex = 0;
    }

    protected void DropDownList_Quastion_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox_Option.Text = "";
        DropDownList_QuastionsUpdate.SelectedIndex = 0;
    }
}
