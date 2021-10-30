using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Security;
using System.Data.Sql;
using System.Data.SqlClient;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class SearchWebService : System.Web.Services.WebService
{
    public SearchWebService () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetSearchCompletaionUserList(string prefixText, int count)
    {
        if (count == 0) count = 10;
        string[] UserList = SDKClass.Membership_UserListByMatch(prefixText).Split(';');

        List<string> items = new List<string>(count);
        for (int i = 0; i < count; i++)
        {
            if (i > UserList.Length - 2) break;
            items.Add(UserList[i]);
        }

        return items.ToArray();
        
    }
}

