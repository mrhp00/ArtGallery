<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="ManagmentArticleCategories.aspx.cs" Inherits="SiteAdmin_ManagmentArticleCategories" Title="Untitled Page" %>
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
                            مدیریت گروه مقالات</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD colSpan=2><asp:GridView id="GridView_Category" runat="server" OnSelectedIndexChanged="GridView_Category_SelectedIndexChanged" OnRowDataBound="GridView_Category_RowDataBound" GridLines="None" DataSourceID="SqlDataSource_Category" DataKeyNames="CategoryID" CssClass="datatable" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True">
                                        <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                            PageButtonCount="7" />
                                        <Columns>
                                            <asp:TemplateField SortExpression="ImageUrl">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle Height="75px" Width="75px" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label_Image" runat="server" Text='<%# Bind("ImageUrl") %>' Visible="False"></asp:Label>
                                                    <asp:Image ID="Image_Category" runat="server" Height="75px" ImageUrl='<%# Eval("ImageUrl", "~/CategoriesImage/{0}") %>'
                                                        Width="75px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title">
                                                <ItemStyle Width="20%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="AddedBy" HeaderText="توسط" SortExpression="AddedBy">
                                                <ItemStyle Width="20%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Description" HeaderText="توضیحات" SortExpression="Description">
                                                <ItemStyle Width="30%" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="تاریخ" SortExpression="AddedDate">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AddedDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle CssClass="Date" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="حذف" InsertVisible="False" SortExpression="CategoryID">
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox_Delete" runat="server" />
                                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("CategoryID") %>' Visible="False"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField SelectText="ویرایش" ShowSelectButton="True">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            </asp:CommandField>
                                        </Columns>
                                        <RowStyle CssClass="row" />
                                        <EmptyDataTemplate>
                                            تاکنون هیچ گروهی در سایت ثبت نشده است.
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="AliceBlue" />
                                        <PagerStyle CssClass="pager-row" />
                                        <HeaderStyle HorizontalAlign="Right" />
                                    </asp:GridView></TD></TR><TR><TD style="WIDTH: 20%">ایجاد شده توسط:</TD><TD><asp:Label id="Label_UserName" runat="server"></asp:Label></TD></TR><TR><TD style="WIDTH: 20%">تاریخ درج:</TD><TD><asp:Label id="Label_Date" runat="server"></asp:Label></TD></TR><TR><TD style="WIDTH: 20%">عنوان:</TD><TD><asp:TextBox id="TextBox_Title" runat="server" Width="50%" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ValidationGroup="1111" ErrorMessage="لطفا عنوان گروه مقاله را وارد نمایید" ControlToValidate="TextBox_Title">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="عنوان گروه مقاله را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Title" __designer:wfdid="w29" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="WIDTH: 20%">توضیحات:</TD><TD><asp:TextBox id="TextBox_Description" runat="server" Width="80%" Height="50px" CssClass="TextBox" TextMode="MultiLine"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="توضیحات گروه مقاله را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Description" __designer:wfdid="w30" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="WIDTH: 20%">تصویر:</TD><TD><asp:FileUpload id="FileUpload1" runat="server" Width="100%"></asp:FileUpload></TD></TR><TR><TD colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" ValidationGroup="1111"></asp:ValidationSummary> <asp:Label id="Label_FileName" runat="server" Visible="False"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" ForeColor="Blue"></asp:Label> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_Category" runat="server" UpdateCommandType="StoredProcedure" UpdateCommand="Articles_UpdateCategory" SelectCommandType="StoredProcedure" SelectCommand="Articles_GetCategories" OnUpdated="SqlDataSource_Category_Updated" DeleteCommandType="StoredProcedure" DeleteCommand="Articles_DeleteCategory" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="CategoryID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="CategoryID" Type="Int32" />
                                                        <asp:ControlParameter ControlID="TextBox_Title" Name="Title" PropertyName="Text"
                                                            Type="String" />
                                                        <asp:ControlParameter ControlID="TextBox_Description" Name="Description" PropertyName="Text"
                                                            Type="String" />
                                                        <asp:ControlParameter ControlID="FileUpload1" Name="ImageUrl" PropertyName="FileName"
                                                            Type="String" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Delete" __designer:wfdid="w31" ConfirmText="با حذف گروه کلیه مقاله های آن حذف میشوند،برای حذف گروه  های مقاله انتخابی مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender2" runat="server" TargetControlID="Button_Update" __designer:wfdid="w32" ConfirmText="برای بروز رسانی گروه های مقاله انتخابی مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:Button id="Button_Delete" onclick="Button_Delete_Click" runat="server" CssClass="Button" ValidationGroup="1110" Text="حذف"></asp:Button> <asp:Button id="Button_Update" onclick="Button_Update_Click" runat="server" CssClass="Button" ValidationGroup="1111" Text="بروزرسانی"></asp:Button></TD></TR></TBODY></TABLE>
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
    </div></div>
</asp:Content>

