<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="EnterTopic.aspx.cs" Inherits="EnterTopic" Title="Untitled Page" ValidateRequest="false"%>
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
            <TABLE style="BORDER-RIGHT: #0b198c 1px solid; BORDER-TOP: #0b198c 1px solid; BORDER-LEFT: #0b198c 1px solid; WIDTH: 100%; BORDER-BOTTOM: #0b198c 1px solid" class="Col2"><TBODY><TR><TD style="PADDING-RIGHT: 10px; FONT-WEIGHT: bold; COLOR: #ffffff; HEIGHT: 30px; BACKGROUND-COLOR: #5c7099" colSpan=2>ایجاد موضوع جدید</TD></TR><TR><TD style="WIDTH: 20%">عنوان تاپیک:</TD><TD><asp:TextBox id="TextBox_Title" runat="server" Width="80%" CssClass="TextBox" __designer:wfdid="w61"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Title" ErrorMessage="لطفا عنوان تاپیک را وارد نمایید" ValidationGroup="1230" __designer:wfdid="w62">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="عنوان تاپیک را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Title" WatermarkCssClass="WaterMark" __designer:wfdid="w63"></Ajax:TextBoxWatermarkExtender></TD></TR><TR style="COLOR: #000000"><TD style="WIDTH: 20%">نام کاربری:</TD><TD><asp:Label id="Label_UserName" runat="server" __designer:wfdid="w64"></asp:Label></TD></TR><TR><TD style="WIDTH: 20%">تاریخ امروز:</TD><TD><asp:Label id="Label_Date" runat="server" __designer:wfdid="w65"></asp:Label></TD></TR><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">متن تاپیک:</TD><TD><Editor:FCKeditor id="FCKeditor_Message" runat="server" __designer:wfdid="w66" UseBROnCarriageReturn="true" BasePath="~/FCKeditor/" ToolbarSet="Basic">
                                    </Editor:FCKeditor> </TD></TR><TR><TD colSpan=2></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" __designer:wfdid="w67" ForeColor="Blue"></asp:Label> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_TopicSave" runat="server" __designer:wfdid="w68" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" InsertCommand="Forums_InsertTopics" InsertCommandType="StoredProcedure" OnInserted="SqlDataSource_TopicSave_Inserted">
                                        <InsertParameters>
                                            <asp:SessionParameter DefaultValue="" Name="ForumID" SessionField="FID" Type="Int32" />
                                            <asp:ControlParameter ControlID="TextBox_Title" DefaultValue="test" Name="Subject"
                                                PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="Label_UserName" DefaultValue="" Name="UserID" PropertyName="Text"
                                                Type="String" />
                                            <asp:Parameter Name="UserIP" Type="String" />
                                            <asp:Parameter Name="Message" Type="String" />
                                        </InsertParameters>
                                    </asp:SqlDataSource> <asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" CssClass="Button" ValidationGroup="1230" __designer:wfdid="w69" Text="ثبت"></asp:Button> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" __designer:wfdid="w70" ConfirmText="برای ثبت تاپیک مطمئن هستید؟"></Ajax:ConfirmButtonExtender></TD></TR></TBODY></TABLE>
</contenttemplate>
        <triggers>
<asp:PostBackTrigger ControlID="Button_Save"></asp:PostBackTrigger>
</triggers>
    </asp:UpdatePanel></div>
</asp:Content>

