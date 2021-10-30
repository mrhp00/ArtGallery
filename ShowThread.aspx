<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="ShowThread.aspx.cs" Inherits="ShowThread" Title="Untitled Page" ValidateRequest="false" EnableSessionState="True"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:ScriptManagerProxy id="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <asp:SqlDataSource ID="SqlDataSource_ShowThread" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
        SelectCommand="Forums_TopicsDetails" SelectCommandType="StoredProcedure" UpdateCommand="Forums_TopicsIncreamentView"
        UpdateCommandType="StoredProcedure" DeleteCommand="Forums_DeleteTopics" DeleteCommandType="StoredProcedure">
        <UpdateParameters>
            <asp:QueryStringParameter Name="TopicID" QueryStringField="tid" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="TopicID" QueryStringField="tid" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="TopicID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <table style="width: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
    <asp:GridView ID="GridView_Topic" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_ShowThread"
        GridLines="None" ShowHeader="False"
        Width="100%" OnDataBound="GridView_Topic_DataBound">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                <table style="border: #0b198c 1px solid; padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px;" border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tr style="background-color:#5C7099; height: 25px;">
                        <td style="width: 20%; border-left: #d1d1e1 2px solid; color: #ffffff; text-align: center;">
                            <asp:Label ID="Label_Date" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate"),false) %>'></asp:Label></td>
                        <td style="color: #ffffff">
                            <asp:Label ID="Label_UserIP" runat="server" Style="float: left" Text='<%# Eval("UserIP", "{0}") %>'></asp:Label></td>
                    </tr>
                    <tr>
                        <td rowspan="4" style="vertical-align: top; border-left: #d1d1e1 2px solid;" class="Col2">
                            <asp:HyperLink ID="HyperLink_Username" runat="server" NavigateUrl='<%# Eval("UserID", "~/ShowProfile.aspx?uid={0}") %>'
                                Style="font-weight: bold" Text='<%# Eval("UserID") %>'></asp:HyperLink><br />
                            <asp:Label ID="Label_TypeUser" runat="server" Font-Size="10px"></asp:Label><br />
                            <asp:Label ID="Label_RegisterDatelbl" runat="server" Text="تاریخ عضویت:"></asp:Label>
                            <asp:Label ID="Label_RegisterDate" runat="server" CssClass="Date" Font-Size="10px"
                                Style="direction: rtl"></asp:Label><br />
                            <asp:Label ID="Label_Loc" runat="server" Text="محل سکونت:"></asp:Label>
                            <asp:Label ID="Label_Location" runat="server" Font-Size="10px"></asp:Label><br />
                            <asp:Label ID="Label3" runat="server" Text="نوشته ها:"></asp:Label>
                            <asp:Label ID="Label_WriteCount" runat="server" Font-Size="10px"></asp:Label><br /></td>
                        <td style="vertical-align: top;" rowspan="4" class="Col1">
                                <asp:Label ID="Label_Subject" runat="server" Style="font-weight: bold; color: #3366cc"
                                    Text='<%# Eval("Subject") %>'></asp:Label>
                                <hr style="COLOR: #d1d1e1" size="1"/>
                            <asp:Label ID="Label_Messsage" runat="server" Text='<%# Eval("Message") %>' Width="100%"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                    </tr>
                    <tr>
                        <td class="Col2" rowspan="1" style="vertical-align: bottom; border-left: #d1d1e1 2px solid">
                            <asp:Image ID="Image_yahoo" runat="server" ImageUrl="~/Images/im_yahoo.gif" Visible="False" ToolTip="آیدی یاهو مسنجر دارد" /><asp:Image ID="Image_msn" runat="server" ImageUrl="~/Images/im_msn.gif" Visible="False" ToolTip="آی دی MSN دارد" /><asp:Image ID="Image_icq" runat="server" ImageUrl="~/Images/im_icq.gif" Visible="False" ToolTip="آیدی ICQ دارد" /><asp:Image ID="Image_aim" runat="server" ImageUrl="~/Images/im_aim.gif" Visible="False" ToolTip="آیدی AIM دارد" /><asp:Image ID="Image_skype" runat="server" ImageUrl="~/Images/im_skype.gif" Visible="False" ToolTip="آیدی Skype دارد" /></td>
                        <td class="Col1" rowspan="1" style="vertical-align: top">
                            &nbsp;
                            <hr style="COLOR: #d1d1e1" size="1"/>
                            <asp:Label ID="Label_Signature" runat="server"></asp:Label>&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="1" style="border-left: #d1d1e1 2px solid; padding-right: 5px;" class="Col2">
                            <asp:Image ID="Image_Online" runat="server" ImageUrl="~/Images/user_offline.gif" />
                                <asp:Label ID="Label_TopicID" runat="server" Text='<%# Eval("TopicID") %>' Visible="False"></asp:Label>&nbsp;
                                <asp:Label ID="Label_ForumID" runat="server" Text='<%# Eval("ForumID") %>' Visible="False"></asp:Label></td>
                        <td rowspan="1" class="Col1">
                            <asp:ImageButton ID="ImageButton_Edit" runat="server" ImageUrl="~/Images/edit.gif"
                                    OnClick="ImageButton_Edit_Click" Style="float: left" ValidationGroup="110" Visible="False" CommandArgument="<%# Container.DataItemIndex %>" />
                            <asp:ImageButton ID="ImageButton_Delete" runat="server" ImageUrl="~/Images/Delete.gif" Style="float: left" ValidationGroup="110" Visible="False" />
                            <asp:ImageButton
                                                        ID="ImageButton_SendPM" runat="server" CommandArgument="<%# Container.DataItemIndex %>"
                                                        OnClick="ImageButton_SendPM_Click" Style="float: left" Visible="False" ImageUrl="~/Images/PM.gif" ValidationGroup="1" />
                            <asp:ImageButton
                                                        ID="ImageButton_Quote" runat="server" CommandArgument="<%# Container.DataItemIndex %>"
                                                        OnClick="ImageButton_Quote_Click" Style="float: left" Visible="False" ImageUrl="~/Images/quote.gif" ValidationGroup="1" /></td>
                    </tr>
                </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView_ReplyList" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ReplyID" DataSourceID="SqlDataSource_ShowReply" GridLines="None" ShowHeader="False" Width="100%" AllowPaging="True" PageSize="15" OnDataBound="GridView_Topic_DataBound">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate><table style="border: #0b198c 1px solid; padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px;" border="0" width="100%" cellpadding="0" cellspacing="0">
                                <tr style="background-color:#5C7099; height: 25px;">
                                    <td style="width: 20%; border-left: #d1d1e1 2px solid; color: #ffffff; text-align: center;">
                                        <asp:Label ID="Label_Date" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate"),false) %>'></asp:Label></td>
                                    <td style="color: #ffffff">
                                        <asp:Label ID="Label_UserIP" runat="server" Style="float: left" Text='<%# Eval("UserIP", "{0}") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td rowspan="4" style="vertical-align: top; border-left: #d1d1e1 2px solid;" class="Col2">
                                        <asp:HyperLink ID="HyperLink_Username" runat="server" NavigateUrl='<%# Eval("UserID", "~/ShowProfile.aspx?uid={0}") %>'
                                            Style="font-weight: bold" Text='<%# Eval("UserID") %>'></asp:HyperLink><br />
                                        <asp:Label ID="Label_TypeUser" runat="server" Font-Size="10px"></asp:Label><br />
                                        <asp:Label ID="Label_RegisterDatelbl" runat="server" Text="تاریخ عضویت:"></asp:Label>
                                        <asp:Label ID="Label_RegisterDate" runat="server" CssClass="Date" Font-Size="10px"
                                            Style="direction: rtl"></asp:Label><br />
                                        <asp:Label ID="Label_Loc" runat="server" Text="محل سکونت:"></asp:Label>
                                        <asp:Label ID="Label_Location" runat="server" Font-Size="10px"></asp:Label><br />
                                        <asp:Label ID="Label3" runat="server" Text="نوشته ها:"></asp:Label>
                                        <asp:Label ID="Label_WriteCount" runat="server" Font-Size="10px"></asp:Label><br />
                                    </td>
                                    <td style="vertical-align: top;" rowspan="4" class="Col1">
                                        <hr style="COLOR: #d1d1e1; display: none;" size="1"/>
                                        <asp:Label ID="Label_Messsage" runat="server" Text='<%# Eval("Message") %>' Width="100%"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                </tr>
                                <tr>
                                    <td class="Col2" rowspan="1" style="vertical-align: bottom; border-left: #d1d1e1 2px solid">
                                        <asp:Image ID="Image_yahoo" runat="server" ImageUrl="~/Images/im_yahoo.gif" Visible="False" ToolTip="آیدی یاهو مسنجر دارد" /><asp:Image ID="Image_msn" runat="server" ImageUrl="~/Images/im_msn.gif" Visible="False" ToolTip="آی دی MSN دارد" /><asp:Image ID="Image_icq" runat="server" ImageUrl="~/Images/im_icq.gif" Visible="False" ToolTip="آیدی ICQ دارد" /><asp:Image ID="Image_aim" runat="server" ImageUrl="~/Images/im_aim.gif" Visible="False" ToolTip="آیدی AIM دارد" /><asp:Image ID="Image_skype" runat="server" ImageUrl="~/Images/im_skype.gif" Visible="False" ToolTip="آیدی Skype دارد" /></td>
                                    <td class="Col1" rowspan="1" style="vertical-align: top">
                                        &nbsp;
                                        <hr style="COLOR: #d1d1e1" size="1"/>
                                        <asp:Label ID="Label_Signature" runat="server"></asp:Label>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td rowspan="1" style="border-left: #d1d1e1 2px solid; padding-right: 5px;" class="Col2">
                                            <asp:Image ID="Image_Online" runat="server" ImageUrl="~/Images/user_offline.gif" /><asp:Label ID="Label_ReplyID" runat="server" Text='<%# Eval("ReplyID") %>' Visible="False"></asp:Label><a
                                                href="javascript:window.scroll(0,0)"><span style="font-size: 10px">بالای صفحه<span
                                                    style="color: #0000ff; text-decoration: underline"></span></span></a></td>
                                    <td rowspan="1" class="Col1">
                                        <asp:ImageButton ID="ImageButton_Edit" runat="server" ImageUrl="~/Images/edit.gif"
                                    OnClick="ImageButton_Edit_Click1" Style="float: left" ValidationGroup="110" Visible="False" CommandArgument="<%# Container.DataItemIndex %>" />
                                        <asp:ImageButton ID="ImageButton_Delete" runat="server" ImageUrl="~/Images/Delete.gif"
                                    OnClick="ImageButton_Delete_Click1" Style="float: left" ValidationGroup="110" Visible="False" CommandArgument="<%# Container.DataItemIndex %>" />
                                        <asp:ImageButton ID="ImageButton_SendPM" runat="server" CommandArgument="<%# Container.DataItemIndex %>"
                                                        OnClick="ImageButton_Delete_Click1" Style="float: left" Visible="False" ImageUrl="~/Images/PM.gif" ValidationGroup="2" />
                                        <asp:ImageButton ID="ImageButton_Quote" runat="server" CommandArgument="<%# Container.DataItemIndex %>"
                                                        OnClick="ImageButton_Quote_Click1" Style="float: left" Visible="False" ImageUrl="~/Images/quote.gif" ValidationGroup="1" /></td>
                                </tr>
                            </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#5C7099" BorderStyle="Solid" BorderWidth="1px"
                        ForeColor="White" HorizontalAlign="Center" Height="25px" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_ShowReply" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                    SelectCommand="Forums_TopicReplyList" SelectCommandType="StoredProcedure" InsertCommand="Forums_InsertReply" InsertCommandType="StoredProcedure" OnInserted="SqlDataSource_ShowReply_Inserted" DeleteCommand="Forums_DeleteReplyByID" DeleteCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="TopicID" QueryStringField="tid" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="TopicID" QueryStringField="tid" Type="Int32" />
                        <asp:Parameter Name="Message" Type="String" />
                        <asp:Parameter Name="UserID" Type="String" />
                        <asp:Parameter Name="UserIP" Type="String" />
                        <asp:Parameter Name="ForumID" Type="Int32" />
                    </InsertParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="ReplyID" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; padding-bottom: 10px; padding-top: 10px;">
                <Editor:FCKeditor ID="FCKeditor_Reply" UseBROnCarriageReturn="true" runat="server" BasePath="~/FCKeditor/"
                    ToolbarSet="Basic" Width="80%">
                </Editor:FCKeditor>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label_Message" runat="server" ForeColor="Blue"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;<asp:ImageButton ID="ImageButton_Reply" runat="server" OnClick="ImageButton_Reply_Click" ImageUrl="~/Images/reply.gif" ValidationGroup="1110" /></td>
        </tr>
    </table>
</asp:Content>

