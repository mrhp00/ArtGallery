<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="EnterLink.aspx.cs" Inherits="EnterLink" Title="Untitled Page" %>
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
                            ثبت لینک ها</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD style="WIDTH: 20%">نام سایت:</TD><TD style="WIDTH: 80%"><asp:TextBox id="TextBox_Name" runat="server" Width="300px" ValidationGroup="12312" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ValidationGroup="12312" ControlToValidate="TextBox_Name" ErrorMessage="لطفا نام سایت را وارد نمایید">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="نام سایت را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Name" WatermarkCssClass="WaterMark" __designer:wfdid="w6"></Ajax:TextBoxWatermarkExtender></TD></TR><TR style="COLOR: #000000"><TD style="WIDTH: 20%">آدرس سایت:</TD><TD><asp:TextBox id="TextBox_Address" runat="server" Width="300px"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ValidationGroup="12312" ControlToValidate="TextBox_Address" ErrorMessage="لطفا آدرس سایت را وارد نمایید">*</asp:RequiredFieldValidator> <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ValidationGroup="12312" ControlToValidate="TextBox_Address" ErrorMessage="لطفا آدرس سایت را صحیح وارد نمایید" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?">*</asp:RegularExpressionValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="آدرس سایت را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Address" WatermarkCssClass="WaterMark" __designer:wfdid="w5"></Ajax:TextBoxWatermarkExtender> </TD></TR><TR><TD style="WIDTH: 100%" colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" ValidationGroup="12312"></asp:ValidationSummary> <asp:SqlDataSource id="SqlDataSource_Link" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" InsertCommand="Link_Insert" InsertCommandType="StoredProcedure" OnInserted="SqlDataSource_Link_Inserted" ProviderName="<%$ ConnectionStrings:LocalSqlServer1.ProviderName %>">
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="TextBox_Name" Name="Name" PropertyName="Text" Type="String" />
                                            <asp:ControlParameter ControlID="TextBox_Address" Name="Address" PropertyName="Text"
                                                Type="String" />
                                        </InsertParameters>
                                    </asp:SqlDataSource> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" ForeColor="Blue"></asp:Label> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" ValidationGroup="12312" CssClass="Button" Text="ثبت"></asp:Button> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" __designer:wfdid="w3" ConfirmText="برای ثبت لینک خود مطمئن هستید؟"></Ajax:ConfirmButtonExtender></TD></TR></TBODY></TABLE>
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

