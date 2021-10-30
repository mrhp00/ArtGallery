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

public partial class SearchResult : System.Web.UI.Page
{
    #region Page Metode

    protected void Page_Load(object sender, EventArgs e)
    {
        //Forums_SearchReplyKeyWord
        if (!Page.IsPostBack)
        {
            if (Session["SearchType"].ToString() == "user")
            {
                if (Session["DropDown"].ToString() == "1")
                {
                    SqlDataSource_ForumList.SelectCommand = "Forums_SearchTopicsForUSer";
                    SqlDataSource_ForumList.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
                    SqlDataSource_ForumList.SelectParameters.Add("UserID", Session["UserName"].ToString().ToLower());
                    GridView_TopicsList.DataBind();
                }
                else
                {
                    SqlDataSource_ForumList.SelectCommand = "Forums_SearchReplyForUser";
                    SqlDataSource_ForumList.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
                    SqlDataSource_ForumList.SelectParameters.Add("UserID", Session["UserName"].ToString().ToLower());
                    GridView_TopicsList.DataBind();
                }
            }
            else 
            {
                if (Session["DropDown"].ToString() == "1")
                {
                    SqlDataSource_ForumList.SelectCommand = "Forums_SearchReplyKeyWord";
                    SqlDataSource_ForumList.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
                    SqlDataSource_ForumList.SelectParameters.Add("Keyword", Session["KeyWord"].ToString().ToLower());
                    GridView_TopicsList.DataBind();
                }
                else
                {
                    SqlDataSource_ForumList.SelectCommand = "Forums_SearchTopicKeyWord";
                    SqlDataSource_ForumList.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
                    SqlDataSource_ForumList.SelectParameters.Add("Keyword", Session["KeyWord"].ToString().ToLower());
                    GridView_TopicsList.DataBind();
                }
            }
        }
    }
    
    #endregion
}
