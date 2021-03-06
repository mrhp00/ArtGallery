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
using System.Security.Cryptography;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using farhaniPersianDate;

public class SDKClass
{
    #region SDK Metodes
    
    /// <summary>
    /// متدی برای تبدیل تاریخ میلادی به شمسی با ورودی تاریخ وخروجی رشته 
    /// </summary>
    public static string GetFarsiDate(DateTime date, Boolean shortdate)
    {
        if (shortdate == true)
        {
            cDate Farsi = new cDate();
            Farsi.displyFormat = "YY;/;mm;/;dd";
            return Farsi.fulDate(Farsi.getPersianDate(date));
        }
        else
        {
            cDate Farsi = new cDate();
            Farsi.displyFormat = "dn;dd;MM;سال;yy";
            return Farsi.getPersianDate(date);
        }
    }
    /// <summary>
    /// متدی برای تبدیل تاریخ میلادی به شمسی با ورودی آبجکت وخروجی رشته 
    /// </summary>
    public static string GetFarsiDate(object _date, Boolean shortdate)
    {
        DateTime date = DateTime.Parse(_date.ToString());
        if (shortdate == true)
        {
            cDate Farsi = new cDate();
            Farsi.displyFormat = "YY;/;mm;/;dd";
            return Farsi.fulDate(Farsi.getPersianDate(date));
        }
        else
        {
            cDate Farsi = new cDate();
            Farsi.displyFormat = "dn;dd;MM;سال;yy";
            return Farsi.getPersianDate(date);
        }
    }
    /// <summary>
    /// محاسبه تعداد بازدید ها از سایت تاکنون
    /// </summary>
    public static int SiteViewedCounter()
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        string CommandText = "Counter_SiteViewed";
        SqlCommand Command = new SqlCommand(CommandText, Connection);
        Command.CommandType = CommandType.StoredProcedure;

        //tedad bazdid hay site ta hala
        Connection.Open();
        int result= (int)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// بررسی پسوند فایلهای در حال آپلود برای مجاز بودن آنها
    /// </summary>
    public static bool IsValidFileType(string FileName)
    {
        string[] AcceptedFileTypes = new string[] { "jpg", "gif", "jpeg" };
        string ext = FileName.Substring(FileName.LastIndexOf(".") + 1, FileName.Length - FileName.LastIndexOf(".") - 1);
        for (int i = 0; i < AcceptedFileTypes.Length; i++)
        {

            if (ext == AcceptedFileTypes[i])
            {
                return true;
            }
        }
        return false;
    }

    #endregion

    #region Forum Metodes
    /// <summary>
    /// نمایش جدیدترین ده تاپیک جدید وارد شده به سایت
    /// </summary>
    public static string Forums_NewTopics()
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        string CommandText = "Forums_GetNewsTopics";
        SqlCommand Command = new SqlCommand(CommandText, Connection);
        Command.CommandType = CommandType.StoredProcedure;
        SqlDataReader RecordSet;
        string Marquee = "", Subject, TID;

        Connection.Open();
        RecordSet = Command.ExecuteReader();

