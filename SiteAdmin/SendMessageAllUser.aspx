<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="SendMessageAllUser.aspx.cs" Inherits="SiteAdmin_SendMessageAllUser" Title="Untitled Page" %>
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
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div class="grid" dir="rtl">
        <div class="rounded">
            <div class="top-outer">
                <div class="top-inner">
                    <div class="top">
                        <h2>
                            ارسال پیغام به کاربران</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD><TABLE style="WIDTH: 100%"><TBODY><TR><TD style="WIDTH: 3%; HEIGHT: 20px"><asp:LinkButton id="LinkButton_All" onclick="LinkButton_All_Click" runat="server" ValidationGroup="110" __designer:wfdid="w241">#</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_A" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="a" __designer:wfdid="w242">A</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_B" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="b" __designer:wfdid="w243">B</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_C" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="c" __designer:wfdid="w244">C</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_D" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="d" __designer:wfdid="w245">D</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_E" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="e" __designer:wfdid="w246">E</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_F" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="f" __designer:wfdid="w247">F</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_G" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="g" __designer:wfdid="w248">G</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_H" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="h" __designer:wfdid="w249">H</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_I" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="i" __designer:wfdid="w250">I</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_J" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="j" __designer:wfdid="w251">J</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_K" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="k" __designer:wfdid="w252">K</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_L" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="l" __designer:wfdid="w253">L</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_M" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="m" __designer:wfdid="w254">M</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_N" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="n" __designer:wfdid="w255">N</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_O" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="o" __designer:wfdid="w256">O</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_P" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="p" __designer:wfdid="w257">P</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_Q" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="q" __designer:wfdid="w258">Q</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_R" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="r" __designer:wfdid="w259">R</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_S" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="s" __designer:wfdid="w260">S</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_T" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="t" __designer:wfdid="w261">T</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_U" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="u" __designer:wfdid="w262">U</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_V" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="v" __designer:wfdid="w263">V</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_W" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="w" __designer:wfdid="w264">W</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_X" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="x" __designer:wfdid="w265">X</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_Y" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="i" __designer:wfdid="w266">Y</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_Z" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="z" __designer:wfdid="w267">Z</asp:LinkButton></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 1%"></TD></TR></TBODY></TABLE></TD></TR><TR><TD><asp:GridView id="GridView_UserList" runat="server" OnDataBound="GridView_UserList_DataBound" GridLines="None" DataSourceID="SqlDataSource_BrowseUsers" CssClass="datatable" AutoGenerateColumns="False" AllowSorting="True" __designer:wfdid="w268">
                                        <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                            PageButtonCount="7" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ردیف">
                                                <ItemStyle HorizontalAlign="Center" Width="7%" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="نام کاربری" SortExpression="LoweredUserName">
                                                <ItemStyle HorizontalAlign="Right" Width="38%" />
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink_UserName" runat="server" Font-Bold="True" NavigateUrl='<%# Eval("LoweredUserName", "~/ShowProfile.aspx?uid={0}") %>'
                                                        Text='<%# Eval("LoweredUserName") %>'></asp:HyperLink><br />
                                                    <asp:Label ID="Label_TypeUser" runat="server" Font-Size="10px"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="تاریخ عضویت">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="30%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label_Date" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="تعداد پستها">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label_WriteCount" runat="server"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="وضعیت">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:Image ID="Image_Online" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox_Select" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="row" />
                                        <EmptyDataTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="کاربرانی با این حرف در سایت موجود نیست"
                                                Width="100%"></asp:Label>
                                        </EmptyDataTemplate>
                                        <PagerStyle CssClass="pager-row" />
                                    </asp:GridView> <asp:SqlDataSource id="SqlDataSource_BrowseUsers" runat="server" SelectCommandType="StoredProcedure" SelectCommand="Forums_UserList" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" __designer:wfdid="w269">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="a" Name="Letter" />
                                        </SelectParameters>
                                    </asp:SqlDataSource> </TD></TR><TR><TD><TABLE style="WIDTH: 100%"><TBODY><TR><TD>تاریخ:</TD><TD><asp:Label id="Label_Date" runat="server" __designer:wfdid="w270"></asp:Label></TD></TR><TR><TD>عنوان:</TD><TD><asp:TextBox id="TextBox_Subject" runat="server" Width="80%" CssClass="TextBox" __designer:wfdid="w271"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ValidationGroup="11225" ErrorMessage="*" ControlToValidate="TextBox_Subject" __designer:wfdid="w272"></asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="عنوان پیغام را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Subject" WatermarkCssClass="WaterMark" __designer:wfdid="w273"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="VERTICAL-ALIGN: top">متن:</TD><TD><Editor:FCKeditor id="FCKeditor_Message" runat="server" UseBROnCarriageReturn="true" ToolbarSet="Basic" BasePath="~/FCKeditor/" __designer:wfdid="w274">
                                                </Editor:FCKeditor> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_Message" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" OnInserted="SqlDataSource_Message_Inserted" InsertCommandType="StoredProcedure" InsertCommand="Forums_PMMessageInsert" __designer:wfdid="w275">
                                                    <InsertParameters>
                                                        <asp:Parameter Name="Sender" Type="String" />
                                                        <asp:Parameter Name="Reciver" Type="String" />
                                                        <asp:Parameter Name="Message" Type="String" />
                                                        <asp:Parameter Name="Subject" Type="String" />
                                                    </InsertParameters>
                                                </asp:SqlDataSource> <asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" ValidationGroup="11225" CssClass="Button" Text="ارسال" __designer:wfdid="w276"></asp:Button> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" ConfirmText="برای ارسال پیغام به کاربران انتخاب شده مطمئن هستید؟" __designer:wfdid="w277"></Ajax:ConfirmButtonExtender></TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Message" runat="server" ForeColor="Blue" __designer:wfdid="w278"></asp:Label></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
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
    </div>
    </div>
</asp:Content>

