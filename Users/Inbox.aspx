<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="Users_Inbox" Title="Untitled Page" EnableSessionState="true"%>
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
<TABLE style="WIDTH: 100%" cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD style="BORDER-RIGHT: #0b198c 1px solid; PADDING-RIGHT: 10px; BORDER-TOP: #0b198c 1px solid; FONT-WEIGHT: bold; BORDER-LEFT: #0b198c 1px solid; COLOR: white; HEIGHT: 40px; BACKGROUND-COLOR: #869bbf" colSpan=4>پیغام های دریافتی</TD></TR><TR><TD colSpan=4><asp:GridView style="BORDER-RIGHT: #0b198c 1px solid; BORDER-TOP: #0b198c 1px solid; BORDER-LEFT: #0b198c 1px solid; BORDER-BOTTOM: #0b198c 1px solid" id="GridView_Inbox" runat="server" Width="100%" OnRowDataBound="GridView_Inbox_RowDataBound" GridLines="Horizontal" DataSourceID="SqlDataSource_Inbox" AutoGenerateColumns="False"><Columns>
<asp:TemplateField>
<ItemStyle Width="5%" CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
<ItemTemplate>
                                <asp:Image ID="Image_Read" runat="server" ImageUrl="~/Images/ReadMessage.gif" />
                                <asp:CheckBox ID="CheckBox_IsRead" runat="server" Checked='<%# Bind("IsRead") %>'
                                    Visible="False" />
                            
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="Subject" HeaderText="عنوان"><EditItemTemplate>
                                &nbsp;
                            
</EditItemTemplate>

<ItemStyle Width="40%" CssClass="Col1" HorizontalAlign="Right" VerticalAlign="Middle"></ItemStyle>
<ItemTemplate>
                                <asp:LinkButton ID="LinkButton_Subject" runat="server" CommandArgument="<%# Container.DataItemIndex %>"
                                    OnClick="LinkButton_Subject_Click" Text='<%# Eval("Subject") %>'></asp:LinkButton>
                                <asp:Label ID="Label_MessageID" runat="server" Text='<%# Eval("MessageID") %>' Visible="False"></asp:Label>
                            
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="Sender" HeaderText="فرستنده">
<ItemStyle Width="15%" CssClass="Col2" HorizontalAlign="Left" VerticalAlign="Middle"></ItemStyle>
<ItemTemplate>
                                <asp:HyperLink ID="HyperLink_Sender" runat="server" NavigateUrl='<%# Eval("Sender", "~/ShowProfile.aspx?uid={0}") %>'
                                    Text='<%# Eval("Sender") %>'></asp:HyperLink>
                            
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="AddedDate" HeaderText="تاریخ ارسال">
<ItemStyle Width="15%" CssClass="Col1" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
<DIV style="VERTICAL-ALIGN: middle; WIDTH: 100%" class="Date">
                                <asp:Label ID="Label_Date" runat="server" CssClass="Date" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>' style="direction: ltr; text-align: left;"></asp:Label></DIV>
                            
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="Sender" HeaderText="پاسخ">
<ItemStyle Width="10%" CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                <asp:ImageButton ID="ImageButton_Reply" runat="server" CommandArgument="<%# Container.DataItemIndex %>"
                                    ImageUrl="~/Images/reply.gif" OnClick="ImageButton_Reply_Click" ValidationGroup="11111" />
                            
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="حذف">
<ItemStyle Width="5%" CssClass="Col1" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                <asp:CheckBox ID="CheckBox_Delete" runat="server" />
                            
</ItemTemplate>
</asp:TemplateField>
</Columns>

<RowStyle Height="40px" VerticalAlign="Middle"></RowStyle>
<EmptyDataTemplate>
                        تاکنون پیغام جدیدی برای شما نرسیده است
                    
</EmptyDataTemplate>

<HeaderStyle BackColor="#5C7099" Height="20px" ForeColor="White" HorizontalAlign="Right" Font-Bold="True" VerticalAlign="Top"></HeaderStyle>
</asp:GridView> <asp:SqlDataSource id="SqlDataSource_Inbox" runat="server" UpdateCommandType="StoredProcedure" UpdateCommand="Forums_PMMessageSetReadMessage" DeleteCommandType="StoredProcedure" DeleteCommand="Forums_PMMessageDelete" SelectCommandType="StoredProcedure" SelectCommand="Forums_PMMessageShowInBox" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserName" SessionField="UserName" Type="String" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="MessageID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="MessageID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource> </TD></TR><TR><TD style="PADDING-RIGHT: 5px; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; TEXT-ALIGN: center" colSpan=4><asp:ImageButton id="ImageButton_Delete" onclick="ImageButton_Delete_Click" runat="server" ImageUrl="~/Images/Delete.gif" ValidationGroup="12"></asp:ImageButton> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="ImageButton_Delete" __designer:wfdid="w301" ConfirmText="برای حذف پیغام های انتخابی مطمئن هستید؟"></Ajax:ConfirmButtonExtender></TD></TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>

