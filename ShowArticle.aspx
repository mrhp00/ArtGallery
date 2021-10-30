<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ShowArticle.aspx.cs" Inherits="ShowArticle" Title="Untitled Page" EnableSessionState="True"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">

            function onUpdating(){
                // get the update progress div
                var pnlPopup = $get('<%= this.pnlPopup.ClientID %>'); 

                //  get the gridview element        
                var gridView = $get('<%= this.Div_ArticleComments.ClientID %>');
                
                // make it visible
                pnlPopup.style.display = '';	    
                
                // get the bounds of both the gridview and the progress div
                var gridViewBounds = Sys.UI.DomElement.getBounds(gridView);
                var pnlPopupBounds = Sys.UI.DomElement.getBounds(pnlPopup);
                
                //  center of gridview
                var x = gridViewBounds.x + Math.round(gridViewBounds.width / 2) - Math.round(pnlPopupBounds.width / 2);
                var y = gridViewBounds.y + Math.round(gridViewBounds.height / 2) - Math.round(pnlPopupBounds.height / 2);	    

                //	set the progress element to this position
                Sys.UI.DomElement.setLocation(pnlPopup, x, y);           
            }

            function onUpdated() {
                // get the update progress div
                var pnlPopup = $get('<%= this.pnlPopup.ClientID %>'); 
                // make it invisible
                pnlPopup.style.display = 'none';
            }            
        </script>
    <asp:Panel ID="pnlPopup" runat="server" Height="50px" Style="display: none" Width="150px">
        <div class="grid" dir="rtl">
            <div class="rounded">
                <div class="top-outer">
                    <div class="top-inner">
                        <div class="top">
                            <h2 style="font-weight: normal; font-size: 10px; text-align: center">
                                لطفا
                                چند لحظه صبر کنید</h2>
                        </div>
                    </div>
                </div>
                <div class="mid-outer">
                    <div class="mid-inner">
                        <div class="mid" style="text-align: center">
                            <!-- Content Goes Here! -->
                            <div class="Col2" style="width: 100%; height: 100%">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/loading.gif" /></div>
                            </div>
                    </div>
                </div>
                <div class="bottom-outer">
                    <div class="bottom-inner">
                        <div class="bottom">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>
    <Ajax:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" runat="server" TargetControlID="UpdatePanel1">
        <Animations>
                <OnUpdating>
                    <Parallel duration="0">
                        <EnableAction Enabled="false" />
                        <ScriptAction Script="onUpdating();" />  
                        <FadeOut minimumOpacity=".5" />
                    </Parallel>
                </OnUpdating>
                <OnUpdated>
                    <Parallel duration="0">
                        <FadeIn minimumOpacity=".5" />
                        <ScriptAction Script="onUpdated();" />
                        <EnableAction Enabled="true" />
                    </Parallel>
                </OnUpdated>
            </Animations>
    </Ajax:UpdatePanelAnimationExtender>
    <asp:ScriptManagerProxy id="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div class="grid" dir="rtl">
        <div class="rounded">
            <div class="top-outer">
                <div class="top-inner">
                    <div class="top">
                        <h2>
                            نمایش مقالات</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:FormView ID="FormView_ShowArticle" runat="server" DataKeyNames="ArticleID" DataSourceID="SqlDataSource_ShowArticle"
                            Width="100%">
                            <EditItemTemplate>
                                &nbsp;
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <asp:Label ID="Label2" runat="server" Text="مقاله ای با چنین مشخصاتی در سایت موجود نمی باشد"
                                    Width="100%"></asp:Label>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                               <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td style="width: 20%">
                                                    عنوان مقاله:</td>
                                                <td style="width: 80%">
                                                    <asp:Label ID="Label_Title" runat="server" Text='<%# Eval("Title") %>' ForeColor="Navy"></asp:Label></td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td style="width: 20%">
                                                    نویسنده:</td>
                                                <td>
                                                    <asp:Label ID="Label_Writer" runat="server" Text='<%# Eval("AddedBy") %>' ForeColor="Navy"></asp:Label></td>
                                            </tr>
                                            <tr style="color: #000000">
                                                <td style="width: 20%">
                                                    تاریخ:</td>
                                                <td>
                                                    <asp:Label ID="Label_Date" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),false) %>' CssClass="Date" ForeColor="Navy"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 20%">
                                                    دفعات بازدید:</td>
                                                <td>
                                                    <asp:Label ID="Label_ViewCount" runat="server" Text='<%# Eval("ViewCount") %>' ForeColor="Navy"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align: top; width: 20%">
                                                    چکیده:</td>
                                                <td>
                                                    <asp:Label ID="Label_Abstruct" runat="server" Style="text-align: justify" Text='<%# Eval("Abstract") %>'></asp:Label></td>
                                            </tr>
                                   <tr>
                                       <td style="vertical-align: top; width: 20%">
                                                    متن مقاله:</td>
                                       <td>
                                       </td>
                                   </tr>
                                            <tr>
                                                <td style="vertical-align: top; padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px;" colspan="2">
                                                    <asp:Label ID="Label_Body" runat="server" Text='<%# Eval("Body") %>' style="text-align: justify"></asp:Label>
                                        <asp:CheckBox ID="CheckBox_CommentsEnabled" runat="server" Checked='<%# Bind("CommentsEnabled") %>' Visible="False" />
                                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("ArticleID") %>' Visible="False"></asp:Label>
                                        <asp:CheckBox ID="CheckBox_OnlyForMembers" runat="server" Checked='<%# Eval("OnlyForMembers") %>' Visible="False" /></td>
                                            </tr>
                                        </table>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource_ShowArticle" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                            SelectCommand="Articles_GetArticleByID" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="ArticleID" QueryStringField="ID" Type="Int32" DefaultValue="0" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource_Comment" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                            DataSourceMode="DataReader" SelectCommand="Articles_GetCommentCountByArticle"
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="ArticleID" QueryStringField="ID"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        &nbsp;
                        <asp:FormView ID="FormView_Comment" runat="server" DataSourceID="SqlDataSource_Comment">
                            <EditItemTemplate>
                                Column1:
                                <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>'>
                                </asp:TextBox><br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update">
                                </asp:LinkButton>
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel">
                                </asp:LinkButton>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                Column1:
                                <asp:TextBox ID="Column1TextBox" runat="server" Text='<%# Bind("Column1") %>'>
                                </asp:TextBox><br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Insert">
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel">
                                </asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                تعداد نظرات ثبت شده (<asp:Label ID="Label_CommentCount" runat="server" Text='<%# Eval("Column1", "{0}") %>'></asp:Label>)
                                نظر&nbsp;
                                <asp:HyperLink ID="HyperLink_EnterNewsComments" runat="server" NavigateUrl="~/EnterArticleComments.aspx"
                                    Target="_blank">نظر بدهید</asp:HyperLink>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:Label ID="Label_Message" runat="server" ForeColor="#0000C0" Visible="False"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="bottom-outer">
                <div class="bottom-inner">
                    <div class="bottom">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="Div_ArticleComments" runat="server" class="grid" dir="rtl">
        <div class="rounded">
            <div class="top-outer">
                <div class="top-inner">
                    <div class="top">
                        <h2>
                            لیست نظرات</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
                        <asp:GridView ID="GridView_ArticleCommentsList" runat="server" AllowPaging="True"
                            AllowSorting="True" AutoGenerateColumns="False" CssClass="datatable" DataSourceID="SqlDataSource_CommentsArticleList"
                            GridLines="None">
                            <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                PageButtonCount="7" />
                            <Columns>
                                <asp:TemplateField HeaderText="ردیف">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="AddedBy" HeaderText="توسط" SortExpression="AddedBy">
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AddedByEmail" HeaderText="ایمیل" SortExpression="AddedByEmail">
                                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="15%" />
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="تاریخ" SortExpression="AddedDate">
                                    <EditItemTemplate>
                                        &nbsp;
                                    </EditItemTemplate>
                                    <ItemStyle CssClass="Date" HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" CssClass="Date" Style="direction: ltr; text-align: center"
                                            Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Body" HeaderText="نظر" SortExpression="Body">
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="55%" />
                                    <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="حذف">
                                    <ItemTemplate>
                                        <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("CommentID") %>' Visible="False"></asp:Label>
                                        <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandArgument="<%# Container.DataItemIndex %>"
                                            OnClick="LinkButton_Delete_Click" ValidationGroup="65654">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle CssClass="row" />
                            <EmptyDataTemplate>
                                <asp:Label ID="Label3" runat="server" Text="تاکنون نظری برای این مقاله ثبت نشده است"
                                    Width="100%"></asp:Label>
                            </EmptyDataTemplate>
                            <PagerStyle CssClass="pager-row" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource_CommentsArticleList" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                            DeleteCommand="Articles_DeleteComment" DeleteCommandType="StoredProcedure" SelectCommand="Articles_GetCommentsByArticle"
                            SelectCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:Parameter Name="CommentID" Type="Int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="ArticleID" QueryStringField="ID"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource></contenttemplate>
                        </asp:UpdatePanel>&nbsp;
                    </div>
                </div>
            </div>
            <div class="bottom-outer">
                <div class="bottom-inner">
                    <div class="bottom">
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

