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

public partial class SiteAdmin_ManagmentForumsCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView_ForumCategoriesList.Rows.Count; i++)
            {
                CheckBox CheckBox_Delete = (CheckBox)GridView_ForumCategoriesList.Rows[i].Cells[2].FindControl("CheckBox_Delete");
                if (CheckBox_Delete.Checked)
                { 
                    Label Label_ID = (Label)GridView_ForumCategoriesList.Rows[i].Cells[2].FindControl("Label_ID");
                    SqlDataSource_ForumCategories.DeleteParameters["CategoryID"].DefaultValue = Label_ID.Text;
                    SqlDataSource_ForumCategories.Delete();
                    
                }
            }
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        }
    }
   
    protected void GridView_ForumCategoriesList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label Label_ID = (Label)GridView_ForumCategoriesList.Rows[GridView_ForumCategoriesList.SelectedIndex].Cells[2].FindControl("Label_ID");
        string Information = SDKClass.Forums_CategoryDetails(Int32.Parse(Label_ID.Text));
        if (Information != "")
        {
            string[] data = Information.Split(';');
            TextBox_Name.Text=data[0];
            TextBox_Position.Text=data[1];
        }
    }
    
    protected void Button_Update_Click(object sender, EventArgs e)
    {
        int index = GridView_ForumCategoriesList.SelectedIndex;
        try
        {
            Label Label_ID = (Label)GridView_ForumCategoriesList.Rows[index].Cells[2].FindControl("Label_ID");
            SqlDataSource_ForumCategories.UpdateParameters["CategoryID"].DefaultValue = Label_ID.Text;
            SqlDataSource_ForumCategories.Update();
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه انتخابی بروزرسانی نشد<br/>" + ex.Message;
        }
    }

    protected void SqlDataSource_ForumCategories_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "گزینه انتخابی با موفقیت بروزرسانی شد";
        GridView_ForumCategoriesList.DataBind();
        TextBox_Position.Text = "";
        TextBox_Name.Text = "";
    }
}
