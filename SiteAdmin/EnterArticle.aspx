<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="EnterArticle.aspx.cs" Inherits="SiteAdmin_AddArticle" Title="Untitled Page" ValidateRequest="false"%>
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
                            درج مقالات</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD style="WIDTH: 20%">گروه:</TD><TD><asp:DropDownList id="DropDownList_Category" runat="server" Width="270px" CssClass="DropDownList" DataSourceID="SqlDataSource_Article" DataTextField="Title" DataValueField="CategoryID" __designer:wfdid="w143">
                                    </asp:DropDownList> <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList_Category" ErrorMessage="لطفا گروه مقاله را وارد کنید" ValidationGroup="1250" __designer:wfdid="w144">*</asp:RequiredFieldValidator></TD></TR><TR style="COLOR: #000000"><TD style="WIDTH: 20%">عنوان:</TD><TD><asp:TextBox id="TextBox_Title" runat="server" Width="70%" CssClass="TextBox" __designer:wfdid="w145"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Title" ErrorMessage="لطفا عنوان مقاله را وارد کنید" ValidationGroup="1250" __designer:wfdid="w146">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="عنوان مقاله را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Title" WatermarkCssClass="WaterMark" __designer:wfdid="w147"></Ajax:TextBoxWatermarkExtender> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="چکیده مقاله را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Abstruct" WatermarkCssClass="WaterMark" __designer:wfdid="w148"></Ajax:TextBoxWatermarkExtender></TD></TR><TR style="COLOR: #000000"><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">چکیده:<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Abstruct" ErrorMessage="لطفا چکیده مقاله را وارد کنید" ValidationGroup="1250" __designer:wfdid="w149">*</asp:RequiredFieldValidator></TD><TD style="COLOR: #000000"><asp:TextBox id="TextBox_Abstruct" runat="server" Width="98%" Height="100px" CssClass="TextBox" __designer:wfdid="w150" TextMode="MultiLine"></asp:TextBox></TD></TR><TR style="COLOR: #000000"><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">متن مقاله:</TD><TD><Editor:FCKeditor id="FCKeditor_Body" runat="server" UseBROnCarriageReturn="true" __designer:wfdid="w151" BasePath="~/FCKeditor/" ToolbarSet="Basic">
                                    </Editor:FCKeditor> </TD></TR><TR><TD style="WIDTH: 20%">نویسنده:</TD><TD><asp:TextBox id="TextBox_UserName" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w152"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox_UserName" ErrorMessage="لطفا نام نویسنده را وارد نمایید" ValidationGroup="1250" __designer:wfdid="w153">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender3" watermarkText="نام نویسنده را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_UserName" WatermarkCssClass="WaterMark" __designer:wfdid="w154"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="WIDTH: 20%">تاریخ:</TD><TD><asp:Label id="Label_Date" runat="server" __designer:wfdid="w155" Text="Label"></asp:Label></TD></TR><TR><TD style="WIDTH: 20%">فعال سازی نظرات:</TD><TD><asp:CheckBox id="CheckBox_CommentsEnabled" runat="server" __designer:wfdid="w156" Checked="True"></asp:CheckBox> </TD></TR><TR><TD style="WIDTH: 20%">نمایش برای اعضا:</TD><TD><asp:CheckBox id="CheckBox_OnlyForMembers" runat="server" __designer:wfdid="w157"></asp:CheckBox></TD></TR><TR><TD colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" ValidationGroup="1250" __designer:wfdid="w158"></asp:ValidationSummary> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" __designer:wfdid="w159" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_Article" runat="server" __designer:wfdid="w160" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" InsertCommand="Articles_InsertArticle" InsertCommandType="StoredProcedure" OnInserted="SqlDataSource_Article_Inserted" SelectCommand="Articles_GetCategories" SelectCommandType="StoredProcedure">
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="TextBox_UserName" Name="AddedBy" PropertyName="Text"
                                                Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList_Category" Name="CategoryID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="TextBox_Title" Name="Title" PropertyName="Text"
                                                Type="String" />
                                            <asp:ControlParameter ControlID="TextBox_Abstruct" Name="Abstract" PropertyName="Text"
                                                Type="String" />
                                            <asp:Parameter Name="Body" Type="String" />
                                            <asp:ControlParameter ControlID="CheckBox_CommentsEnabled" Name="CommentsEnabled"
                                                PropertyName="Checked" Type="Boolean" />
                                            <asp:ControlParameter ControlID="CheckBox_OnlyForMembers" Name="OnlyForMembers" PropertyName="Checked"
                                                Type="Boolean" />
                                        </InsertParameters>
                                    </asp:SqlDataSource> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" __designer:wfdid="w161" ConfirmText="آیا برای ثبت اطلاعات انجمن مورد نظرمطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" CssClass="Button" ValidationGroup="1250" __designer:wfdid="w162" Text="ثبت مقاله"></asp:Button></TD></TR></TBODY></TABLE>
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
    </div></div>
</asp:Content>

