<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="ManagmentNews.aspx.cs" Inherits="SiteAdmin_ManagmentNews" Title="Untitled Page" ValidateRequest="false"%>
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
                            مدیریت اخبار
                        </h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD colSpan=2><asp:GridView style="MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px" id="GridView_NewsList" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="datatable" DataSourceID="SqlDataSource_News" GridLines="None" OnSelectedIndexChanged="GridView_NewsList_SelectedIndexChanged" __designer:wfdid="w279">
                                        <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                            PageButtonCount="7" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ردیف">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Title" HeaderText="عنوان خبر" SortExpression="Title">
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="55%" />
                                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="تاریخ خبر" SortExpression="AddedDate">
                                                <ItemStyle CssClass="Date" HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label_Date" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ViewCount" HeaderText="بازدید" SortExpression="ViewCount">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="حذف">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox_Delete" runat="server" />
                                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("ID") %>' Visible="False"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField SelectText="ویرایش" ShowSelectButton="True">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            </asp:CommandField>
                                        </Columns>
                                        <RowStyle CssClass="row" />
                                        <EmptyDataTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="تاکنون در سایت خبری ثبت نشده است" Width="100%"></asp:Label>
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="AliceBlue" />
                                        <PagerStyle CssClass="pager-row" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:GridView> </TD></TR><TR><TD style="WIDTH: 20%">تاریخ:</TD><TD style="TEXT-ALIGN: right" class="Date"><asp:Label id="Label_Date" runat="server" __designer:wfdid="w280"></asp:Label></TD></TR><TR><TD style="WIDTH: 20%">عنوان:<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Title" ErrorMessage="لطفا عنوان خبر را وارد نمایید" ValidationGroup="45645" __designer:wfdid="w281">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="عنوان خبر را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Title" WatermarkCssClass="WaterMark" __designer:wfdid="w282"></Ajax:TextBoxWatermarkExtender></TD><TD><asp:TextBox id="TextBox_Title" runat="server" Width="99%" CssClass="TextBox" __designer:wfdid="w283"></asp:TextBox></TD></TR><TR><TD style="VERTICAL-ALIGN: top">خلاصه:<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Abstruct" ErrorMessage="لطفا خلاصه خبر را وارد نمایید" ValidationGroup="45645" __designer:wfdid="w284">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="خلاصه خبر را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Abstruct" WatermarkCssClass="WaterMark" __designer:wfdid="w285"></Ajax:TextBoxWatermarkExtender></TD><TD><asp:TextBox id="TextBox_Abstruct" runat="server" Width="99%" Height="50px" CssClass="TextBox" __designer:wfdid="w286" TextMode="MultiLine"></asp:TextBox></TD></TR><TR><TD style="VERTICAL-ALIGN: top">متن خبر:</TD><TD><Editor:FCKeditor UseBROnCarriageReturn="true" id="FCKEditor_Body" runat="server" Width="100%" __designer:wfdid="w287" BasePath="~/FCKeditor/" ToolbarSet="Basic">
                                    </Editor:FCKeditor> </TD></TR><TR><TD>فعال کردن نظرات:</TD><TD><asp:CheckBox id="CheckBox_EnabledComments" runat="server" __designer:wfdid="w288"></asp:CheckBox></TD></TR><TR><TD>عکس خبر:</TD><TD><asp:FileUpload id="FileUpload1" runat="server" Width="98%" __designer:wfdid="w289"></asp:FileUpload></TD></TR><TR><TD colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" ValidationGroup="45645" __designer:wfdid="w290"></asp:ValidationSummary> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" __designer:wfdid="w291" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Delete" __designer:wfdid="w292" ConfirmText="برای حذف خبر های انتخاب شده مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender2" runat="server" TargetControlID="Button_Update" __designer:wfdid="w293" ConfirmText="برای بروز رسانی خبر انتخاب شده مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:Label id="Label_FileName" runat="server" __designer:wfdid="w294" Visible="False"></asp:Label> <asp:SqlDataSource id="SqlDataSource_News" runat="server" __designer:wfdid="w295" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" DeleteCommand="News_DeleteNews" DeleteCommandType="StoredProcedure" OnUpdated="SqlDataSource_News_Updated" SelectCommand="News_GetAllNews" SelectCommandType="StoredProcedure" UpdateCommand="News_NewsUpdate" UpdateCommandType="StoredProcedure"><DeleteParameters>
<asp:Parameter Type="Int32" Name="ID"></asp:Parameter>
</DeleteParameters>
<UpdateParameters>
<asp:Parameter Type="Int32" Name="NewsID"></asp:Parameter>
<asp:ControlParameter PropertyName="Text" Type="String" Name="Title" ControlID="TextBox_Title"></asp:ControlParameter>
<asp:ControlParameter PropertyName="Text" Type="String" Name="Abstruct" ControlID="TextBox_Abstruct"></asp:ControlParameter>
<asp:Parameter Type="String" Name="Body"></asp:Parameter>
<asp:Parameter Type="String" Name="NewsImage"></asp:Parameter>
<asp:ControlParameter PropertyName="Checked" Type="Boolean" Name="CommentsEnabled" ControlID="CheckBox_EnabledComments"></asp:ControlParameter>
</UpdateParameters>
</asp:SqlDataSource> <asp:Button id="Button_Delete" onclick="Button_Delete_Click" runat="server" CssClass="Button" ValidationGroup="55" __designer:wfdid="w296" Text="حذف"></asp:Button> <asp:Button id="Button_Update" onclick="Button_Update_Click" runat="server" CssClass="Button" ValidationGroup="45645" __designer:wfdid="w297" Text="بروزرسانی"></asp:Button> </TD></TR></TBODY></TABLE>
</contenttemplate>
                            <triggers>
<asp:PostBackTrigger ControlID="Button_Delete"></asp:PostBackTrigger>
<asp:PostBackTrigger ControlID="Button_Update"></asp:PostBackTrigger>
<asp:PostBackTrigger ControlID="GridView_NewsList"></asp:PostBackTrigger>
</triggers>
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
    </div></div>
</asp:Content>

