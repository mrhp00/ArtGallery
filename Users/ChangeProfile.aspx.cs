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

public partial class Users_ChangeProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (User.Identity.IsAuthenticated)
            {
                ShowProfile();
            }
            else
               Button_Save.Enabled = false;
        }

    }

    public void ShowProfile()
    {
        Label_UserName.Text = User.Identity.Name;
        Button_Save.Enabled = true;
        TextBox_AIM.Text = Profile.AIM;
        TextBox_BirthYear.Text = Profile.BirthYear;
        TextBox_HotmailID.Text = Profile.HotmailID;
        TextBox_ICQ.Text = Profile.ICQ;
        FCKEditor_Signature.Value= Profile.Signature;
        TextBox_SkypeName.Text = Profile.SkypeName;
        TextBox_Website.Text = Profile.Website;
        TextBox_YahooID.Text = Profile.YahooID;
        TextBox_Sokonat.Text = Profile.Sokonat;
        TextBox_MSN.Text = Profile.MSN;
        MembershipUser UserInformation = Membership.GetUser(User.Identity.Name);
        TextBox_Email.Text = UserInformation.Email;
        Label_Qustion.Text = UserInformation.PasswordQuestion;
    }

    protected void Button_Save_Click(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            Button_Save.Enabled = true;
            Profile.AIM=TextBox_AIM.Text;
            Profile.BirthYear = TextBox_BirthYear.Text;
            Profile.HotmailID = TextBox_HotmailID.Text;
            Profile.ICQ = TextBox_ICQ.Text;
            Profile.Signature = FCKEditor_Signature.Value;
            Profile.SkypeName = TextBox_SkypeName.Text;
            Profile.Website = TextBox_Website.Text;
            Profile.YahooID = TextBox_YahooID.Text;
            Profile.Sokonat = TextBox_Sokonat.Text;
            Profile.MSN = TextBox_MSN.Text;
            Profile.Save();
            MembershipUser UserInformation = Membership.GetUser(User.Identity.Name);
            UserInformation.Email = TextBox_Email.Text;
            Membership.UpdateUser(UserInformation);
            ShowProfile();
        }
        else
          Button_Save.Enabled = false;
    }

}
