<%@ Application Language="C#" %>

<script runat="server">

    static int OnlineUser = 0; 
    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started
        OnlineUser++;
        Session.Add("OnlineUser", OnlineUser);
        //increament site viewcount
        UpdateCounter();
        Session.Add("NewsID", 0);
        Session.Add("ArticleID", 0);
    }

    void Session_End(object sender, EventArgs e) 
    {
        OnlineUser--;
        //Session["OnlineUser"] = OnlineUser.ToString();
    }

    public void UpdateCounter()
    {
        string ConnectionString = SafaConnectionString.ConnectionString;
        System.Data.SqlClient.SqlConnection Connection = new System.Data.SqlClient.SqlConnection(ConnectionString);
        string CommandText = "Counter_UpdateSiteViewed";
        System.Data.SqlClient.SqlCommand Command = new System.Data.SqlClient.SqlCommand(CommandText, Connection);
        Command.CommandType = System.Data.CommandType.StoredProcedure;
        
        Connection.Open();
        Command.ExecuteNonQuery();
    }  
       
</script>
