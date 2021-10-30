<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="ManagmentForums.aspx.cs" Inherits="SiteAdmin_ManagmentForums" Title="Untitled Page" %>
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
                            مدیریت انجمن</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">نام تالار:</TD><TD><asp:DropDownList id="DropDownList_Category" runat="server" Width="80%" OnSelectedIndexChanged="DropDownList_Category_SelectedIndexChanged" DataValueField="CategoryID" DataTextField="CategoryName" DataSourceID="SqlDataSource_CategoryList" CssClass="DropDownList" AutoPostBack="True" __designer:wfdid="w540">
                                                </asp:DropDownList> <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" __designer:wfdid="w541" ValidationGroup="1452" ErrorMessage="لطفا تالار را وارد نمایید" ControlToValidate="DropDownList_Category">*</asp:RequiredFieldValidator></TD></TR><TR style="COLOR: #000000"><TD style="VERTICAL-ALIGN: top" colSpan=2><asp:GridView style="MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px" id="GridView_ForumList" runat="server" OnSelectedIndexChanged="GridView_ForumList_SelectedIndexChanged" DataSourceID="SqlDataSource_Forums" CssClass="datatable" __designer:wfdid="w542" GridLines="None" AutoGenerateColumns="False">
                                                    <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                                        PageButtonCount="7" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="ردیف">
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ForumID" HeaderText="ForumID" InsertVisible="False" ReadOnly="True"
                                                            SortExpression="ForumID" Visible="False" />
                                                        <asp:TemplateField HeaderText="نام انجمن" SortExpression="ForumName">
                                                            <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="80%" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label_Name" runat="server" Font-Bold="True" Text='<%# Eval("ForumName") %>'></asp:Label><br />
                                                                <asp:Label ID="Label_Description" runat="server" ForeColor="InactiveCaption" Text='<%# Eval("ForumDescription") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="حذف">
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="CheckBox_Delete" runat="server" />
                                                                <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("ForumID") %>' Visible="False"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:CommandField SelectText="ویرایش" ShowSelectButton="True">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                    <RowStyle CssClass="row" />
                                                    <EmptyDataTemplate>
                                                        در این تالار تاکنون انجمنی ثبت نشده است&nbsp;
                                                    </EmptyDataTemplate>
                                                    <SelectedRowStyle BackColor="AliceBlue" />
                                                    <PagerStyle CssClass="pager-row" />
                                                </asp:GridView> </TD></TR><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">نام تالار:</TD><TD><asp:DropDownList id="DropDownList_CategoryUpdate" runat="server" Width="80%" DataValueField="CategoryID" DataTextField="CategoryName" DataSourceID="SqlDataSource_CategoryList" CssClass="DropDownList" __designer:wfdid="w543">
                                                </asp:DropDownList> <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" __designer:wfdid="w544" ValidationGroup="1452" ErrorMessage="لطفا تالار را را وارد نمایید" ControlToValidate="DropDownList_CategoryUpdate">*</asp:RequiredFieldValidator> <asp:SqlDataSource id="SqlDataSource_Forums" runat="server" __designer:wfdid="w545" UpdateCommandType="StoredProcedure" UpdateCommand="Forums_UpdateForums" SelectCommandType="StoredProcedure" SelectCommand="Forums_ForumsList" OnUpdated="SqlDataSource_Forums_Updated" DeleteCommandType="StoredProcedure" DeleteCommand="Forums_DeleteForumByID" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="ForumID" Type="Int32" />
                                                    </DeleteParameters>
                                                    <UpdateParameters>
                                                        <asp:ControlParameter ControlID="DropDownList_CategoryUpdate" Name="CategoryID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                        <asp:ControlParameter ControlID="TextBox_Name" Name="ForumName" PropertyName="Text"
                                                            Type="String" />
                                                        <asp:ControlParameter ControlID="TextBox_Description" Name="ForumDescription" PropertyName="Text"
                                                            Type="String" />
                                                        <asp:ControlParameter ControlID="TextBox_Position" Name="ForumPosition" PropertyName="Text"
                                                            Type="Int32" />
                                                        <asp:Parameter Name="ForumID" Type="Int32" />
                                                    </UpdateParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="DropDownList_Category" Name="CategoryID" PropertyName="SelectedValue"
                                                            Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource> <asp:SqlDataSource id="SqlDataSource_CategoryList" runat="server" __designer:wfdid="w546" SelectCommandType="StoredProcedure" SelectCommand="Forums_CategoriesList" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"></asp:SqlDataSource> </TD></TR><TR><TD style="WIDTH: 20%">نام انجمن:</TD><TD><asp:TextBox id="TextBox_Name" runat="server" Width="80%" CssClass="TextBox" __designer:wfdid="w547"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" __designer:wfdid="w548" ValidationGroup="1452" ErrorMessage="لطفا نام انجمن را وارد نمایید" ControlToValidate="TextBox_Name">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="نام انجمن را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Name" __designer:wfdid="w33" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="توضیحات انجمن را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Description" __designer:wfdid="w34" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">توضیحات:</TD><TD><asp:TextBox id="TextBox_Description" runat="server" Width="98%" Height="59px" CssClass="TextBox" __designer:wfdid="w549" TextMode="MultiLine"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 20%">اولویت نمایش:</TD><TD><asp:TextBox id="TextBox_Position" runat="server" Width="10%" CssClass="TextBox" __designer:wfdid="w550"></asp:TextBox><asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" __designer:wfdid="w551" ValidationGroup="1452" ErrorMessage="لطفا اولویت نمایش گروه را وارد نمایید" ControlToValidate="TextBox_Position">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" __designer:wfdid="w552" ValidationGroup="1452" ErrorMessage="لطفا اولویت نمایش را به صورت عددی صحیح وارد نمایید" ControlToValidate="TextBox_Position" ValidationExpression="\d{1,5}">*</asp:RegularExpressionValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender3" watermarkText="اولویت نمایش را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Position" __designer:wfdid="w35" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" __designer:wfdid="w553" ValidationGroup="1452"></asp:ValidationSummary> &nbsp; </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Delete" __designer:wfdid="w36" ConfirmText="با حذف این انجمن کلیه موضوعات و پاسخ های موجود حذف می شوند، برای حذف انجمن های انتخابی مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender2" runat="server" TargetControlID="Button_Update" __designer:wfdid="w37" ConfirmText="برای بروز رسانی انجمن انتخابی مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:Label id="Label_Message" runat="server" __designer:wfdid="w554" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Button id="Button_Delete" onclick="Button_Delete_Click" runat="server" CssClass="Button" __designer:wfdid="w555" ValidationGroup="654" Text="حذف"></asp:Button> <asp:Button id="Button_Update" onclick="Button_Update_Click" runat="server" CssClass="Button" __designer:wfdid="w556" ValidationGroup="1452" Text="بروزرسانی"></asp:Button></TD></TR></TBODY></TABLE>
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

