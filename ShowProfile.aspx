<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="ShowProfile.aspx.cs" Inherits="ShowProfile" Title="Untitled Page" %>
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
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="BORDER-RIGHT: #0b198c 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #0b198c 1px solid; BORDER-LEFT: #0b198c 1px solid; WIDTH: 100%; BORDER-BOTTOM: #0b198c 1px solid" class="Col2"><TBODY><TR><TD style="PADDING-RIGHT: 10px; FONT-WEIGHT: bold; COLOR: #ffffff; HEIGHT: 30px; BACKGROUND-COLOR: #5c7099" colSpan=2>نمایش پروفایل کاربری</TD></TR><TR><TD style="WIDTH: 20%">نام کاربری:</TD><TD><asp:Label id="Label_Username" runat="server"></asp:Label></TD></TR><TR><TD>سال تولد:</TD><TD><asp:Label id="Label_BirthYear" runat="server"></asp:Label></TD></TR><TR><TD>محل سکونت:</TD><TD><asp:Label id="Label_Location" runat="server"></asp:Label></TD></TR><TR><TD>تاریخ عضویت:</TD><TD><asp:Label id="Label_DateRegister" runat="server"></asp:Label></TD></TR><TR><TD>آخرین بازدید از سایت:</TD><TD><asp:Label id="Label_LastLoginDate" runat="server"></asp:Label></TD></TR><TR><TD>امضا:</TD><TD><asp:Label id="Label_Signature" runat="server"></asp:Label></TD></TR><TR><TD>YahooID:</TD><TD><asp:Label id="Label_YahooID" runat="server"></asp:Label></TD></TR><TR><TD>HotmailID:</TD><TD><asp:Label id="Label_HotmailID" runat="server"></asp:Label></TD></TR><TR><TD>ICQ:</TD><TD><asp:Label id="Label_ICQ" runat="server"></asp:Label></TD></TR><TR><TD>MSN:</TD><TD><asp:Label id="Label_MSN" runat="server"></asp:Label></TD></TR><TR><TD>SkypeName:</TD><TD><asp:Label id="Label_SkypeName" runat="server"></asp:Label></TD></TR><TR><TD>AIM:</TD><TD><asp:Label id="Label_AIM" runat="server"></asp:Label></TD></TR><TR><TD>تعداد پست های ارسالی:</TD><TD><asp:Label id="Label_PostCount" runat="server"></asp:Label></TD></TR><TR><TD>آخرین پست ارسالی:</TD><TD><asp:FormView id="FormView_LastPost" runat="server" DataKeyNames="ReplyID" DataSourceID="SqlDataSource_LastPost"><EmptyDataTemplate>
                                            تاکنون پستی برای این کاربر ثبت نشده است
                                        
</EmptyDataTemplate>
<ItemTemplate>
<asp:HyperLink id="HyperLink_LastPost" runat="server" NavigateUrl='<%# Eval("TopicID", "~/ShowThread.aspx?tid={0}") %>' Text='<%# Eval("Subject") %>' ToolTip='<%# Eval("Message") %>' __designer:wfdid="w151"></asp:HyperLink> 
</ItemTemplate>
</asp:FormView> <asp:SqlDataSource id="SqlDataSource_LastPost" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" SelectCommand="Forums_LastPostForUser" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="UserID" QueryStringField="uid" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource> </TD></TR><TR><TD>آخرین تاپیک ارسالی:</TD><TD><asp:FormView id="FormView_LastTopic" runat="server" DataKeyNames="TopicID" DataSourceID="SqlDataSource_LastTopic"><EmptyDataTemplate>
                                            این کاربر تاکنون تاپیک ثبت نکرده است
                                        
</EmptyDataTemplate>
<ItemTemplate>
                                            <asp:HyperLink ID="HyperLink_LastTopic" runat="server" NavigateUrl='<%# Eval("TopicID", "~/ShowThread.aspx?tid={0}") %>'
                                                Text='<%# Eval("Subject") %>' ToolTip='<%# Eval("Message") %>'></asp:HyperLink>
                                        
</ItemTemplate>
</asp:FormView> <asp:SqlDataSource id="SqlDataSource_LastTopic" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" SelectCommand="Forums_LastTopicForUser" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="UserID" QueryStringField="uid" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource> </TD></TR><TR><TD></TD><TD></TD></TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>

