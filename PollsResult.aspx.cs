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

public partial class PollsResult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int QuastionID;
        if (Request.QueryString["qid"].ToString() != "")
            QuastionID = Int32.Parse(Request.QueryString["qid"].ToString());
        else
            QuastionID = -1;

        string ConnectionString = SafaConnectionString.ConnectionString;
        SqlCommand Command;
        SqlConnection Connection = new SqlConnection(ConnectionString);
        string CommandText;
        SqlDataReader RecordSet;

        Pollcontrol1.CanVote = false;
        CommandText = "Polls_GetQuestionDetails";
        Command = new SqlCommand(CommandText, Connection);
        Command.CommandType = CommandType.StoredProcedure;
        Command.Parameters.Add("QuestionID", SqlDbType.Int).Value = QuastionID;
        Connection.Open();
        RecordSet = Command.ExecuteReader();

        if (RecordSet.HasRows)
        {
            RecordSet.Read();
            Pollcontrol1.PollQuestion = RecordSet["QuestionText"].ToString();
            Connection.Close();
            RecordSet.Close();

            CommandText = "Polls_GetOptionList";
            Command = new SqlCommand(CommandText, Connection);
            Command.CommandType = CommandType.StoredProcedure;
            Command.Parameters.Add("QuestionID", SqlDbType.Int).Value = QuastionID;
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
        }
    }
}

