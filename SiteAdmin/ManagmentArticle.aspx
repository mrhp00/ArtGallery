<%@ Page Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="ManagmentArticle.aspx.cs" Inherits="SiteAdmin_ManagmentArticle" Title="Untitled Page" ValidateRequest="false" EnableViewState="false"%>
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
                            مدیریت مقالات</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD style="WIDTH: 20%">گروه:</TD><TD><asp:DropDownList id="DropDownList_Category" runat="server" Width="270px" __designer:wfdid="w50" OnSelectedIndexChanged="DropDownList_Category_SelectedIndexChanged" DataValueField="CategoryID" DataTextField="Title" DataSourceID="SqlDataSource_ArticleCategory" CssClass="DropDownList" AutoPostBack="True"></asp:DropDownList> <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" __designer:wfdid="w51" ValidationGroup="1250" ErrorMessage="لطفا گروه مقاله را وارد کنید" ControlToValidate="DropDownList_Category">*</asp:RequiredFieldValidator></TD></TR><TR style="COLOR: #000000"><TD colSpan=2><asp:GridView style="MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px" id="GridView_ArticleList" runat="server" __designer:wfdid="w52" OnSelectedIndexChanged="GridView_ArticleList_SelectedIndexChanged" DataSourceID="SqlDataSource_Article" CssClass="datatable" GridLines="None" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True">
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
                                            <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title">
                                                <ItemStyle Width="20%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="AddedBy" HeaderText="نویسنده" SortExpression="AddedBy">
                                                <ItemStyle Width="20%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Abstract" HeaderText="چکیده" SortExpression="Abstract"
                                                Visible="False">
                                                <ItemStyle Width="20%" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="تاریخ" SortExpression="AddedDate">
                                                <EditItemTemplate>
                                                </EditItemTemplate>
                                                <ItemStyle CssClass="Date" HorizontalAlign="Center" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true)  %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ViewCount" HeaderText=" بازدید" SortExpression="ViewCount">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="حذف">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("ArticleID") %>' Visible="False"></asp:Label>
                                                    <asp:CheckBox ID="CheckBox_Delete" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField SelectText="ویرایش" ShowSelectButton="True">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            </asp:CommandField>
                                        </Columns>
                                        <RowStyle CssClass="row" HorizontalAlign="Right" />
                                        <EmptyDataTemplate>
                                            &nbsp;در گروه انتخابی تاکنون مقاله ای ثبت نشده است.
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="AliceBlue" />
                                        <PagerStyle CssClass="pager-row" />
                                        <HeaderStyle HorizontalAlign="Right" />
                                    </asp:GridView> </TD></TR><TR><TD style="WIDTH: 20%">عنوان:</TD><TD><asp:TextBox id="TextBox_Title" runat="server" Width="70%" __designer:wfdid="w53" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" __designer:wfdid="w54" ValidationGroup="1250" ErrorMessage="لطفا عنوان مقاله را وارد کنید" ControlToValidate="TextBox_Title">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="عنوان مقاله را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Title" __designer:wfdid="w55" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="چکیده مقاله را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Abstruct" __designer:wfdid="w56" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">چکیده:<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" __designer:wfdid="w57" ValidationGroup="1250" ErrorMessage="لطفا چکیده مقاله را وارد کنید" ControlToValidate="TextBox_Abstruct">*</asp:RequiredFieldValidator></TD><TD><asp:TextBox id="TextBox_Abstruct" runat="server" Width="98%" Height="100px" __designer:wfdid="w58" CssClass="TextBox" TextMode="MultiLine"></asp:TextBox></TD></TR><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">متن مقاله:</TD><TD><Editor:FCKeditor id="FCKeditor_Body" runat="server" __designer:wfdid="w59" ToolbarSet="Basic" BasePath="~/FCKeditor/" UseBROnCarriageReturn="true">
                                    </Editor:FCKeditor> </TD></TR><TR><TD style="WIDTH: 20%">نویسنده:</TD><TD><asp:TextBox id="TextBox_UserName" runat="server" Width="50%" __designer:wfdid="w60" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" __designer:wfdid="w61" ValidationGroup="1250" ErrorMessage="لطفا نام نویسنده را وارد نمایید" ControlToValidate="TextBox_UserName">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender3" watermarkText="نام نویسنده را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_UserName" __designer:wfdid="w62" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="WIDTH: 20%">تاریخ:</TD><TD><asp:Label id="Label_Date" runat="server" __designer:wfdid="w63"></asp:Label></TD></TR><TR><TD style="WIDTH: 20%">گره مقاله:</TD><TD><asp:DropDownList id="DropDownList_CategoryUpdate" runat="server" Width="270px" __designer:wfdid="w64" DataValueField="CategoryID" DataTextField="Title" DataSourceID="SqlDataSource_ArticleCategory" CssClass="DropDownList">
                                    </asp:DropDownList> <asp:RequiredFieldValidator id="RequiredFieldValidator5" runat="server" __designer:wfdid="w65" ValidationGroup="1250" ErrorMessage="لطفا گروه مقاله را وارد کنید" ControlToValidate="DropDownList_CategoryUpdate">*</asp:RequiredFieldValidator></TD></TR><TR><TD style="WIDTH: 20%">فعال سازی نظرات:</TD><TD><asp:CheckBox id="CheckBox_CommentsEnabled" runat="server" __designer:wfdid="w66"></asp:CheckBox> </TD></TR><TR><TD style="WIDTH: 20%">نمایش برای اعضا:</TD><TD><asp:CheckBox id="CheckBox_OnlyForMembers" runat="server" __designer:wfdid="w67"></asp:CheckBox></TD></TR><TR><TD colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" __designer:wfdid="w68" ValidationGroup="1250"></asp:ValidationSummary> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" __designer:wfdid="w69" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_ArticleCategory" runat="server" __designer:wfdid="w70" SelectCommandType="StoredProcedure" SelectCommand="Articles_GetCategories" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"></asp:SqlDataSource> <asp:SqlDataSource id="SqlDataSource_Article" runat="server" __designer:wfdid="w71" SelectCommandType="StoredProcedure" SelectCommand="Articles_GetArticlesByCategories" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" OnUpdated="SqlDataSource_Article_Updated" UpdateCommandType="StoredProcedure" UpdateCommand="Articles_UpdateArticle" DeleteCommandType="StoredProcedure" DeleteCommand="Articles_DeleteArticle">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ArticleID" Type="Int32" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="ArticleID" Type="Int32" />
                                            <asp:ControlParameter ControlID="DropDownList_CategoryUpdate" Name="CategoryID" PropertyName="SelectedValue"
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
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList_Category" Name="CategoryID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Delete" __designer:wfdid="w72" ConfirmText="برای حذف مقالات انتخاب شده مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender2" runat="server" TargetControlID="Button_Update" __designer:wfdid="w73" ConfirmText="برای بروز رسانی مقاله مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:Button id="Button_Delete" onclick="Button_Delete_Click" runat="server" __designer:wfdid="w74" CssClass="Button" ValidationGroup="111" Text="حذف"></asp:Button> <asp:Button id="Button_Update" onclick="Button_Update_Click" runat="server" __designer:wfdid="w75" CssClass="Button" ValidationGroup="1250" Text="بروزرسانی"></asp:Button></TD></TR></TBODY></TABLE>
</contenttemplate>
                            <triggers>
<asp:PostBackTrigger ControlID="Button_Delete"></asp:PostBackTrigger>
<asp:PostBackTrigger ControlID="Button_Update"></asp:PostBackTrigger>
<asp:PostBackTrigger ControlID="GridView_ArticleList"></asp:PostBackTrigger>
<asp:PostBackTrigger ControlID="DropDownList_Category"></asp:PostBackTrigger>
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

