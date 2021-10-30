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

public partial class BrowseArticleCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DataList_Categories_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label Label_Image = (Label)e.Item.FindControl("Label_Image");
        Label Label_Count = (Label)e.Item.FindControl("Label_Count");
        Label Label_ID = (Label)e.Item.FindControl("Label_ID");
        
        Label_Count.Text = String.Format("({0})", SDKClass.Articles_CategoryCount(Int32.Parse(Label_ID.Text)));
        Image HyperLink_Image = (Image)e.Item.FindControl("HyperLink_Image");
        if (Label_Image.Text == "")
            HyperLink_Image.Visible = false;
        else
            HyperLink_Image.ImageUrl = "~/CategoriesImage/" + Label_Image.Text;
    }
}
