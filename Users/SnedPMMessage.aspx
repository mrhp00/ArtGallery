<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="SnedPMMessage.aspx.cs" Inherits="Users_SnedPMMessage" Title="Untitled Page" ValidateRequest="false"%>
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
<TABLE style="BORDER-RIGHT: #0b198c 1px solid; BORDER-TOP: #0b198c 1px solid; BORDER-LEFT: #0b198c 1px solid; WIDTH: 100%; BORDER-BOTTOM: #0b198c 1px solid" class="Col2"><TBODY><TR><TD style="PADDING-RIGHT: 10px; FONT-WEIGHT: bold; COLOR: #ffffff; HEIGHT: 30px; BACKGROUND-COLOR: #5c7099" colSpan=2>ارسال پیغام خصوصی</TD></TR><TR><TD style="WIDTH: 20%">فرستنده:</TD><TD><asp:Label id="Label_Sender" runat="server" __designer:wfdid="w13" ForeColor="Blue"></asp:Label></TD></TR><TR style="COLOR: #000000"><TD>گیرنده:</TD><TD><asp:Label id="Label_Reciver" runat="server" __designer:wfdid="w14"></asp:Label></TD></TR><TR><TD>تاریخ:</TD><TD><asp:Label id="Label_Date" runat="server" __designer:wfdid="w15"></asp:Label> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="عنوان پیغام را اینجاوارد نمایید" runat="server" TargetControlID="TextBox_Subject" __designer:wfdid="w16" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD>عنوان:</TD><TD><asp:TextBox id="TextBox_Subject" runat="server" Width="80%" __designer:wfdid="w17" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" __designer:wfdid="w18" ControlToValidate="TextBox_Subject" ErrorMessage="*" ValidationGroup="11225"></asp:RequiredFieldValidator></TD></TR><TR><TD style="VERTICAL-ALIGN: top">متن:</TD><TD><Editor:FCKeditor id="FCKeditor_Message" runat="server" __designer:wfdid="w19" BasePath="~/FCKeditor/" ToolbarSet="Basic" UseBROnCarriageReturn="true">
                                    </Editor:FCKeditor> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_Message" runat="server" __designer:wfdid="w20" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" InsertCommand="Forums_PMMessageInsert" InsertCommandType="StoredProcedure" OnInserted="SqlDataSource_Message_Inserted">
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="Label_Sender" Name="Sender" PropertyName="Text"
                                                Type="String" />
                                            <asp:ControlParameter ControlID="Label_Reciver" Name="Reciver" PropertyName="Text"
                                                Type="String" />
                                            <asp:Parameter Name="Message" Type="String" />
                                            <asp:ControlParameter ControlID="TextBox_Subject" Name="Subject" PropertyName="Text"
                                                Type="String" />
                                        </InsertParameters>
                                    </asp:SqlDataSource> <asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" __designer:wfdid="w21" CssClass="Button" ValidationGroup="11225" Text="ارسال"></asp:Button> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" __designer:wfdid="w22" ConfirmText="برای ارسال پیغام مطمئن هستید؟"></Ajax:ConfirmButtonExtender></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" __designer:wfdid="w23" ForeColor="Blue"></asp:Label></TD></TR></TBODY></TABLE>
</contenttemplate>
        <triggers>
<asp:PostBackTrigger ControlID="Button_Save"></asp:PostBackTrigger>
</triggers>
    </asp:UpdatePanel>
    </div>
</asp:Content>

