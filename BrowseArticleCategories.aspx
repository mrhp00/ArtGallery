<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="BrowseArticleCategories.aspx.cs" Inherits="BrowseArticleCategories" Title="Untitled Page" %>
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
                            لیست گروه مقالات</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
                    
                        <asp:DataList ID="DataList_Categories" runat="server" DataKeyField="CategoryID" DataSourceID="SqlDataSource_Categories"
                            OnItemDataBound="DataList_Categories_ItemDataBound" RepeatDirection="Horizontal"
                            Width="100%" RepeatColumns="2" BorderColor="#D1D1E1" BorderWidth="1px" GridLines="Horizontal" ShowFooter="False" ShowHeader="False">
                            <ItemTemplate>
                                <asp:Label ID="Label_Image" runat="server" Text='<%# Eval("ImageUrl") %>' Visible="False"></asp:Label>

                                <table style="width: 100%" border="0" cellpadding="0" cellspacing="0" class="Col1">
                                    <tr>
                                        <td rowspan="2" style="width: 85px; height: 85px">
                                            <asp:Image ID="HyperLink_Image" runat="server" Height="85px" ImageUrl='<%# Eval("ImageUrl", "~/CategoriesImage/{0}") %>'
                                                Width="85px" /></td>
                                        <td style="vertical-align: top; padding: 5px;">
                                            <asp:HyperLink ID="HyperLink_Title" runat="server" NavigateUrl='<%# Eval("CategoryID", "~/BrowseArticles.aspx?CatID={0}") %>'
                                                Text='<%# Eval("Title") %>'></asp:HyperLink>
                                            <asp:Label ID="Label_Count" runat="server"></asp:Label>
                                            <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("CategoryID") %>' Visible="False"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top; padding: 5px;">
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("CategoryID", "~/BrowseArticles.aspx?CatID={0}") %>'
                                                Text='<%# Eval("Description") %>'></asp:HyperLink></td>
                                    </tr>
                                </table>

                            </ItemTemplate>
                            
                        </asp:DataList>
</contenttemplate>
                        </asp:UpdatePanel></div>
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
    <asp:SqlDataSource ID="SqlDataSource_Categories" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
        SelectCommand="Articles_GetCategories" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

