<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="Outbox.aspx.cs" Inherits="Users_Outbox" Title="Untitled Page" %>
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
    </Ajax:UpdatePanelAnimationExtender><asp:ScriptManagerProxy id="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy><asp:UpdatePanel id="UpdatePanel1" runat="server"><contenttemplate>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td colspan="4" style="border-right: #0b198c 1px solid; border-top: #0b198c 1px solid;
                font-weight: bold; border-left: #0b198c 1px solid; color: white; height: 40px;
                background-color: #869bbf; padding-right: 10px;">
                پیغام های ارسالی</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView_OutBox" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_OutBox"
                    GridLines="Horizontal" OnRowDataBound="GridView_OutBox_RowDataBound" Style="border-right: #0b198c 1px solid;
                    border-top: #0b198c 1px solid; border-left: #0b198c 1px solid; border-bottom: #0b198c 1px solid"
                    Width="100%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemStyle CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                            <ItemTemplate>
                                <asp:Image ID="Image_Read" runat="server" ImageUrl="~/Images/ReadMessage.gif" />
                                <asp:CheckBox ID="CheckBox_IsRead" runat="server" Checked='<%# Bind("IsRead") %>'
                                    Visible="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="عنوان" SortExpression="Subject">
                            <EditItemTemplate>
                                &nbsp;
                            </EditItemTemplate>
                            <ItemStyle CssClass="Col1" HorizontalAlign="Right" VerticalAlign="Middle" Width="55%" />
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink_Subject" runat="server" NavigateUrl='<%# Eval("MessageID", "~/Users/ShowMessage.aspx?mid={0}") %>'
                                    Text='<%# Eval("Subject") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="گیرنده" SortExpression="Sender">
                            <ItemStyle CssClass="Col2" HorizontalAlign="Left" VerticalAlign="Middle" Width="15%" />
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink_Reciver" runat="server" NavigateUrl='<%# Eval("Sender", "~/ShowProfile.aspx?uid={0}") %>'
                                    Text='<%# Eval("Reciver") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تاریخ ارسال" SortExpression="AddedDate">
                            <ItemStyle CssClass="Col1" HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <div class="Date" style="vertical-align: middle; width: 100%">
                                <asp:Label ID="Label_Date" runat="server" CssClass="Date" Style="direction: ltr"
                                    Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>'></asp:Label></div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="40px" VerticalAlign="Middle" />
                    <EmptyDataTemplate>
                        شما تاکنون پیغامی ارسال نکرده اید
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#5C7099" Font-Bold="True" ForeColor="White" Height="20px"
                        HorizontalAlign="Right" VerticalAlign="Top" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_OutBox" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                    SelectCommand="Forums_PMMessageShowOutBox" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table></contenttemplate>
    </asp:UpdatePanel></div>
</asp:Content>

