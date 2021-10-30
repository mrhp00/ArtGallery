<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="EnterForums.aspx.cs" Inherits="SiteAdmin_EnterForums" Title="Untitled Page" %>
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
                            ثبت انجمن</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%" cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD><asp:SqlDataSource id="SqlDataSource_Forums" runat="server" SelectCommandType="StoredProcedure" SelectCommand="Forums_ForumsList" OnInserted="SqlDataSource_Forums_Inserted" InsertCommandType="StoredProcedure" InsertCommand="Forums_InsertForums" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList_Category" Name="CategoryID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                        </SelectParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="DropDownList_Category" Name="CategoryID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="TextBox_Name" Name="ForumName" PropertyName="Text"
                                                Type="String" />
                                            <asp:ControlParameter ControlID="TextBox_Description" Name="ForumDescription" PropertyName="Text"
                                                Type="String" />
                                            <asp:ControlParameter ControlID="TextBox_Position" Name="ForumPosition" PropertyName="Text"
                                                Type="Int32" />
                                        </InsertParameters>
                                    </asp:SqlDataSource> <asp:GridView id="GridView_ForumList" runat="server" GridLines="None" DataSourceID="SqlDataSource_Forums" CssClass="datatable" AutoGenerateColumns="False">
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
                                            <asp:BoundField DataField="ForumID" HeaderText="ForumID" InsertVisible="False" ReadOnly="True"
                                                SortExpression="ForumID" Visible="False" />
                                            <asp:TemplateField HeaderText="نام انجمن" SortExpression="ForumName">
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="90%" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label_Name" runat="server" Font-Bold="True" Text='<%# Eval("ForumName") %>'></asp:Label><br />
                                                    <asp:Label ID="Label_Description" runat="server" ForeColor="InactiveCaption" Text='<%# Eval("ForumDescription") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="row" />
                                        <EmptyDataTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="در تالار انتخابی تاکنون انجمنی ثبت نشده است. "
                                                Width="100%"></asp:Label>
                                        </EmptyDataTemplate>
                                        <PagerStyle CssClass="pager-row" />
                                    </asp:GridView> </TD></TR><TR><TD><TABLE style="WIDTH: 100%"><TBODY><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">نام تالار:</TD><TD><asp:DropDownList id="DropDownList_Category" runat="server" Width="80%" DataSourceID="SqlDataSource_CategoryList" CssClass="DropDownList" DataValueField="CategoryID" DataTextField="CategoryName" AutoPostBack="True">
                                                </asp:DropDownList><asp:SqlDataSource id="SqlDataSource_CategoryList" runat="server" SelectCommandType="StoredProcedure" SelectCommand="Forums_CategoriesList" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"></asp:SqlDataSource> <asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ValidationGroup="1452" ErrorMessage="لطفا نام تالار را وارد نمایید" ControlToValidate="DropDownList_Category">*</asp:RequiredFieldValidator></TD></TR><TR><TD style="WIDTH: 20%">نام انجمن:</TD><TD><asp:TextBox id="TextBox_Name" runat="server" Width="80%" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ValidationGroup="1452" ErrorMessage="لطفا نام انجمن را وارد نمایید" ControlToValidate="TextBox_Name">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="نام انجمن را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Name" WatermarkCssClass="WaterMark" __designer:wfdid="w14"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">توضیحات:</TD><TD><asp:TextBox id="TextBox_Description" runat="server" Width="98%" Height="59px" CssClass="TextBox" TextMode="MultiLine"></asp:TextBox> </TD></TR><TR><TD style="WIDTH: 20%">اولویت نمایش:</TD><TD><asp:TextBox id="TextBox_Position" runat="server" Width="10%" CssClass="TextBox"></asp:TextBox><asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ValidationGroup="1452" ErrorMessage="لطفا اولویت نمایش گروه را وارد نمایید" ControlToValidate="TextBox_Position">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ValidationGroup="1452" ErrorMessage="لطفا اولویت نمایش را به صورت عددی صحیح وارد نمایید" ControlToValidate="TextBox_Position" ValidationExpression="\d{1,5}">*</asp:RegularExpressionValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="توضیحات انجمن را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Description" WatermarkCssClass="WaterMark" __designer:wfdid="w15"></Ajax:TextBoxWatermarkExtender> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender3" watermarkText="اولویت نمایش را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Position" WatermarkCssClass="WaterMark" __designer:wfdid="w16"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" ValidationGroup="1452"></asp:ValidationSummary></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" CssClass="Button" ValidationGroup="1452" Text="ثبت"></asp:Button>&nbsp; <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" __designer:wfdid="w16" ConfirmText="آیا برای ثبت اطلاعات انجمن مورد نظرمطمئن هستید؟"></Ajax:ConfirmButtonExtender></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</contenttemplate>
                        </asp:UpdatePanel>&nbsp;</div>
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

