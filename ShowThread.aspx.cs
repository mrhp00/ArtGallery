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

public partial class ShowThread : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            ImageButton_Reply.Visible = true;
            FCKeditor_Reply.Visible = true;
        }
        else
        {
            ImageButton_Reply.Visible = false;
            FCKeditor_Reply.Visible = false;
        }
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["tid"].ToString() != "")
                SqlDataSource_ShowThread.Update();
        }
    }
    
    protected void ImageButton_Reply_Click(object sender, ImageClickEventArgs e)
    {
        if (FCKeditor_Reply.Value == "")
        {
            Label_Message.Text = "لطفا پاسخ خود را وارد نمایید";
        }
        else if (User.Identity.IsAuthenticated)
        {
            Label Label_ForumID = (Label)GridView_Topic.Rows[0].FindControl("Label_ForumID");
            SqlDataSource_ShowReply.InsertParameters["Message"].DefaultValue = FCKeditor_Reply.Value;
            SqlDataSource_ShowReply.InsertParameters["UserIP"].DefaultValue = Request.UserHostAddress;
            SqlDataSource_ShowReply.InsertParameters["UserID"].DefaultValue = User.Identity.Name;
            SqlDataSource_ShowReply.InsertParameters["ForumID"].DefaultValue = Label_ForumID.Text;
            SqlDataSource_ShowReply.Insert();
        }
        else
            Label_Message.Text = "شما برای پاسخ دهی باید ابتدا به سایت وارد شوید";
    }

    protected void SqlDataSource_ShowReply_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        FCKeditor_Reply.Value = "";
        
    }
    
    protected void ImageButton_Edit_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton m = (ImageButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        Label Label_TopicID = (Label)GridView_Topic.Rows[i].FindControl("Label_TopicID");
        Session.Add("ReplyID", 0);
        Session.Add("TopicID", Label_TopicID.Text);
        Session.Add("tid", Label_TopicID.Text);
        Response.Redirect("~/EditPost.aspx");
    }

    protected void ImageButton_Delete_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton m = (ImageButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        Label Label_ReplyID = (Label)GridView_ReplyList.Rows[i].FindControl("Label_ReplyID");
        SqlDataSource_ShowReply.DeleteParameters["ReplyID"].DefaultValue = Label_ReplyID.Text;
        SqlDataSource_ShowReply.Delete();
    }

    protected void ImageButton_Edit_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton m = (ImageButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        Label Label_ReplyID = (Label)GridView_ReplyList.Rows[i].FindControl("Label_ReplyID");
        Session.Add("ReplyID", Label_ReplyID.Text);
        Session.Add("TopicID", 0);
        Session.Add("tid", Request.QueryString["tid"].ToString());
        Response.Redirect("~/EditPost.aspx");
    }

    protected void ImageButton_SendPM_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton m = (ImageButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        HyperLink HyperLink_Username = (HyperLink)GridView_Topic.Rows[i].FindControl("HyperLink_Username");
        Session.Add("Reciver", HyperLink_Username.Text);
        Response.Redirect("~/Users/SnedPMMessage.aspx");
    }

    protected void ImageButton_SendPM_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton m = (ImageButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        HyperLink HyperLink_Username = (HyperLink)GridView_ReplyList.Rows[i].FindControl("HyperLink_Username");
        Session.Add("Reciver", HyperLink_Username.Text);
        Response.Redirect("~/Users/SnedPMMessage.aspx");
    }

    protected void GridView_Topic_DataBound(object sender, EventArgs e)
    {
        GridView gridview = (GridView)sender;
        foreach (GridViewRow item in gridview.Rows)
        {
            HyperLink HyperLink_Username = (HyperLink)item.FindControl("HyperLink_Username");
            Label Label_RegisterDate = (Label)item.FindControl("Label_RegisterDate");
            Label Label_WriteCount = (Label)item.FindControl("Label_WriteCount");
            Label Label_Signature = (Label)item.FindControl("Label_Signature");
            Label Label_Location = (Label)item.FindControl("Label_Location");
            Label Label_TypeUser = (Label)item.FindControl("Label_TypeUser");

            ProfileCommon common = Profile.GetProfile(HyperLink_Username.Text);
            Label_Signature.Text = common.Signature;
            Label_Location.Text = common.Sokonat;
            Label_WriteCount.Text = SDKClass.Forums_PostCountForUser(HyperLink_Username.Text).ToString();
            MembershipUser user = Membership.GetUser(HyperLink_Username.Text);
            Label_RegisterDate.Text = SDKClass.GetFarsiDate(user.CreationDate, false);
            Label_TypeUser.Text = SDKClass.Membership_TypeUser(HyperLink_Username.Text);


            Image Image_Online = (Image)item.FindControl("Image_Online");

            if (user.IsOnline)
            {
                Image_Online.ImageUrl = "~/Images/user_online.gif";
                Image_Online.ToolTip = "کاربر مورد نظر هم اکنون در سایت حضور دارد";
            }
            else
            {
                Image_Online.ImageUrl = "~/Images/user_offline.gif";
                Image_Online.ToolTip = "کاربر مورد نظر هم اکنون در سایت حضور ندارد";
            }

            Image Image_yahoo = (Image)item.FindControl("Image_yahoo");
            Image Image_msn = (Image)item.FindControl("Image_msn");
            Image Image_icq = (Image)item.FindControl("Image_icq");
            Image Image_aim = (Image)item.FindControl("Image_aim");
            Image Image_skype = (Image)item.FindControl("Image_skype");

            Image_aim.Visible = (common.AIM != "") ? true : false;
            Image_yahoo.Visible = (common.YahooID != "") ? true : false;
            Image_msn.Visible = (common.MSN != "") ? true : false;
            Image_icq.Visible = (common.ICQ != "") ? true : false;
            Image_skype.Visible = (common.SkypeName != "") ? true : false;

            if (User.Identity.IsAuthenticated)
                if (User.Identity.Name.ToLower() == HyperLink_Username.Text.ToLower() || User.IsInRole("Admin"))
                {
                    ImageButton ImageButton_Edit = (ImageButton)item.FindControl("ImageButton_Edit");
                    ImageButton_Edit.Visible = true;
                    
                    ImageButton ImageButton_SendPM = (ImageButton)item.FindControl("ImageButton_SendPM");
                    ImageButton_SendPM.Visible = false;

                    ImageButton ImageButton_Delete = (ImageButton)item.FindControl("ImageButton_Delete");
                    ImageButton_Delete.Visible = true;

                    ImageButton ImageButton_Quote = (ImageButton)item.FindControl("ImageButton_Quote");
                    ImageButton_Quote.Visible = true;
                }
                else
                {
                    ImageButton ImageButton_SendPM = (ImageButton)item.FindControl("ImageButton_SendPM");
                    ImageButton_SendPM.Visible = true;

                    ImageButton ImageButton_Quote = (ImageButton)item.FindControl("ImageButton_Quote");
                    ImageButton_Quote.Visible = true;

                }
            
        }
    }

    protected void ImageButton_Quote_Click(object sender, ImageClickEventArgs e)
    {
        //Label_Messsage
        //<div style="border: 1px inset;">
        ImageButton m = (ImageButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        string quote = "نقل قول:";
        quote += "<br/><div style=\"border: 1px inset;\">";
        Label Label_Messsage = (Label)GridView_Topic.Rows[i].FindControl("Label_Messsage");
        quote += Label_Messsage.Text;
        quote += "</div><br/>";
        FCKeditor_Reply.Value = quote;
    }

    protected void ImageButton_Quote_Click1(object sender, ImageClickEventArgs e)
    {
        ImageButton m = (ImageButton)sender;
        int i = Int32.Parse(m.CommandArgument);
        string quote = "نقل قول:";
        quote += "<br/><div style=\"border: 1px inset;\">";
        Label Label_Messsage = (Label)GridView_ReplyList.Rows[i].FindControl("Label_Messsage");
        quote += Label_Messsage.Text;
        quote += "</div><br/>";
        FCKeditor_Reply.Value = quote;
    }

}

