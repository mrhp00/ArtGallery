<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="BrowseForums.aspx.cs" Inherits="BrowseForums" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="Main" runat="server">
    <script type="text/javascript">

            function onUpdating(){
                // get the update progress div
                var pnlPopup = $get('<%= this.pnlPopup.ClientID %>'); 

                //  get the gridview element        
                var gridView = $get('<%= this.Main.ClientID %>');
                
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
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/loading.gif" /></div>
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
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
         <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td colspan="4" style="height: 25px">
                <asp:ImageButton ID="ImageButton_NewTopic" runat="server" OnClick="ImageButton_NewTopic_Click" ImageUrl="~/Images/newthread.gif" /></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 40px; border: #8b90c3 1px solid; font-weight: bold; color: white;border-bottom: #8b90c3 0px none; background-color: #869bbf;">
                <asp:Label ID="Label_ForumName" runat="server" Font-Bold="True" style="padding-right: 5px"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView_TopicsList" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="TopicID" DataSourceID="SqlDataSource_ForumList"
                    GridLines="Horizontal" Width="100%" OnRowDataBound="GridView_TopicsList_RowDataBound" style="border: #8b90c3 1px solid; " AllowPaging="True" PageSize="15">
                    <Columns>
                        <asp:TemplateField HeaderText="TopicID" InsertVisible="False" SortExpression="TopicID"
                            Visible="False">
                            <EditItemTemplate>
                                &nbsp;
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("TopicID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemStyle CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/thread_hot.gif" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="موضوع" SortExpression="Subject">
                            <EditItemTemplate>
                                
                            </EditItemTemplate>
                            <ItemStyle Width="55%" CssClass="Col1" HorizontalAlign="Right" VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink_TopicTitle" runat="server" NavigateUrl='<%# Eval("TopicID", "~/ShowThread.aspx?tid={0}") %>'
                                    Text='<%# Eval("Subject") %>' Font-Bold="True" ToolTip='<%# Eval("Message") %>' style="padding-right: 5px"></asp:HyperLink><br />
                                <asp:Label ID="Label_UserName" runat="server" Text='<%# Eval("UserID") %>' style="padding-right: 5px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="آخرین نوشته">
                            <ItemStyle Width="25%" CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label ID="Label_Date" runat="server" Visible="False"></asp:Label><br />
                                <asp:Label ID="Label_By" runat="server" Visible="False"></asp:Label>
                                <asp:HyperLink ID="HyperLink_UserName" runat="server" Visible="False">[HyperLink_UserName]</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="پاسخ ها">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="8%" CssClass="Col1" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            <ItemTemplate>
                                <asp:Label ID="Label_ReplyCount" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ViewCount" HeaderText="بازدید" SortExpression="ViewCount">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" CssClass="Col2" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="حذف">
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton_Delete" runat="server" CommandArgument="<%# Container.DataItemIndex %>"
                                    ImageUrl="~/Images/Delete.gif" OnClick="ImageButton_Delete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle HorizontalAlign="Right"
                        VerticalAlign="Middle" Height="40px" />
                    <EmptyDataTemplate>
                        در این انجمن تاکنون تاپیکی ثبت نشده است
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#5C7099" Font-Bold="True" ForeColor="White" HorizontalAlign="Right"
                        VerticalAlign="Top" Height="20px" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#5C7099" ForeColor="White" HorizontalAlign="Center" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_ForumList" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                    SelectCommand="Forums_TopicsList" SelectCommandType="StoredProcedure" DeleteCommand="Forums_DeleteTopics" DeleteCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ForumID" QueryStringField="FID" Type="Int32" DefaultValue="0" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="TopicID" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:ImageButton ID="ImageButton_NewTopic1" runat="server" OnClick="ImageButton_NewTopic_Click" ImageUrl="~/Images/newthread.gif" /></td>
        </tr>
    </table>
    </contenttemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>

