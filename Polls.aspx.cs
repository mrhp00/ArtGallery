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
using System.Data.Sql;
using System.Data.SqlClient;

public partial class Polls : System.Web.UI.Page
{
    #region Page Metode

    protected void Page_Load(object sender, EventArgs e)
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlCommand Command;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        string CommandText;
        SqlDataReader RecordSet;

        if (!Page.IsPostBack)
        {
            Pollcontrol1.CanVote = true;
            CommandText = "Polls_GetQuestion";
            Command = new SqlCommand(CommandText, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            Connection.Open();
            RecordSet = Command.ExecuteReader();
            int QuastionID = 0;

            if (RecordSet.HasRows)
            {
                RecordSet.Read();
                QuastionID = Int32.Parse(RecordSet["QuestionID"].ToString());
                Pollcontrol1.PollQuestion = RecordSet["QuestionText"].ToString();
                Connection.Close();
                RecordSet.Close();

                CommandText = "Polls_GetOptionList";
                Command = new SqlCommand(CommandText, Connection);
                Command.CommandType = CommandType.StoredProcedure;
                Command.Parameters.Add("QuestionID", SqlDbType.Int).Value=QuastionID;
                Connection.Open();
                RecordSet = Command.ExecuteReader();
                // Add Options To Poll Control :
                if (RecordSet.HasRows)
                {
                    while (RecordSet.Read())
                    {
                        int OptionID = Int32.Parse(RecordSet["OptionID"].ToString());
                        string OptionText = RecordSet["OptionText"].ToString();
                        int TotalVotes = Int32.Parse(RecordSet["TotalVotes"].ToString());
                        Pollcontrol1.AddPollAnswer(QuastionID, OptionID, OptionText, TotalVotes);
                    }
                    Connection.Close();
                    RecordSet.Close();
                }
                else
                {
                    Label_Message.Text = "تاکنون گزینه ای برای نظر سنجی ثبت نشده است";
                    Pollcontrol1.Visible = false;
                }
            }
            else
                Label_Message.Text = "تاکنون هیچ نظر سنجی در سایت ثبت نشده است";
            Connection.Close();
            RecordSet.Close();
        }

        TableCell tbl = (TableCell)Pollcontrol1.Controls[0].Controls[Pollcontrol1.Controls[0].Controls.Count-1].Controls[0];
        tbl.BorderWidth = 0;
        tbl.Attributes.Add("Style", "text-align:center");
        ImageButton ButtonPolls = (ImageButton)tbl.Controls[0] ;
        ButtonPolls.ValidationGroup = "3214";
        ButtonPolls.ImageUrl = "~/Images/PollImage/CastVote.jpg";
        //Label_Message.Text = 
    }

    protected void Pollcontrol1_CastVote(int PollId, string AnswerId, int MemberId)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Label_Message.Text = "برای شرکت در نظر سنجی باید عضو سایت باشید";
            return;
        }
        
        // Update PollOptions Without Check MemberID
        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        string CommandText;
        SqlCommand Command;
        SqlDataReader RecordSet;
        int QuastionID = 0;

        //Get Active Poll
        CommandText = "Polls_GetQuestion";
        Command = new SqlCommand(CommandText, Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Connection.Open();
        RecordSet = Command.ExecuteReader();


        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            QuastionID = Int32.Parse(RecordSet["QuestionID"].ToString());
            Label_Message.Text = QuastionID.ToString();
            Connection.Close();
            RecordSet.Close();
        }

        //Check User Vote
        CommandText = "Polls_UserIsVote";
        Command = new SqlCommand(CommandText, Connection);
        Command.CommandType = CommandType.StoredProcedure;

        Command.Parameters.Add("QuestionID", SqlDbType.Int).Value = QuastionID;
        Command.Parameters.Add("UserName", SqlDbType.NVarChar, 256).Value = User.Identity.Name;
        Connection.Open();

        RecordSet = Command.ExecuteReader();
        if (RecordSet.HasRows)
        {
            Label_Message.Text = "کاربر گرامی شما قبلا به این نظر سنجی رای داده اید";
            Connection.Close();
            RecordSet.Close();
            return;
        }
        else
        {
            RecordSet.Close();
            Connection.Close();
            CommandText = "Polls_InsertVote";
            Command = new SqlCommand(CommandText, Connection);
            Command.CommandType = CommandType.StoredProcedure;

            Command.Parameters.Add("QuestionID", SqlDbType.Int).Value = QuastionID;
            Command.Parameters.Add("OptionID", SqlDbType.Int).Value = Int32.Parse(AnswerId);
            Command.Parameters.Add("UserName", SqlDbType.NVarChar, 256).Value = User.Identity.Name;
            Connection.Open();

            Command.ExecuteNonQuery();
            Connection.Close();
            Response.Redirect("PollsResult.aspx?qid="+QuastionID.ToString());
        }
    }

    #endregion

}
