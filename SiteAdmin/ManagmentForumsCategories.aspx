<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="ManagmentForumsCategories.aspx.cs" Inherits="SiteAdmin_ManagmentForumsCategories" Title="Untitled Page" %>
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
                            مدیریت گروه های انجمن</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD colSpan=2><asp:GridView id="GridView_ForumCategoriesList" runat="server" OnSelectedIndexChanged="GridView_ForumCategoriesList_SelectedIndexChanged" GridLines="None" DataSourceID="SqlDataSource_ForumCategories" DataKeyNames="CategoryID" CssClass="datatable" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True">
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
                                            <asp:BoundField DataField="CategoryName" HeaderText="نام گروه" SortExpression="CategoryName">
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="80%" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="حذف">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox_Delete" runat="server" />
                                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("CategoryID") %>' Visible="False"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField SelectText="ویرایش" ShowSelectButton="True">
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                            </asp:CommandField>
                                        </Columns>
                                        <RowStyle CssClass="row" />
                                        <EmptyDataTemplate>
                                            آرشیو سایت خبر ثبت نشده است.
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="AliceBlue" />
                                        <PagerStyle CssClass="pager-row" />
                                    </asp:GridView></TD></TR><TR><TD style="WIDTH: 20%">نام گروه:</TD><TD><asp:TextBox id="TextBox_Name" runat="server" Width="80%" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ValidationGroup="1110" ErrorMessage="لطفا نام گروه را وارد نمایید" ControlToValidate="TextBox_Name">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="نام تالار را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Name" __designer:wfdid="w38" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="WIDTH: 20%">اولویت نمایش:</TD><TD><asp:TextBox id="TextBox_Position" runat="server" Width="10%" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ValidationGroup="1110" ErrorMessage="لطفا اولویت نمایش گروه را وارد نمایید" ControlToValidate="TextBox_Position">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ValidationGroup="1110" ErrorMessage="لطفا اولویت نمایش را به صورت عددی صحیح وارد نمایید" ControlToValidate="TextBox_Position" ValidationExpression="\d{1,5}">*</asp:RegularExpressionValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="اولویت نمایش را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Position" __designer:wfdid="w39" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" ValidationGroup="1110"></asp:ValidationSummary> </TD></TR><TR><TD style="HEIGHT: 16px; TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Delete" __designer:wfdid="w40" ConfirmText="با حذف تالار کلیه انجمن های موجود آن حذف می شوند، برای حذف تالار های انتخابی مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender2" runat="server" TargetControlID="Button_Update" __designer:wfdid="w41" ConfirmText="برای بروز رسانی تالار انتخابی مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:SqlDataSource id="SqlDataSource_ForumCategories" runat="server" UpdateCommandType="StoredProcedure" UpdateCommand="Forums_UpdateCategories" SelectCommandType="StoredProcedure" SelectCommand="Forums_CategoriesList" OnUpdated="SqlDataSource_ForumCategories_Updated" InsertCommandType="StoredProcedure" DeleteCommandType="StoredProcedure" DeleteCommand="Forums_DeleteCategoriesByID" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>">
        <DeleteParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:ControlParameter ControlID="TextBox_Name" Name="CategoryName" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="TextBox_Position" Name="CategoryPosition" PropertyName="Text"
                Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource> <asp:Button id="Button_Delete" onclick="Button_Delete_Click" runat="server" CssClass="Button" ValidationGroup="1111" Text="حذف"></asp:Button> <asp:Button id="Button_Update" onclick="Button_Update_Click" runat="server" CssClass="Button" ValidationGroup="1110" Text="بروزرسانی"></asp:Button></TD></TR></TBODY></TABLE>
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

