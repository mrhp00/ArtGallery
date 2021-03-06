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

public partial class SiteAdmin_ManagmentForums : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView_ForumList.Rows.Count; i++)
            {
                CheckBox CheckBox_Delete = (CheckBox)GridView_ForumList.Rows[i].Cells[3].FindControl("CheckBox_Delete");
                if (CheckBox_Delete.Checked)
                {
                    Label Label_ID = (Label)GridView_ForumList.Rows[i].Cells[3].FindControl("Label_ID");
                    SqlDataSource_Forums.DeleteParameters["ForumID"].DefaultValue = Label_ID.Text;
                    SqlDataSource_Forums.Delete();
                }
            }
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        }
    }

    protected void GridView_ForumList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label Label_ID = (Label)GridView_ForumList.Rows[GridView_ForumList.SelectedIndex].Cells[3].FindControl("Label_ID");
        string Information = SDKClass.Forums_ForumDetails(Int32.Parse(Label_ID.Text));
        if (Information != "")
        {//CategoryID + ";" + ForumName + ";" + ForumDescription + ";" + ForumPosition);
            string[] data = Information.Split(';');
            for (int i = 0; i < DropDownList_CategoryUpdate.Items.Count; i++)
                if (DropDownList_CategoryUpdate.Items[i].Value == data[0])
                {
                    DropDownList_CategoryUpdate.SelectedIndex = i;
                    break;
                }
            TextBox_Name.Text = data[1];
            TextBox_Description.Text = data[2];
            TextBox_Position.Text = data[3];
        }
    }

    protected void SqlDataSource_Forums_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "گزینه انتخابی با موفقیت بروزرسانی شد";
        GridView_ForumList.DataBind();
        TextBox_Position.Text = "";
        TextBox_Name.Text = "";
        TextBox_Description.Text = "";
        DropDownList_CategoryUpdate.SelectedIndex = 0;
    }

    protected void Button_Update_Click(object sender, EventArgs e)
    {
        int index = GridView_ForumList.SelectedIndex;
        try
        {
            Label Label_ID = (Label)GridView_ForumList.Rows[index].Cells[3].FindControl("Label_ID");
            SqlDataSource_Forums.UpdateParameters["ForumID"].DefaultValue = Label_ID.Text;
            SqlDataSource_Forums.Update();
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه انتخابی بروزرسانی نشد<br/>" + ex.Message;
        }
    }

    protected void DropDownList_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox_Position.Text = "";
        TextBox_Name.Text = "";
        TextBox_Description.Text = "";
        DropDownList_CategoryUpdate.SelectedIndex = 0;
    }
}
