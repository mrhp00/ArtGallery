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

public partial class SiteAdmin_ManagmentQuastionsPolls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView_QuastionsPollList.Rows.Count; i++)
            {
                CheckBox CheckBox_Delete = (CheckBox)GridView_QuastionsPollList.Rows[i].Cells[3].FindControl("CheckBox_Delete");
                if (CheckBox_Delete.Checked)
                {
                    Label Label_ID = (Label)GridView_QuastionsPollList.Rows[i].Cells[3].FindControl("Label_ID");
                    SqlDataSource_PollsQuastions.DeleteParameters["QuestionID"].DefaultValue = Label_ID.Text;
                    SqlDataSource_PollsQuastions.Delete();

                }
            }
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        }
    }

    protected void GridView_QuastionsPollList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label Label_ID = (Label)GridView_QuastionsPollList.Rows[GridView_QuastionsPollList.SelectedIndex].Cells[3].FindControl("Label_ID");
        string Information = SDKClass.Polls_QuastionsDetails(Int32.Parse(Label_ID.Text));
        if (Information != "")
        {
            string[] data = Information.Split(';');
            Label_Date.Text = SDKClass.GetFarsiDate((object)data[0], false);
            TextBox_Quastions.Text = data[1];
            CheckBox_IsCurrentPolls.Checked = Boolean.Parse(data[2]);
            CheckBox_IsArchived.Checked = Boolean.Parse(data[3]);
        }
    }

    protected void Button_Update_Click(object sender, EventArgs e)
    {
        int index = GridView_QuastionsPollList.SelectedIndex;
        try
        {
            Label Label_ID = (Label)GridView_QuastionsPollList.Rows[index].Cells[3].FindControl("Label_ID");
            SqlDataSource_PollsQuastions.UpdateParameters["QuestionID"].DefaultValue = Label_ID.Text;
            SqlDataSource_PollsQuastions.Update();
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه انتخابی بروزرسانی نشد<br/>" + ex.Message;
        }
    }

    protected void SqlDataSource_PollsQuastions_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "گزینه انتخابی با موفقیت بروزرسانی شد";
        GridView_QuastionsPollList.DataBind();
        Label_Date.Text = "";
        TextBox_Quastions.Text = "";
        CheckBox_IsArchived.Checked = false;
        CheckBox_IsCurrentPolls.Checked = false;
    }
}

