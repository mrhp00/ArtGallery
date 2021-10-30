<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ShowNews.aspx.cs" Inherits="ShowNews" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">

            function onUpdating(){
                // get the update progress div
                var pnlPopup = $get('<%= this.pnlPopup.ClientID %>'); 

                //  get the gridview element        
                var gridView = $get('<%= this.Div_CommentsNews.ClientID %>');
                
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
                            نمایش خبر</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:FormView ID="FormView_Show" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource_Show" Width="100%">
                            <ItemTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td>
                                            عنوان خبر:<asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            تاریخ درج خبر:<asp:Label ID="AddedDateLabel" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),false) %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            دفعات نمایش خبر:
                                            <asp:Label ID="ViewCountLabel" runat="server" Text='<%# Bind("ViewCount") %>'></asp:Label>
                                            بار</td>
                                    </tr>
                                    <tr>
                                        <td style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Body") %>'></asp:Label></td>
                                    </tr>
                                </table>
                                <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
                                <asp:CheckBox ID="CheckBox_CommentEnabeld" runat="server" Checked='<%# Bind("CommentsEnabled") %>'
                                    Enabled="false" Visible="False" />
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <asp:Label ID="Label2" runat="server" Text="خبری با چنین مشخصاتی در سایت موجود نمی باشد"
                                    Width="100%"></asp:Label>
                            </EmptyDataTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource_Show" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                            SelectCommand="News_GetNewsByID" SelectCommandType="StoredProcedure"
                            UpdateCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="NewsID" QueryStringField="ID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource_Comment" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                            DataSourceMode="DataReader" SelectCommand="News_CommentsCount" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" DefaultValue="0" />
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
                                <asp:HyperLink ID="HyperLink_EnterNewsComments" runat="server" NavigateUrl="~/EnterNewsComments.aspx"
                                    Target="_blank">نظر بدهید</asp:HyperLink>
                            </ItemTemplate>
                        </asp:FormView>
                        <!-- Content Goes Here! -->
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
    <div class="grid" dir="rtl" id="Div_CommentsNews" runat="server">
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
                            <asp:GridView ID="GridView_NewsCommentsList" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" CssClass="datatable" DataSourceID="SqlDataSource_CommentsNewsList"
        GridLines="None">
        <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
            PageButtonCount="7" />
        <Columns>
            <asp:TemplateField HeaderText="ردیف">
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
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
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" CssClass="Date" />
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>' style="direction: ltr; text-align: center" CssClass="Date"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Body" HeaderText="نظر" SortExpression="Body">
                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="55%" />
                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="حذف">
                <ItemTemplate>
                    <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("CommentID") %>' Visible="False"></asp:Label>
                    <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandArgument="<%# Container.DataItemIndex %>" OnClick="LinkButton_Delete_Click" ValidationGroup="65654">حذف</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle CssClass="row" />
        <EmptyDataTemplate>
            <asp:Label ID="Label3" runat="server" Text="تاکنون نظری برای این خبر ثبت نشده است"
                Width="100%"></asp:Label>
        </EmptyDataTemplate>
        <PagerStyle CssClass="pager-row" />
    </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource_CommentsNewsList" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" SelectCommand="News_GetCommentsListByID" SelectCommandType="StoredProcedure" DeleteCommand="News_DeleteCommentsByID" DeleteCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="NewsID" QueryStringField="ID" Type="Int32" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="CommentID" Type="Int32" />
                            </DeleteParameters>
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