        Marquee = "<marquee  onmouseover=\"this.stop()\" onmouseout=\"this.start()\" direction=\"up\" scrolldelay=\"1\" scrollamount=\"1\" style=\"Width:99%;background-color:#FFFEE6;Height:100%; padding-right: 1%;\">";
        if (RecordSet.HasRows == true)
        {
            while (RecordSet.Read())
            {
                Subject = RecordSet["Subject"].ToString();
                TID = RecordSet["TopicID"].ToString();
                Marquee += String.Format("<a href=\"ShowThread.aspx?tid={0}\" >{1}</a><br/>", TID, Subject);
            }
        }
        else
            Marquee += "&nbsp;<p> تاکنون تاپیک جدیدی در سایت ثبت نشده است </p>";
        Marquee += "</marquee>";
        Connection.Close();
        RecordSet.Close();
        return Marquee;
    }
    /// <summary>
    /// برگرداندن لیست انجمن های یک تالار
    /// </summary>
    public static SqlDataReader Forums_ForumListByForumID(int id)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_ForumsList", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("CategoryID", id);
        Connection.Open();
        return Command.ExecuteReader();
    }
    /// <summary>
    /// محاسبه تعداد تاپیک های یک انجمن
    /// </summary>
    public static int Forums_ForumTopicsCount(int ForumID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_ForumsTopicsCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("ForumID", ForumID);
        Connection.Open();
        int result= (int)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// برگرداندن نام یک انجمن باورودی کد انجمن
    /// </summary>
    public static string Forums_ForumName(int ForumID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_ForumName", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("ForumID", ForumID);
        Connection.Open();
        string result= (string)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// برگرداندن تعداد نوشته های یک انجمن
    /// </summary>
    public static int Forums_ForumWritesCount(int ForumID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_ForumsWritesCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("ForumID", ForumID);
        Connection.Open();
        int ReplyCount =  (int)Command.ExecuteScalar();
        Connection.Close();

        Command = new SqlCommand("Forums_ForumsTopicsCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("ForumID", ForumID);
        Connection.Open();
        int TopicsCount = (int)Command.ExecuteScalar();
        Connection.Close();
        return (TopicsCount+ReplyCount);
    }
    /// <summary>
    /// برگرداندن آخرین نوشته یک انجمن
    /// </summary>
    public static string Forums_ForumsLastWrites(int ForumID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_ForumsLastWrite", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("ForumID", ForumID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string Username = RecordSet["UserID"].ToString();
            string TopicName = RecordSet["Subject"].ToString();
            DateTime date = DateTime.Parse(RecordSet["AddedDate"].ToString());
            int TopicID = Int32.Parse(RecordSet["TopicID"].ToString());
            Connection.Close();
            RecordSet.Close();
            return (TopicName + ";" + TopicID.ToString() + ";" + date.ToString() + ";" + Username);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        } 
    }
    /// <summary>
    /// برگرداندن آخرین پاسخ برای یک انجمن
    /// </summary>
    public static string Forums_TopicsLastReply(int TopicID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_TopicsLastWrite", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("TopicID", TopicID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string Username = RecordSet["UserID"].ToString();
            DateTime date = DateTime.Parse(RecordSet["AddedDate"].ToString());
            Connection.Close();
            RecordSet.Close();
            return (date.ToString() + ";" + Username);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        }
    }
    /// <summary>
    /// برگرداندن تعداد پاسخهای داده شده به یک تاپیک
    /// </summary>
    public static int Forums_TopicsReplyCount(int TopicID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_TopicsReplyCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("TopicID", TopicID);
        Connection.Open();
        int result= (int)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// برگرداندن تعداد پست ها+تاپیک های داده شده توسط یک کاربر
    /// </summary>
    public static int Forums_PostCountForUser(string UserID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_PostCountForUser", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("UserID", UserID);
        Connection.Open();
        int PostCount = (int)Command.ExecuteScalar();

        Connection.Close();
        Command = new SqlCommand("Forums_TopicCountForUser", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("UserID", UserID);
        Connection.Open();
        int TopicCount = (int)Command.ExecuteScalar();
        
        Connection.Close();
        return TopicCount + PostCount;
    }
    /// <summary>
    /// برگرداندن تمام نوشته های یک انجمن
    /// </summary>
    public static int Forums_AllWriteCount()
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_AllReplyCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Connection.Open();
        int PostCount = (int)Command.ExecuteScalar();

        Connection.Close();
        Command = new SqlCommand("Forums_AllTopicsCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Connection.Open();
        int TopicCount = (int)Command.ExecuteScalar();
        Connection.Close();
        return TopicCount + PostCount;
    }
    /// <summary>
    /// برگرداندن تعداد کل تاپیک هاییک انجمن
    /// </summary>
    public static int Forums_AllTopicCount()
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_AllTopicsCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Connection.Open();
        int result= (int)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// برگرداندن نام آخرین کاربر ثبت نام شده در سایت
    /// </summary>
    public static string Forums_LastUserRegister()
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_LastUserRegister", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Connection.Open();
        string result= (string)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// برگرداندن لیست کاربران آنلاین سایت در حال حاضر
    /// </summary>
    public static string Forums_AllOnlineUser()
    {
        string UserList = "";
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_GetAllUsers", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Connection.Open();

        SqlDataReader RecordSet = Command.ExecuteReader();

        if (RecordSet.HasRows)
        {
            while (RecordSet.Read())
            {
                string username = RecordSet.GetString(0);
                MembershipUser user = Membership.GetUser(username);
                if (user.IsOnline == true)
                    UserList += username + ";";
            }

        }
        Connection.Close();
        RecordSet.Close();
        return UserList;
    }
    /// <summary>
    /// برگرداندن جزئیات یک تالار با ورودی کد تالار
    /// </summary>
    public static string Forums_CategoryDetails(int CategoryID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_CategoriesDetails", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("CategoryID", CategoryID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string CategoryName = RecordSet["CategoryName"].ToString();
            string CategoryPosition = RecordSet["CategoryPosition"].ToString();
            Connection.Close();
            RecordSet.Close();
            return (CategoryName + ";" + CategoryPosition);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        }
    }
    /// <summary>
    /// برگرداندن جزئیات یک انجمن باورودی کد انجمن
    /// </summary>
    public static string Forums_ForumDetails(int ForumID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_GetForumByID", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("ForumID", ForumID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string ForumName = RecordSet["ForumName"].ToString();
            string ForumPosition = RecordSet["ForumPosition"].ToString();
            string CategoryID = RecordSet["CategoryID"].ToString();
            string ForumDescription = RecordSet["ForumDescription"].ToString();
            Connection.Close();
            RecordSet.Close();
            return (CategoryID + ";" + ForumName + ";" + ForumDescription + ";" + ForumPosition);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        }
    }

    #endregion

    #region Articles Metodes
    /// <summary>
    /// برگرداندن تعدادمقالات یک گروه
    /// </summary>
    public static int Articles_CategoryCount(int CategoryID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Articles_GetArticleCountByCategory", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("CategoryID", CategoryID);
        Connection.Open();
        int result= (int)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// برگرداندن تعداد مقالات کل مقالات
    /// </summary>
    public static int Articles_ArticleCount()
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Articles_ArticleCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Connection.Open();
        int result= (int)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// برگرداندن جزئیات یک گروه مقاله باورودی کدگروه مقاله
    /// </summary>
    public static string Articles_CategoryDetails(int CategoryID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Articles_GetCategoriesByID", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("CategoryID", CategoryID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string Title = RecordSet["Title"].ToString();
            string Description = RecordSet["Description"].ToString();
            string ImageUrl = RecordSet["ImageUrl"].ToString();
            string AddedBy = RecordSet["AddedBy"].ToString();
            string AddedDate = RecordSet["AddedDate"].ToString();
            Connection.Close();
            RecordSet.Close();
            return (Title + ";" + Description + ";" + ImageUrl + ";" + AddedBy + ";" + AddedDate);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        }
    }
    /// <summary>
    /// برگرداندن جزئیات یک مقاله با ورودی کد مقاله
    /// </summary>
    public static string Articles_ArticleDetails(int ArticleID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Articles_GetArticleByID", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("ArticleID", ArticleID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string AddedDate = RecordSet["AddedDate"].ToString();
            string AddedBy = RecordSet["AddedBy"].ToString();
            string CategoryID = RecordSet["CategoryID"].ToString();
            string Title = RecordSet["Title"].ToString();
            string Abstract = RecordSet["Abstract"].ToString();
            string Body = RecordSet["Body"].ToString();
            string CommentsEnabled = RecordSet["CommentsEnabled"].ToString();
            string OnlyForMembers = RecordSet["OnlyForMembers"].ToString();
            Connection.Close();
            RecordSet.Close();
            return (AddedDate + "|" + AddedBy + "|" + CategoryID + "|" + Title + "|" + Abstract + "|" + Body + "|" + CommentsEnabled + "|" + OnlyForMembers);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        }
    }
    /// <summary>
    /// بررسی اینکه آیا کاربر ای پی مورد نظر به مقاله مورد نظر،نظر داده است یا خیر 
    /// </summary>
    public static bool Articles_IsIPHasCommentsForArticle(int ArticleID, string IP)
    {
        bool result = false;
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Articles_IsIPHasCommentsForArticle", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("ArticleID", ArticleID);
        Command.Parameters.AddWithValue("IP", IP);
        Connection.Open();
        SqlDataReader Recordset = Command.ExecuteReader();
        if (Recordset.HasRows)
            result = true;
        Connection.Close();
        Recordset.Close();
        return result;
    }

    #endregion

    #region News Metodes
    /// <summary>
    /// برگرداندن جزئیات یک خبر با ورودی کد خبر
    /// </summary>
    public static string News_NewsDetails(int NewsID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("News_GetNewsByID", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("NewsID", NewsID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string Title = RecordSet["Title"].ToString();
            string Abstruct = RecordSet["Abstruct"].ToString();
            string Body = RecordSet["Body"].ToString();
            string NewsImage = RecordSet["NewsImage"].ToString();
            string CommentsEnabled = RecordSet["CommentsEnabled"].ToString();
            string AddedDate = RecordSet["AddedDate"].ToString();
            Connection.Close();
            RecordSet.Close();
            return (Title + "|" + Abstruct + "|" + Body + "|" + NewsImage + "|" + CommentsEnabled + "|" + AddedDate);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        }
    }
    /// <summary>
    /// برگرداندن تعدادکل اخبار در سایت
    /// </summary>
    public static int News_NewsCount()
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("News_NewsCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Connection.Open();
        int result= (int)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// بررسی اینکه ای پی موردنظر به خبر مورد نظر،نظرداده است یا خیر
    /// </summary>
    public static bool News_IsIPHasCommentsForNews(int NewsID, string IP)
    {
        bool result = false;
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("News_IsIPHasCommentsForNews", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("NewsID", NewsID);
        Command.Parameters.AddWithValue("IP", IP);
        Connection.Open();
        SqlDataReader Recordset = Command.ExecuteReader();
        if (Recordset.HasRows)
            result = true;
        Connection.Close();
        Recordset.Close();
        return result;
    }

    #endregion

    #region Polls Metodes
    /// <summary>
    /// برگرداندن جزئیات یک سوال نظر سنجی با ورودی کد سوال
    /// </summary>
    public static string Polls_QuastionsDetails(int QuestionID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Polls_GetQuestionDetails", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("QuestionID", QuestionID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string QuestionText = RecordSet["QuestionText"].ToString();
            string IsCurrentQuestion = RecordSet["IsCurrentQuestion"].ToString();
            string Archived = RecordSet["Archived"].ToString();
            string AddedDate = RecordSet["AddedDate"].ToString();
            Connection.Close();
            RecordSet.Close();
            return (AddedDate + ";" + QuestionText + ";" + IsCurrentQuestion + ";" + Archived);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        }
    }
    /// <summary>
    /// برگرداندن جزئیات یک گزینه نظر سنجی با ورودی کد گزینه
    /// </summary>
    public static string Polls_OptionsPollDetails(int OptionID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Polls_GetOptionDetails", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("OptionID", OptionID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string OptionText = RecordSet["OptionText"].ToString();
            string QuestionID = RecordSet["QuestionID"].ToString();
            Connection.Close();
            RecordSet.Close();
            return (OptionText + ";" + QuestionID);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        }
    }

    #endregion

    #region Membership Metodes
    /// <summary>
    /// برگرداندن تعداد پیغام های جدید رسیده برای کاربر
    /// </summary>
    public static int Membership_NewMessageCountForUser(string UserName)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_PMMessageNewMessageCount", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("UserName", UserName);
        Connection.Open();
        int result= (int)Command.ExecuteScalar();
        Connection.Close();
        return result;
    }
    /// <summary>
    /// برگرداندن نوع یک کاربر با ورودی نام کاربر
    /// </summary>
    public static string Membership_TypeUser(string UserName)
    {
        MembershipUser userInfo = Membership.GetUser(UserName);
        if (!userInfo.IsApproved)
        {
            return "کاربر محروم شده";
        }
        if (Roles.IsUserInRole(UserName, "Admin"))
            return "مدیریت سایت";
        else if (Roles.IsUserInRole(UserName, "Users"))
            return "کاربر عادی";
        return "کاربر جدید";
    }
    /// <summary>
    /// برگرداندن لیستی از نام کاربران، که با پارامتر ورودی در اول نام کاربری آنها وجود دارد
    /// </summary>
    public static string Membership_UserListByMatch(string MatchText)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_UserList", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("Letter", MatchText);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        string result = "";
        if (RecordSet.HasRows)
        {
            while (RecordSet.Read())
            {
                string LoweredUserName = RecordSet["LoweredUserName"].ToString();
                result += LoweredUserName + ";";
            }
        }
        Connection.Close();
        RecordSet.Close();
        return result;
    }
    /// <summary>
    /// حذف کردن تمامی اطلاعات یک کاربر اعم از تاپیک ها پستهاو پیغامهاو...با ورودی نام کاربری
    /// </summary>
    public static void Membership_DeleteUserInformation(string UserName)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Forums_DeleteUserInformation", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("UserName", UserName);
        Connection.Open();
        Command.ExecuteNonQuery();
        Connection.Close();
    }

    #endregion

    #region Links Metodes
    /// <summary>
    /// برگرداندن لیست لینکهای تایید شده 
    /// </summary>
    public static string Links_LinksList()
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        string CommandText = "Link_AcceptLinkList";
        SqlCommand Command = new SqlCommand(CommandText, Connection);
        Command.CommandType = CommandType.StoredProcedure;
        SqlDataReader RecordSet;
        string Marquee = "", Name, Address;

        Connection.Open();
        RecordSet = Command.ExecuteReader();

        Marquee = "<marquee  onmouseover=\"this.stop()\" onmouseout=\"this.start()\" direction=\"up\" scrolldelay=\"1\" scrollamount=\"1\" style=\"Width:100%;Height:100%;padding:3px\">";
        if (RecordSet.HasRows == true)
        {
            while (RecordSet.Read())
            {
                Address = RecordSet["Address"].ToString();
                Name = RecordSet["Name"].ToString();
                Marquee += String.Format("<p align=\"center\"><a href=\"{0}\" target=\"_blank\"  >{1}</a></p>", Address, Name);
            }
        }
        else
            Marquee += "<p align=\"center\" > تاکنون لینکی در سایت ثبت نشده است </p>";
        Marquee += "</marquee>";
        Connection.Close();
        RecordSet.Close();
        return Marquee;
    }
    /// <summary>
    /// برگرداندن جزئیات یک لینک با ورودی کد لینک
    /// </summary>
    public static string Links_LinkDetails(int LinkID)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        SqlCommand Command = new SqlCommand("Link_LinkDetails", Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.AddWithValue("LinkID", LinkID);
        Connection.Open();
        SqlDataReader RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            string Name = RecordSet["Name"].ToString();
            string Address = RecordSet["Address"].ToString();
            string AcceptLink = RecordSet["AcceptLink"].ToString();
            Connection.Close();
            RecordSet.Close();
            return (Name + ";" + Address + ";" + AcceptLink);
        }
        else
        {
            Connection.Close();
            RecordSet.Close();
            return "";
        }
    }

    #endregion
}
