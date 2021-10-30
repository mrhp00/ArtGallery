<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="ChangeProfile.aspx.cs" Inherits="Users_ChangeProfile" Title="Untitled Page" ValidateRequest="false"%>
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
    
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<TABLE style="BORDER-RIGHT: #333399 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #333399 1px solid; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; BORDER-LEFT: #333399 1px solid; WIDTH: 100%; PADDING-TOP: 5px; BORDER-BOTTOM: #333399 1px solid" cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD style="PADDING-RIGHT: 10px; FONT-WEIGHT: bold; COLOR: #ffffff; HEIGHT: 25px; BACKGROUND-COLOR: #869bbf" colSpan=2>ثبت مشخصات</TD></TR><TR><TD style="WIDTH: 20%" class="Col2">نام کاربری:</TD><TD class="Col1"><asp:Label id="Label_UserName" runat="server" __designer:wfdid="w32"></asp:Label></TD></TR><TR><TD class="Col2">آدرس وب سایت:</TD><TD style="DIRECTION: rtl" class="Col1"><asp:TextBox id="TextBox_Website" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w33"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="ـدرس وب سایت خود را اینجاوارد نمایید" runat="server" TargetControlID="TextBox_Website" __designer:wfdid="w34" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender> <asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" __designer:wfdid="w35" ValidationGroup="1458" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?" ErrorMessage="لطفا ادرس وب سایت را صحیح وارد نمایید" ControlToValidate="TextBox_Website">*</asp:RegularExpressionValidator></TD></TR><TR style="COLOR: #000000"><TD class="Col2">سال تولد:</TD><TD class="Col1"><asp:TextBox id="TextBox_BirthYear" runat="server" Width="6%" CssClass="TextBox" __designer:wfdid="w36"></asp:TextBox> <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" __designer:wfdid="w37" ValidationGroup="1458" ValidationExpression="\d{4}" ErrorMessage="لطفا سال تولد را به صورت عددی چهار رقمی وارد نمایید" ControlToValidate="TextBox_BirthYear">*</asp:RegularExpressionValidator></TD></TR><TR><TD class="Col2">محل سکونت:</TD><TD class="Col1"><asp:TextBox id="TextBox_Sokonat" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w38"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="محل سکونت خود را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Sokonat" __designer:wfdid="w39" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD class="Col2">آیدی یاهو:</TD><TD style="DIRECTION: rtl" class="Col1"><asp:TextBox id="TextBox_YahooID" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w40"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender3" watermarkText="آیدی یاهو خود را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_YahooID" __designer:wfdid="w41" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD class="Col2">ICQ:</TD><TD style="DIRECTION: rtl" class="Col1"><asp:TextBox id="TextBox_ICQ" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w42"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender4" watermarkText="ایدی ICQ خود رااینجا وارد نمایید" runat="server" TargetControlID="TextBox_ICQ" __designer:wfdid="w43" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD class="Col2">هاتمیل:</TD><TD style="DIRECTION: rtl" class="Col1"><asp:TextBox id="TextBox_HotmailID" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w44"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender5" watermarkText="آیدی hotmail خود را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_HotmailID" __designer:wfdid="w45" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD class="Col2">AIM:</TD><TD style="DIRECTION: rtl" class="Col1"><asp:TextBox id="TextBox_AIM" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w46"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender6" watermarkText="آیدی AIM خود را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_AIM" __designer:wfdid="w47" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD class="Col2">SkypeName:</TD><TD style="DIRECTION: rtl" class="Col1"><asp:TextBox id="TextBox_SkypeName" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w48"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender7" watermarkText="آیدی Skype خود را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_SkypeName" __designer:wfdid="w49" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD class="Col2">MSN:</TD><TD style="DIRECTION: rtl" class="Col1"><asp:TextBox id="TextBox_MSN" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w50"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender8" watermarkText="آیدی MSN خود را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_MSN" __designer:wfdid="w51" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD class="Col2">ایمیل:</TD><TD style="DIRECTION: rtl" class="Col1"><asp:TextBox id="TextBox_Email" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w52"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" __designer:wfdid="w53" ValidationGroup="1458" ErrorMessage="لطفا آدرس ایمیل را وارد نمایید" ControlToValidate="TextBox_Email">*</asp:RequiredFieldValidator> <asp:RegularExpressionValidator id="RegularExpressionValidator3" runat="server" __designer:wfdid="w54" ValidationGroup="1458" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBox_Email">*</asp:RegularExpressionValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender9" watermarkText="آدرس ایمیل را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Email" __designer:wfdid="w55" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD class="Col2">سوال امنیتی:</TD><TD style="DIRECTION: rtl" class="Col1"><asp:Label id="Label_Qustion" runat="server" __designer:wfdid="w56"></asp:Label></TD></TR><TR><TD class="Col2">امضا شما:</TD><TD class="Col1"><Editor:FCKeditor id="FCKEditor_Signature" UseBROnCarriageReturn="true" runat="server" Width="100%" Height="100px" __designer:wfdid="w57" ToolbarSet="Basic" BasePath="~/FCKeditor/">
                </Editor:FCKeditor> </TD></TR><TR><TD class="Col2" colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" __designer:wfdid="w58" ValidationGroup="1458"></asp:ValidationSummary></TD></TR><TR><TD style="TEXT-ALIGN: center" class="Col2" colSpan=2><asp:Label id="Label_Message" runat="server" __designer:wfdid="w59" ForeColor="Blue"></asp:Label></TD></TR><TR><TD class="Col2"></TD><TD style="TEXT-ALIGN: center" class="Col1"><asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" CssClass="Button" __designer:wfdid="w60" ValidationGroup="1458" Text="ثبت"></asp:Button></TD></TR></TBODY></TABLE>
</ContentTemplate>
        <triggers>
<asp:PostBackTrigger ControlID="Button_Save"></asp:PostBackTrigger>
</triggers>
    </asp:UpdatePanel>
    </div>
</asp:Content>

