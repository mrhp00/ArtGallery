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

public partial class SiteAdmin_EnterArticleCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }
    
    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string filename = DateTime.Now.Second.ToString() + FileUpload1.FileName;
            try 
            {
                if (FileUpload1.HasFile)
                {
                    if (SDKClass.IsValidFileType(FileUpload1.FileName))
                        FileUpload1.SaveAs(Server.MapPath("~/CategoriesImage/") + filename);
                    else 
                    {
                        Label_Messasge.Text = "لطفا فایل عکس با یکی از پسوندهای .gif , .jpg , .jpeg را وارد نمایید";
                        return;
                    }
                }
                SqlDataSource_Category.InsertParameters["ImageUrl"].DefaultValue = filename;
                SqlDataSource_Category.Insert();
            }
            catch (Exception ex)
            {
                Label_Messasge.Text = " به دلیل خطای زیرعمل مورد نظر انجام نشد<br/>" + ex.Message;
            }
        }
    }
    protected void SqlDataSource_Category_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        Label_Messasge.Text = "گروه مورد نظر با موفقیت در سایت ثبت شد";
        TextBox_Description.Text = "";
        TextBox_Title.Text = "";
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
}
