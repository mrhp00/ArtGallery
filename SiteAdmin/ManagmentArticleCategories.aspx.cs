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

public partial class SiteAdmin_ManagmentArticleCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(2000);
    }

    protected void GridView_Category_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.DataItem == null)
        {
            return;
        }

        Label Label_Image = (Label)row.FindControl("Label_Image");
        if (Label_Image.Text == "")
        {
            Image Image_Category = (Image)row.FindControl("Image_Category");
            Image_Category.Visible = false;
        }
    }

    protected void Button_Delete_Click(object sender, EventArgs e)
    {
        try
        {
            for (int i = 0; i < GridView_Category.Rows.Count; i++)
            {
                CheckBox CheckBox_Delete = (CheckBox)GridView_Category.Rows[i].Cells[5].FindControl("CheckBox_Delete");
                if (CheckBox_Delete.Checked)
                {
                    Label Label_ID = (Label)GridView_Category.Rows[i].Cells[5].FindControl("Label_ID");
                    SqlDataSource_Category.DeleteParameters["CategoryID"].DefaultValue = Label_ID.Text;
                    SqlDataSource_Category.Delete();

                }
            }
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه های انتخابی حذف نشدند<br/>" + ex.Message;
        }
    }

    protected void GridView_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label Label_ID = (Label)GridView_Category.Rows[GridView_Category.SelectedIndex].Cells[5].FindControl("Label_ID");
        string Information = SDKClass.Articles_CategoryDetails(Int32.Parse(Label_ID.Text));
        if (Information != "")
        {
            string[] data = Information.Split(';');
            TextBox_Title.Text = data[0];
            TextBox_Description.Text = data[1];
            Label_FileName.Text = data[2];
            Label_UserName.Text = data[3];
            Label_Date.Text=SDKClass.GetFarsiDate((object)data[4],false);
        }
    }

    protected void Button_Update_Click(object sender, EventArgs e)
    {
        int index = GridView_Category.SelectedIndex;
        try
        {
            if (FileUpload1.HasFile)
            {
                System.IO.File.Delete(Server.MapPath("~/CategoriesImage/") + Label_FileName);
                FileUpload1.SaveAs(Server.MapPath("~/CategoriesImage/") + DateTime.Now.Second.ToString() + FileUpload1.FileName);
            }
            else
                SqlDataSource_Category.UpdateParameters["ImageUrl"].DefaultValue = Label_FileName.Text;
            Label Label_ID = (Label)GridView_Category.Rows[index].Cells[5].FindControl("Label_ID");
            SqlDataSource_Category.UpdateParameters["CategoryID"].DefaultValue = Label_ID.Text;
            SqlDataSource_Category.Update();
        }
        catch (Exception ex)
        {
            Label_Message.Text = "به دلیل خطای زیر گزینه انتخابی بروزرسانی نشد<br/>" + ex.Message;
        }
    }

    protected void SqlDataSource_Category_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Message.Text = "گزینه انتخابی با موفقیت بروزرسانی شد";
        GridView_Category.DataBind();
        TextBox_Description.Text = "";
        TextBox_Title.Text = "";
        Label_FileName.Text = "";
        Label_Date.Text = "";
        Label_UserName.Text="";
    }
}
