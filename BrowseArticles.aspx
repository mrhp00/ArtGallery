<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="BrowseArticles.aspx.cs" Inherits="BrowseArticles" Title="Untitled Page" %>
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
                            لیست مقالات</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<asp:GridView id="GridView_ArticleList" runat="server" DataSourceID="SqlDataSource_ArticleList" GridLines="None" CssClass="datatable" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True">
                            <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                PageButtonCount="7" />
                            <Columns>
                                <asp:TemplateField HeaderText="ردیف">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title">
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="AddedBy" HeaderText="نویسنده" SortExpression="AddedBy">
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Abstract" HeaderText="چکیده" SortExpression="Abstract" Visible="False">
                                    <ItemStyle Width="20%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="تاریخ" SortExpression="AddedDate">
                                    <EditItemTemplate>
                                    </EditItemTemplate>
                                    <ItemStyle CssClass="Date" HorizontalAlign="Center" Width="10%" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true)  %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="ViewCount" HeaderText=" بازدید" SortExpression="ViewCount">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemStyle Width="10%" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton_Show" runat="server" CommandArgument="<%# Container.DataItemIndex %>"
                                            OnClick="LinkButton_Show_Click" ValidationGroup="11">نمایش</asp:LinkButton>
                                        <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("ArticleID") %>' Visible="False"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle CssClass="row" HorizontalAlign="Right" />
                            <EmptyDataTemplate>
                                &nbsp;در گروه انتخابی تاکنون مقاله ای ثبت نشده است.
                            </EmptyDataTemplate>
                            <PagerStyle CssClass="pager-row" />
                            <HeaderStyle HorizontalAlign="Right" />
                        </asp:GridView> <asp:SqlDataSource id="SqlDataSource_ArticleList" runat="server" __designer:dtid="16888498602639395" UpdateCommandType="StoredProcedure" UpdateCommand="Articles_IncrementViewCount" SelectCommandType="StoredProcedure" SelectCommand="Articles_GetArticlesByCategories" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" __designer:wfdid="w331">
        <SelectParameters __designer:dtid="16888498602639396">
            <asp:QueryStringParameter __designer:dtid="16888498602639397" Name="CategoryID" QueryStringField="CatID" Type="Int32" DefaultValue="0"  />
        </SelectParameters>
        <UpdateParameters __designer:dtid="16888498602639398">
            <asp:Parameter __designer:dtid="16888498602639399" Name="ArticleID" Type="Int32"  />
        </UpdateParameters>
    </asp:SqlDataSource>
</contenttemplate>
                        </asp:UpdatePanel>&nbsp; &nbsp;</div>
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
    </div>
</asp:Content>

