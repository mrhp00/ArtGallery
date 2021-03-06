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

public partial class site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
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
        Label_AllViewCount.Text = SDKClass.SiteViewedCounter().ToString();
        Label_OnlineCount.Text = Session["OnlineUser"].ToString();
        Label_Date.Text = SDKClass.GetFarsiDate(DateTime.Now, false);
    }
    
    protected void Menu_Main_MenuItemDataBound(object sender, MenuEventArgs e)
    {
        string text = e.Item.Text;
        if (!HttpContext.Current.User.Identity.IsAuthenticated)
            if (text == "تنظیمات کاربری")
                e.Item.Parent.ChildItems.Remove(e.Item);

        if (!HttpContext.Current.User.IsInRole("Admin"))
        {
            if (text == "مدیریت سایت")
                e.Item.Parent.ChildItems.Remove(e.Item);
        }
    }
}
