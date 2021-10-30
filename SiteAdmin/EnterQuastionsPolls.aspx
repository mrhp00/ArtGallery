<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="EnterQuastionsPolls.aspx.cs" Inherits="SiteAdmin_EnterQuastionsPolls" Title="Untitled Page" %>
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
                            وارد کردن سوال نظر سنجی</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD style="VERTICAL-ALIGN: top; WIDTH: 20%">متن نظر سنجی:<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Quastions" ErrorMessage="لطفا متن نظر سنجی را وارد نمایید" ValidationGroup="1222">*</asp:RequiredFieldValidator></TD><TD><asp:TextBox id="TextBox_Quastions" runat="server" Width="99%" Height="53px" CssClass="TextBox" TextMode="MultiLine"></asp:TextBox></TD></TR><TR style="COLOR: #000000"><TD>آرشیو شود:</TD><TD><asp:CheckBox id="CheckBox_IsArchived" runat="server"></asp:CheckBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="سوال نظر سنجی را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Quastions" WatermarkCssClass="WaterMark" __designer:wfdid="w22"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD>نظر سنجی فعال:</TD><TD><asp:CheckBox id="CheckBox_IsCurrentPolls" runat="server" Checked="True"></asp:CheckBox></TD></TR><TR><TD colSpan=2><asp:ValidationSummary style="FLOAT: right" id="ValidationSummary1" runat="server" ValidationGroup="1222"></asp:ValidationSummary>&nbsp;&nbsp;</TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" ForeColor="Blue"></asp:Label></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_InsertPollsQuastions" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" InsertCommand="Polls_InsertQuestion" InsertCommandType="StoredProcedure" OnInserted="SqlDataSource_InsertPollsQuastions_Inserted" SelectCommand="Polls_GetQuestionsList" SelectCommandType="StoredProcedure">
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox_Quastions" Name="QuestionText" PropertyName="Text"
                Type="String" />
            <asp:Parameter Name="IsCurrentQuestion" Type="Int32" />
            <asp:Parameter Name="Archived" Type="Int32" />
            <asp:Parameter Direction="InputOutput" Name="QuestionID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" __designer:wfdid="w102" ConfirmText="برای ثبت اطلاعات مطمئن هستید؟"></Ajax:ConfirmButtonExtender> <asp:Button id="Button_Show" onclick="Button_Show_Click" runat="server" ValidationGroup="22" CssClass="Button" Text="نمایش سوالات"></asp:Button> <asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" ValidationGroup="1222" CssClass="Button" Text="ثبت"></asp:Button></TD></TR><TR><TD style="WIDTH: 100%; TEXT-ALIGN: center" colSpan=2><asp:GridView id="GridView_QustionPollsList" runat="server" CssClass="datatable" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QuestionID" DataSourceID="SqlDataSource_InsertPollsQuastions" GridLines="None">
<PagerSettings PageButtonCount="7" Mode="NumericFirstLast" LastPageText="&#187;" FirstPageText="&#171;"></PagerSettings>
<Columns>
<asp:TemplateField HeaderText="ردیف">
<ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
<ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                            
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="QuestionText" SortExpression="QuestionText" HeaderText="سوال نظر سنجی">
<ItemStyle Width="55%" HorizontalAlign="Right" VerticalAlign="Top"></ItemStyle>

<HeaderStyle HorizontalAlign="Right" VerticalAlign="Top"></HeaderStyle>
</asp:BoundField>
<asp:CheckBoxField DataField="IsCurrentQuestion" SortExpression="IsCurrentQuestion" HeaderText="سوال فعال">
<ItemStyle Width="15%" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
</asp:CheckBoxField>
<asp:CheckBoxField DataField="Archived" SortExpression="Archived" HeaderText="آرشیو">
<ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Top"></ItemStyle>
</asp:CheckBoxField>
<asp:TemplateField SortExpression="AddedDate" HeaderText="تاریخ">
<ItemStyle Width="10%" CssClass="Date" HorizontalAlign="Center"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>'></asp:Label>
                            
</ItemTemplate>
</asp:TemplateField>
</Columns>

<RowStyle CssClass="row"></RowStyle>
<EmptyDataTemplate>
<asp:Label id="Label3" runat="server" Width="100%" Text="تاکنون هیچگونه نظر سنجی در سایت ثبت نشده است." __designer:wfdid="w21"></asp:Label> 
</EmptyDataTemplate>

<PagerStyle CssClass="pager-row"></PagerStyle>

<HeaderStyle VerticalAlign="Middle"></HeaderStyle>
</asp:GridView></TD></TR></TBODY></TABLE>
</contenttemplate>
                        </asp:UpdatePanel>&nbsp;
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

