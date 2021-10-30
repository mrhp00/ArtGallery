<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="ManagmentLinks.aspx.cs" Inherits="ManagmentLinks" Title="Untitled Page" %>
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
                            مدیریت لینک های سایت</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD colSpan=2><asp:GridView style="MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px" id="GridView_Links" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="datatable" GridLines="None" OnSelectedIndexChanged="GridView_Links_SelectedIndexChanged" DataSourceID="SqlDataSource_Link">
<PagerSettings PageButtonCount="7" Mode="NumericFirstLast" LastPageText="&#187;" FirstPageText="&#171;"></PagerSettings>
<Columns>
<asp:TemplateField HeaderText="ردیف">
<ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="Name" HeaderText="نام سایت">
<ItemStyle Width="40%" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Address", "http://{0}") %>'
                                                        Target="_blank" Text='<%# Eval("Name") %>'></asp:HyperLink>
                                                
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="Address" SortExpression="Address" HeaderText="ادرس">
<ItemStyle Width="40%" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:BoundField>
<asp:TemplateField HeaderText="حذف">
<ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
<ItemTemplate>
                                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("LinkID") %>' Visible="False"></asp:Label>
                                                    <asp:CheckBox ID="CheckBox_Delete" runat="server" />
                                                
</ItemTemplate>
</asp:TemplateField>
<asp:CommandField SelectText="ویرایش" ShowSelectButton="True">
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>

<ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
</asp:CommandField>
</Columns>

<RowStyle CssClass="row"></RowStyle>
<EmptyDataTemplate>
<asp:Label id="Label3" runat="server" Width="100%" Text="تاکنون هیچگونه لینکی در سایت ثبت نشده است." __designer:wfdid="w2"></asp:Label> 
</EmptyDataTemplate>

<SelectedRowStyle BackColor="AliceBlue"></SelectedRowStyle>

<PagerStyle CssClass="pager-row"></PagerStyle>
</asp:GridView> <asp:SqlDataSource id="SqlDataSource_Link" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" DeleteCommand="Link_DeleteByID" DeleteCommandType="StoredProcedure" OnUpdated="SqlDataSource_Link_Updated" SelectCommand="Link_LinkList" SelectCommandType="StoredProcedure" UpdateCommand="Link_Update" UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:Parameter Name="LinkID" Type="Int32" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="LinkID" Type="Int32" />
                                            <asp:ControlParameter ControlID="CheckBox_AcceptLink" Name="AcceptLink" PropertyName="Checked"
                                                Type="Boolean" />
                                            <asp:ControlParameter ControlID="TextBox_Address" Name="Address" PropertyName="Text"
                                                Type="String" />
                                            <asp:ControlParameter ControlID="TextBox_Name" Name="Name" PropertyName="Text" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource> </TD></TR><TR><TD style="WIDTH: 20%">نام سایت:</TD><TD><asp:TextBox id="TextBox_Name" runat="server" Width="60%" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Name" ErrorMessage="لطفا نام سایت را وارد نمایید" ValidationGroup="1235">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="نام سایت را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Name" __designer:wfdid="w51" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD>آدرس سایت:</TD><TD><asp:TextBox style="TEXT-ALIGN: left" id="TextBox_Address" runat="server" Width="60%" CssClass="TextBox"></asp:TextBox><asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_Address" ErrorMessage="لطفا آدرس سایت را صحیح وارد نمایید" ValidationGroup="1235" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?">*</asp:RegularExpressionValidator><asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Address" ErrorMessage="لطفا آدرس سایت را وارد نمایید" ValidationGroup="1235">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="آدرس سایت را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Address" __designer:wfdid="w52" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD>فعال بودن لینک:</TD><TD><asp:CheckBox id="CheckBox_AcceptLink" runat="server"></asp:CheckBox></TD></TR><TR><TD colSpan=2><asp:ValidationSummary style="FLOAT: right" id="ValidationSummary1" runat="server" ValidationGroup="1235"></asp:ValidationSummary> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Delete" __designer:wfdid="w53" ConfirmText="برای حذف لینک های انتخاب شده مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender2" runat="server" TargetControlID="Button_Update" __designer:wfdid="w54" ConfirmText="برای بروز رسانی لینک انتخابی مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:Label id="Label_Message" runat="server" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Button id="Button_Delete" onclick="Button_Delete_Click" runat="server" CssClass="Button" ValidationGroup="22" Text="حذف"></asp:Button><asp:Button id="Button_Update" onclick="Button_Update_Click" runat="server" CssClass="Button" ValidationGroup="1235" Text="بروزرسانی"></asp:Button></TD></TR></TBODY></TABLE>
</contenttemplate>
                        </asp:UpdatePanel>
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
    </div>
</asp:Content>

