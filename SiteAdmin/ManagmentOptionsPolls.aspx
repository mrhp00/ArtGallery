<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="ManagmentOptionsPolls.aspx.cs" Inherits="SiteAdmin_ManagmentOptionsPolls" Title="Untitled Page" %>
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
                            مدیریت گزینه های نظر سنجی</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 20%">
                                    سوال نظر سنجی:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                        ControlToValidate="DropDownList_Quastion" ErrorMessage="لطفا سوال نظر سنجی را انتخاب کنید"
                                        ValidationGroup="1232">*</asp:RequiredFieldValidator></td>
                                <td style="width: 90%; color: #000000;">
                                    <asp:DropDownList ID="DropDownList_Quastion" runat="server" AutoPostBack="True" CssClass="DropDownList"
                                        DataSourceID="SqlDataSource_PollQuastions" DataTextField="QuestionText" DataValueField="QuestionID"
                                        OnSelectedIndexChanged="DropDownList_Quastion_SelectedIndexChanged" Width="90%">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GridView_PollsOption" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateColumns="False" CssClass="datatable" DataSourceID="SqlDataSource_PollsOption"
                                        GridLines="None" OnSelectedIndexChanged="GridView_PollsOption_SelectedIndexChanged"
                                        Style="margin-top: 10px; margin-bottom: 10px">
                                        <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                            PageButtonCount="7" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ردیف">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="OptionText" HeaderText="گزینه های نظر سنجی" SortExpression="OptionText">
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="65%" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="TotalVotes" HeaderText="تعداد آراء" ReadOnly="True" SortExpression="TotalVotes">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="حذف">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("OptionID") %>' Visible="False"></asp:Label>
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
                                            <asp:Label ID="Label2" runat="server" Text="تاکنون گزینه ای برای نظر سنجی انتخابی در سایت ثبت نشده است "
                                                Width="100%"></asp:Label>
                                        </EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="AliceBlue" />
                                        <PagerStyle CssClass="pager-row" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    سوال نظر سنجی:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ControlToValidate="DropDownList_QuastionsUpdate" ErrorMessage="لطفا سوال نظر سنجی را انتخاب کنید"
                                        ValidationGroup="1232">*</asp:RequiredFieldValidator></td>
                                <td style="width: 90%">
                                    <asp:DropDownList ID="DropDownList_QuastionsUpdate" runat="server" CssClass="DropDownList"
                                        DataSourceID="SqlDataSource_PollQuastions" DataTextField="QuestionText" DataValueField="QuestionID"
                                        Width="90%">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">
                                    متن گزینه انتخابی:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="TextBox_Option" ErrorMessage="لطفا متن گزینه نظر سنجی را وارد کنید"
                                        ValidationGroup="1232">*</asp:RequiredFieldValidator></td>
                                <td style="width: 90%">
                                    <asp:TextBox ID="TextBox_Option" runat="server" CssClass="TextBox" Width="99%"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Style="float: right"
                                        ValidationGroup="1232" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <asp:Label ID="Label_Message" runat="server" ForeColor="Blue"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <asp:SqlDataSource ID="SqlDataSource_PollsOption" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                                        DeleteCommand="Polls_DeleteOption" DeleteCommandType="StoredProcedure" OnUpdated="SqlDataSource_PollsOption_Updated"
                                        SelectCommand="Polls_GetOptionList" SelectCommandType="StoredProcedure" UpdateCommand="Polls_UpdateOption"
                                        UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:Parameter Name="OptionID" Type="Int32" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="OptionID" Type="Int32" />
                                            <asp:ControlParameter ControlID="TextBox_Option" Name="OptionText" PropertyName="Text"
                                                Type="String" />
                                            <asp:ControlParameter ControlID="DropDownList_QuastionsUpdate" Name="QuestionID"
                                                PropertyName="SelectedValue" Type="Int32" />
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownList_Quastion" Name="QuestionID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlDataSource_PollQuastions" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                                        InsertCommand="Polls_InsertOption" InsertCommandType="StoredProcedure" SelectCommand="Polls_GetQuestionsList"
                                        SelectCommandType="StoredProcedure">
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="DropDownList_Quastions" Name="QuestionID" PropertyName="SelectedValue"
                                                Type="Int32" />
                                            <asp:ControlParameter ControlID="TextBox_Option" Name="OptionText" PropertyName="Text"
                                                Type="String" />
                                            <asp:Parameter Direction="InputOutput" Name="OptionID" Type="Int32" />
                                        </InsertParameters>
                                    </asp:SqlDataSource>
                                    <asp:Button ID="Button_Delete" runat="server" CssClass="Button" OnClick="Button_Delete_Click"
                                        Text="حذف" ValidationGroup="111" />
                                    <asp:Button ID="Button_Update" runat="server" CssClass="Button" OnClick="Button_Update_Click"
                                        Text="بروزرسانی" ValidationGroup="1232" />
                                </td>
                            </tr>
                        </table></contenttemplate>
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

