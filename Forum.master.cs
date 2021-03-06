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

public partial class Forum : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //OnlineActiveUsers.OnlineUsers onlineUser = new OnlineActiveUsers.OnlineUsers();
        Label_ReplyCount.Text = SDKClass.Forums_AllWriteCount().ToString();
        Label_TopicCount.Text = SDKClass.Forums_AllTopicCount().ToString();
        Label_ArticleCount.Text = SDKClass.Articles_ArticleCount().ToString();
        Label_NewsCount.Text = SDKClass.News_NewsCount().ToString();
        Label_ViewCount.Text = SDKClass.SiteViewedCounter().ToString();
        Label_UserCount.Text = Membership.GetAllUsers().Count.ToString();
        HyperLink_LastUser.Text = SDKClass.Forums_LastUserRegister();
        HyperLink_LastUser.NavigateUrl = "~/ShowProfile.aspx?uid=" + HyperLink_LastUser.Text;

        int AllUserOnline = Int32.Parse(Session["OnlineUser"].ToString());//onlineUser.UsersCount;
        int RegistredUsersCount = Membership.GetNumberOfUsersOnline();
        int GuestUsersCount = AllUserOnline - RegistredUsersCount;
        Label_UserOnlineCount.Text = String.Format(" {0} (تعداد {1} عضو و {2} مهمان) ", AllUserOnline, RegistredUsersCount, GuestUsersCount);

        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            Session.Add("UserName", HttpContext.Current.User.Identity.Name);
            Div_Logined.Visible = true;
            MembershipUser temp = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            Label_LastLagin.Text = SDKClass.GetFarsiDate(temp.LastLoginDate, false);
            int NewMessage = SDKClass.Membership_NewMessageCountForUser(HttpContext.Current.User.Identity.Name);
            //Div_Logined.Attributes.CssStyle.Add(HtmlTextWriterStyle.BackgroundColor, "#FFFEE6");
            //background-color:#FFFEE6
            if (NewMessage == 0)
                HyperLink_NewMessage.ForeColor = System.Drawing.Color.Black;
            else
            {
                HyperLink_NewMessage.ForeColor = System.Drawing.Color.Blue;
                HyperLink_NewMessage.NavigateUrl = "~/Users/Inbox.aspx";
            }

            HyperLink_NewMessage.Text = String.Format("شما {0} پیغام خوانده نشده دارید", NewMessage);

        }
        else
        {
            Div_Logined.Visible = false;
            Session.Remove("UserName");
        }

        string user = SDKClass.Forums_AllOnlineUser();
        if (user != "")
        {
            string[] UserList = user.Split(';');
            for (int i = 0; i < UserList.Length; i++)
            {
                if (UserList[i].Length == 0) continue;
                Literal LabelTemp = new Literal();
                LabelTemp.Text = ",";
                HyperLink UserHyperLink = new HyperLink();
                UserHyperLink.Text = UserList[i];
                UserHyperLink.NavigateUrl = "~/ShowProfile.aspx?uid=" + UserList[i];
                Div_UserList.Controls.Add(UserHyperLink);
                Div_UserList.Controls.Add(LabelTemp);
            }
        }

        MenuItem item6 = Menu_User.Items[6];
        MenuItem item7 = Menu_User.Items[7];
        MenuItem item8 = Menu_User.Items[8];
        MenuItem item9 = Menu_User.Items[9];
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
        {
            Menu_User.Items.Remove(item6);
            Menu_User.Items.Remove(item7);
            Menu_User.Items.Remove(item8);
        }

        if (!HttpContext.Current.User.IsInRole("Admin"))
        {
            Menu_User.Items.Remove(item9);
        }
    }
}
