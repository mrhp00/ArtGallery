<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="EnterNews.aspx.cs" Inherits="SiteAdmin_EnterNewsAndNotics" Title="Untitled Page" ValidateRequest="false"%>


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
                            ثبت اخبار </h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD style="WIDTH: 20%">تاریخ امروز:</TD><TD style="TEXT-ALIGN: right" class="Date"><asp:Label id="Label_Date" runat="server" __designer:wfdid="w106"></asp:Label> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="عنوان خبر را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Title" WatermarkCssClass="WaterMark" __designer:wfdid="w107"></Ajax:TextBoxWatermarkExtender> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="خلاصه خبر را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Abstruct" WatermarkCssClass="WaterMark" __designer:wfdid="w108"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD>عنوان:<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" __designer:wfdid="w109" ControlToValidate="TextBox_Title" ErrorMessage="لطفا عنوان خبر را وارد نمایید" ValidationGroup="1025">*</asp:RequiredFieldValidator></TD><TD style="COLOR: #000000"><asp:TextBox id="TextBox_Title" runat="server" Width="99%" __designer:wfdid="w110" CssClass="TextBox"></asp:TextBox></TD></TR><TR style="COLOR: #000000"><TD style="VERTICAL-ALIGN: top">خلاصه:<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" __designer:wfdid="w111" ControlToValidate="TextBox_Abstruct" ErrorMessage="لطفا خلاصه خبر را وارد نمایید" ValidationGroup="1025">*</asp:RequiredFieldValidator></TD><TD style="COLOR: #000000"><asp:TextBox id="TextBox_Abstruct" runat="server" Width="99%" Height="50px" __designer:wfdid="w112" CssClass="TextBox" TextMode="MultiLine"></asp:TextBox></TD></TR><TR style="COLOR: #000000"><TD style="VERTICAL-ALIGN: top">متن خبر:</TD><TD><Editor:FCKeditor id="FCKEditor_Body" UseBROnCarriageReturn="true" runat="server" Width="100%" __designer:wfdid="w113" BasePath="~/FCKeditor/" ToolbarSet="Basic">
                                    </Editor:FCKeditor> </TD></TR><TR><TD>فعال کردن نظرات:</TD><TD><asp:CheckBox id="CheckBox_EnabledComments" runat="server" __designer:wfdid="w114"></asp:CheckBox></TD></TR><TR><TD>عکس خبر:</TD><TD><asp:FileUpload id="FileUpload1" runat="server" Width="98%" __designer:wfdid="w115"></asp:FileUpload></TD></TR><TR><TD colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" __designer:wfdid="w116" ValidationGroup="1025"></asp:ValidationSummary> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" __designer:wfdid="w117" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_SaveNews" runat="server" __designer:wfdid="w118" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" DataSourceMode="DataReader" InsertCommand="News_InsertNews" InsertCommandType="StoredProcedure" OnInserted="SqlDataSource_SaveNews_Inserted"><InsertParameters>
<asp:ControlParameter PropertyName="Text" Type="String" Name="Title" ControlID="TextBox_Title"></asp:ControlParameter>
<asp:ControlParameter PropertyName="Text" Type="String" Name="Abstruct" ControlID="TextBox_Abstruct"></asp:ControlParameter>
<asp:Parameter Type="String" Name="Body"></asp:Parameter>
<asp:Parameter Type="String" Name="NewsImage"></asp:Parameter>
<asp:ControlParameter PropertyName="Checked" Type="Boolean" Name="CommentsEnabled" ControlID="CheckBox_EnabledComments"></asp:ControlParameter>
</InsertParameters>
</asp:SqlDataSource> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" __designer:wfdid="w119" ConfirmText="برای ثبت اطلاعات مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" __designer:wfdid="w120" ValidationGroup="1025" CssClass="Button" Text="ثبت"></asp:Button></TD></TR></TBODY></TABLE>
</contenttemplate>
                            <triggers>
<asp:PostBackTrigger ControlID="Button_Save"></asp:PostBackTrigger>
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
    </div>
    </div>
</asp:Content>

