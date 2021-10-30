<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="BrowsePolls.aspx.cs" Inherits="BrowesPolls" Title="Untitled Page" %>
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
    <div class="grid" dir="rtl">
        <div class="rounded">
            <div class="top-outer">
                <div class="top-inner">
                    <div class="top">
                        <h2>
                            آرشیو نظرسنجی</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<asp:GridView id="GridView_PollsList" runat="server" GridLines="None" DataSourceID="SqlDataSource_PollArchive" DataKeyNames="QuestionID" CssClass="datatable" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True">
<PagerSettings PageButtonCount="7" Mode="NumericFirstLast" LastPageText="&#187;" FirstPageText="&#171;"></PagerSettings>
<Columns>
<asp:TemplateField HeaderText="ردیف">
<ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                    
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="QuestionText" SortExpression="QuestionText" HeaderText="عنوان سوال">
<ItemStyle Width="45%"></ItemStyle>

<HeaderStyle HorizontalAlign="Right" VerticalAlign="Top"></HeaderStyle>
</asp:BoundField>
<asp:TemplateField SortExpression="AddedDate" HeaderText="تاریخ درج">
<ItemStyle Width="15%" CssClass="Date" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                        <asp:Label ID="Label_Date" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>'></asp:Label>
                                    
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField ReadOnly="True" DataField="TotalVotes" SortExpression="TotalVotes" HeaderText="تعداد کل آرا">
<ItemStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
<asp:TemplateField>
<ItemStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
<ItemTemplate>
                                        <asp:HyperLink ID="HyperLink_Show" runat="server" NavigateUrl='<%# Eval("QuestionID", "~/PollsResult.aspx?qid={0}") %>'>نمایش</asp:HyperLink>
                                    
</ItemTemplate>
</asp:TemplateField>
</Columns>

<RowStyle CssClass="row"></RowStyle>
<EmptyDataTemplate>
<asp:Label id="Label2" runat="server" Width="100%" Text="تاکنون نظرسنجی در سایت ثبت نشده است"></asp:Label>
                            
</EmptyDataTemplate>

<PagerStyle CssClass="pager-row"></PagerStyle>
</asp:GridView> <asp:SqlDataSource id="SqlDataSource_PollArchive" runat="server" SelectCommandType="StoredProcedure" SelectCommand="Polls_GetQuestionsArchive" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"></asp:SqlDataSource>
</contenttemplate>
                        </asp:UpdatePanel>&nbsp;&nbsp;
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
    </div></div>
</asp:Content>

