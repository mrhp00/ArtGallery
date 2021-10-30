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
using System.Data.SqlClient;
using System.Data.Sql;

public partial class EditPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string ConnectionString = SafaConnectionString.ConnectionString;
            SqlConnection Connection = new SqlConnection(ConnectionString);
            string CommandText = "";
            SqlCommand Command;
            SqlDataReader RecordSet;

            if (Session["TopicID"].ToString() != "0" && User.Identity.IsAuthenticated)
            {
                string TopicID = Session["TopicID"].ToString();
                CommandText = "Forums_TopicsDetails";
                Command = new SqlCommand(CommandText, Connection);
                Command.CommandType = CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("TopicID", TopicID);
                Connection.Open();
                RecordSet = Command.ExecuteReader();
                if (RecordSet.HasRows)
                {
                    RecordSet.Read();
                    string Username = RecordSet["UserID"].ToString();
                    string Message = RecordSet["Message"].ToString();
                    if (User.Identity.Name.ToLower() == Username.ToLower() || User.IsInRole("Admin"))
                        FCKeditor_EditPost.Value = Message;
                }
                Connection.Close();
                RecordSet.Close();
            }
            else
                if (Session["ReplyID"].ToString() != "0" && User.Identity.IsAuthenticated)
                {
                    string ReplyID = Session["ReplyID"].ToString();
                    CommandText = "Forums_ReplayDetails";
                    Command = new SqlCommand(CommandText, Connection);
                    Command.CommandType = CommandType.StoredProcedure;
                    Command.Parameters.AddWithValue("ReplyID", ReplyID);
                    Connection.Open();
                    RecordSet = Command.ExecuteReader();
                    if (RecordSet.HasRows)
                    {
                        RecordSet.Read();
                        string Username = RecordSet["UserID"].ToString();
                        string Message = RecordSet["Message"].ToString();
                        if (User.Identity.Name.ToLower() == Username.ToLower() || User.IsInRole("Admin"))
                            FCKeditor_EditPost.Value = Message;
                    }
                    Connection.Close();
                    RecordSet.Close();
                }
        }
    }

    protected void ImageButton_Edit_Click(object sender, ImageClickEventArgs e)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        string CommandText = "";
        SqlCommand Command;

        if (Session["TopicID"].ToString() != "0" && User.Identity.IsAuthenticated)
        {
            string TopicID = Session["TopicID"].ToString();
            CommandText = "Forums_UpdateTopics";
            Command = new SqlCommand(CommandText, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            Command.Parameters.AddWithValue("@TopicID", TopicID);
            Command.Parameters.AddWithValue("@Message", FCKeditor_EditPost.Value);
            Connection.Open();
            Command.ExecuteNonQuery();
            Connection.Close();
        }
        else
            if (Session["ReplyID"].ToString() != "0" && User.Identity.IsAuthenticated)
            {
                string ReplyID = Session["ReplyID"].ToString();
                CommandText = "Forums_UpdatePost";
                Command = new SqlCommand(CommandText, Connection);
                Command.CommandType = CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("@ReplyID", ReplyID);
                Command.Parameters.AddWithValue("@Message", FCKeditor_EditPost.Value);
                Connection.Open();
                Command.ExecuteNonQuery();
                Connection.Close();
            }
        Response.Redirect("~/ShowThread.aspx?tid="+Session["tid"].ToString());
    }
}
