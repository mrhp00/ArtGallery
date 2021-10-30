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

public partial class ShowProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["uid"].ToString() != "")
        {
            string username = Request.QueryString["uid"].ToString();
            ProfileCommon common = Profile.GetProfile(username);
            Label_Signature.Text = common.Signature;
            Label_AIM.Text = common.AIM;
            Label_BirthYear.Text = common.BirthYear;
            Label_HotmailID.Text = common.HotmailID;
            Label_ICQ.Text = common.ICQ;
            Label_Location.Text = common.Sokonat;
            Label_MSN.Text = common.MSN;
            Label_PostCount.Text = SDKClass.Forums_PostCountForUser(username).ToString();
            Label_SkypeName.Text = common.SkypeName;
            Label_Username.Text = username;
            Label_YahooID.Text = common.YahooID;
            MembershipUser user = Membership.GetUser(username);
            Label_DateRegister.Text = SDKClass.GetFarsiDate(user.CreationDate, false);
            Label_LastLoginDate.Text = SDKClass.GetFarsiDate(user.LastLoginDate, false);
        }
    }
}
