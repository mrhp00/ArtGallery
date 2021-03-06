<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="ManagmentQuastionsPolls.aspx.cs" Inherits="SiteAdmin_ManagmentQuastionsPolls" Title="Untitled Page" %>
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
                            مدیریت سوالات نظر سنجی</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD style="VERTICAL-ALIGN: top" colSpan=2><asp:GridView style="MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px" id="GridView_QuastionsPollList" runat="server" OnSelectedIndexChanged="GridView_QuastionsPollList_SelectedIndexChanged" GridLines="None" DataSourceID="SqlDataSource_PollsQuastions" DataKeyNames="QuestionID" CssClass="datatable" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True">
                                        <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                            PageButtonCount="7" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ردیف">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="QuestionText" HeaderText="سوال نظر سنجی" SortExpression="QuestionText">
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="70%" />
                                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="تاریخ " SortExpression="AddedDate">
                                                <ItemStyle CssClass="Date" HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="حذف">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("QuestionID") %>' Visible="False"></asp:Label>
                                                    <asp:CheckBox ID="CheckBox_Delete" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CommandField SelectText="ویرایش" ShowSelectButton="True">
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                            </asp:CommandField>
                                        </Columns>
                                        <RowStyle CssClass="row" />
                                        <EmptyDataTemplate>
                                            <asp:Label ID="Label3" runat="server" Text="تاکنون هیچگونه نظر سنجی در سایت ثبت نشده است."
                                                Width="100%"></asp:Label>
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="AliceBlue" />
                                        <PagerStyle CssClass="pager-row" />
                                    </asp:GridView> </TD></TR><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">تاریخ درج:</TD><TD style="HEIGHT: 16px"><asp:Label id="Label_Date" runat="server"></asp:Label></TD></TR><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">متن نظر سنجی:<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ValidationGroup="1222" ErrorMessage="لطفا متن نظر سنجی را وارد نمایید" ControlToValidate="TextBox_Quastions">*</asp:RequiredFieldValidator></TD><TD><asp:TextBox id="TextBox_Quastions" runat="server" Width="99%" Height="53px" CssClass="TextBox" TextMode="MultiLine"></asp:TextBox></TD></TR><TR><TD style="WIDTH: 20%">آرشیو شود:</TD><TD><asp:CheckBox id="CheckBox_IsArchived" runat="server"></asp:CheckBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="متن نظر سنجی را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Quastions" __designer:wfdid="w44" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="WIDTH: 20%">نظر سنجی فعال:</TD><TD><asp:CheckBox id="CheckBox_IsCurrentPolls" runat="server"></asp:CheckBox></TD></TR><TR><TD colSpan=2><asp:ValidationSummary style="FLOAT: right" id="ValidationSummary1" runat="server" ValidationGroup="1222"></asp:ValidationSummary> &nbsp; </TD></TR><TR><TD style="WIDTH: 100%; TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="WIDTH: 100%; TEXT-ALIGN: center" colSpan=2><Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Delete" __designer:wfdid="w45" ConfirmText="با حذف نظر سنجی کلیه گزینه های و کلیه آرا کاربران حذف می شود، برای حذف سوال نظر سنجی  انتخاب شده مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender2" runat="server" TargetControlID="Button_Update" __designer:wfdid="w46" ConfirmText="برای بروز رسانی سوال نظر سنجی انتخابی مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:SqlDataSource id="SqlDataSource_PollsQuastions" runat="server" UpdateCommandType="StoredProcedure" UpdateCommand="Polls_UpdateQuestion" SelectCommandType="StoredProcedure" SelectCommand="Polls_GetQuestionsList" OnUpdated="SqlDataSource_PollsQuastions_Updated" DeleteCommandType="StoredProcedure" DeleteCommand="Polls_DeleteQuestion" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>">
        <DeleteParameters>
            <asp:Parameter Name="QuestionID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="QuestionID" Type="Int32" />
            <asp:ControlParameter ControlID="TextBox_Quastions" Name="QuestionText" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="CheckBox_IsCurrentPolls" Name="IsCurrentQuestion"
                PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="CheckBox_IsArchived" Name="Archived" PropertyName="Checked"
                Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource> <asp:Button id="Button_Delete" onclick="Button_Delete_Click" runat="server" CssClass="Button" ValidationGroup="22" Text="حذف"></asp:Button> <asp:Button id="Button_Update" onclick="Button_Update_Click" runat="server" CssClass="Button" ValidationGroup="1222" Text="بروزرسانی"></asp:Button></TD></TR></TBODY></TABLE>
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

