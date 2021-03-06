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

public partial class ManagmentLinks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView_Links.Rows.Count; i++)
            {
                CheckBox CheckBox_Delete = (CheckBox)GridView_Links.Rows[i].Cells[3].FindControl("CheckBox_Delete");
                if (CheckBox_Delete.Checked)
                {
                    Label Label_ID = (Label)GridView_Links.Rows[i].Cells[3].FindControl("Label_ID");
                    SqlDataSource_Link.DeleteParameters["LinkID"].DefaultValue = Label_ID.Text;
                    SqlDataSource_Link.Delete();

                }
            }
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        }
    }

    protected void Button_Update_Click(object sender, EventArgs e)
    {
        int index = GridView_Links.SelectedIndex;
        try
        {
            Label Label_ID = (Label)GridView_Links.Rows[index].Cells[3].FindControl("Label_ID");
            SqlDataSource_Link.UpdateParameters["LinkID"].DefaultValue = Label_ID.Text;
            SqlDataSource_Link.Update();
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه انتخابی بروزرسانی نشد<br/>" + ex.Message;
        }
    }

    protected void SqlDataSource_Link_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "گزینه انتخابی با موفقیت بروزرسانی شد";
        GridView_Links.DataBind();
        TextBox_Address.Text = "";
        TextBox_Name.Text = "";
        CheckBox_AcceptLink.Checked = false;
    }

    protected void GridView_Links_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label Label_ID = (Label)GridView_Links.Rows[GridView_Links.SelectedIndex].Cells[3].FindControl("Label_ID");
        string Information = SDKClass.Links_LinkDetails(Int32.Parse(Label_ID.Text));
        if (Information != "")
        {
            string[] data = Information.Split(';');
            TextBox_Name.Text = data[0];
            TextBox_Address.Text = data[1];
            CheckBox_AcceptLink.Checked = Boolean.Parse(data[2]);
        }
    }
}
