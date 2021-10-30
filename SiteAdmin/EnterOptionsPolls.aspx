<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="EnterOptionsPolls.aspx.cs" Inherits="SiteAdmin_EnterOptionsPoll" Title="Untitled Page" %>
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
                            وارد کردن گزینه های نظر سنجی</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD style="WIDTH: 20%">سوال مورد نظر:<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList_Quastions" ErrorMessage="لطفا سوال نظر سنجی را انتخاب کنید" ValidationGroup="1232">*</asp:RequiredFieldValidator></TD><TD><asp:DropDownList id="DropDownList_Quastions" runat="server" Width="90%" CssClass="DropDownList" DataSourceID="SqlDataSource_PollQuastions" DataTextField="QuestionText" DataValueField="QuestionID" AutoPostBack="True">
                                    </asp:DropDownList> </TD></TR><TR><TD style="WIDTH: 20%">متن گزینه انتخابی:<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Option" ErrorMessage="لطفا متن گزینه نظر سنجی را وارد کنید" ValidationGroup="1232">*</asp:RequiredFieldValidator></TD><TD><Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="گزینه های نظرسنجی را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Option" WatermarkCssClass="WaterMark" __designer:wfdid="w23"></Ajax:TextBoxWatermarkExtender> <asp:TextBox id="TextBox_Option" runat="server" Width="99%" CssClass="TextBox"></asp:TextBox></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:ValidationSummary style="FLOAT: right" id="ValidationSummary1" runat="server" ValidationGroup="1232"></asp:ValidationSummary> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_PollsOption" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" SelectCommand="Polls_GetOptionList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList_Quastions" Name="QuestionID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource> <asp:SqlDataSource id="SqlDataSource_PollQuastions" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" SelectCommand="Polls_GetQuestionsList" SelectCommandType="StoredProcedure" InsertCommand="Polls_InsertOption" InsertCommandType="StoredProcedure" OnInserted="SqlDataSource_PollQuastions_Inserted">
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="DropDownList_Quastions" Name="QuestionID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="TextBox_Option" Name="OptionText" PropertyName="Text"
                                                Type="String" />
                                            <asp:Parameter Direction="InputOutput" Name="OptionID" Type="Int32" />
                                        </InsertParameters>
                                    </asp:SqlDataSource> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" __designer:wfdid="w103" ConfirmText="برای ثبت اطلاعات مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" ValidationGroup="1232" CssClass="Button" Text="ثبت"></asp:Button> </TD></TR><TR><TD colSpan=2><asp:GridView style="MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px" id="GridView_PollsOption" runat="server" CssClass="datatable" DataSourceID="SqlDataSource_PollsOption" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" GridLines="None">
                            <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                PageButtonCount="7" />
                            <Columns>
                                <asp:TemplateField HeaderText="ردیف">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="OptionText" HeaderText="گزینه های نظر سنجی" SortExpression="OptionText">
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="75%" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TotalVotes" HeaderText="تعداد آراء" ReadOnly="True" SortExpression="TotalVotes">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle CssClass="row" />
                            <EmptyDataTemplate>
                                <asp:Label ID="Label2" runat="server" Text="تاکنون گزینه ای برای نظر سنجی انتخابی در سایت ثبت نشده است "
                                    Width="100%"></asp:Label>
                            </EmptyDataTemplate>
                            <PagerStyle CssClass="pager-row" />
                        </asp:GridView> </TD></TR></TBODY></TABLE>
</contenttemplate>
                        </asp:UpdatePanel>
                        <!-- Content Goes Here! -->
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

