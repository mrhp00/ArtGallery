<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="BrowseUsers.aspx.cs" Inherits="BrowseUsers" Title="Untitled Page" %>
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
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="WIDTH: 100%" cellSpacing=0 cellPadding=0 border=0><TBODY><TR><TD style="BORDER-RIGHT: #0b198c 1px solid; BORDER-TOP: #0b198c 1px solid; VERTICAL-ALIGN: middle; BORDER-LEFT: #0b198c 1px solid; BORDER-BOTTOM: #0b198c 1px solid; HEIGHT: 30px; TEXT-ALIGN: center" class="Col2"><TABLE style="WIDTH: 100%"><TBODY><TR><TD style="WIDTH: 3%; HEIGHT: 20px"><asp:LinkButton id="LinkButton_All" onclick="LinkButton_All_Click" runat="server" ValidationGroup="110">#</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_A" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="a">A</asp:LinkButton></TD><TD style="WIDTH: 3%; COLOR: #000000"><asp:LinkButton id="LinkButton_B" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="b">B</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_C" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="c">C</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_D" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="d">D</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_E" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="e">E</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_F" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="f">F</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_G" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="g">G</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_H" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="h">H</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_I" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="i">I</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_J" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="j">J</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_K" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="k">K</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_L" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="l">L</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_M" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="m">M</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_N" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="n">N</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_O" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="o">O</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_P" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="p">P</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_Q" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="q">Q</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_R" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="r">R</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_S" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="s">S</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_T" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="t">T</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_U" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="u">U</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_V" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="v">V</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_W" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="w">W</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_X" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="x">X</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_Y" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="i">Y</asp:LinkButton></TD><TD style="WIDTH: 3%"><asp:LinkButton id="LinkButton_Z" onclick="LinkButton_A_Click" runat="server" ValidationGroup="110" CommandArgument="z">Z</asp:LinkButton></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 3%"></TD><TD style="WIDTH: 1%"></TD></TR></TBODY></TABLE></TD></TR><TR><TD style="HEIGHT: 15px"></TD></TR><TR><TD style="BORDER-RIGHT: #0b198c 1px solid; PADDING-RIGHT: 10px; BORDER-TOP: #0b198c 1px solid; FONT-WEIGHT: bold; BORDER-LEFT: #0b198c 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #0b198c 1px solid; HEIGHT: 40px; BACKGROUND-COLOR: #869bbf">لیست کاربران</TD></TR><TR><TD><asp:GridView style="BORDER-RIGHT: #0b198c 1px solid; BORDER-TOP: #0b198c 1px solid; BORDER-LEFT: #0b198c 1px solid; BORDER-BOTTOM: #0b198c 1px solid" id="GridView_BrowseUsers" runat="server" Width="100%" AutoGenerateColumns="False" GridLines="Horizontal" OnRowDataBound="GridView_BrowseUsers_RowDataBound" DataSourceID="SqlDataSource_BrowseUsers">
<PagerSettings PageButtonCount="15" Mode="NumericFirstLast"></PagerSettings>
<Columns>
<asp:TemplateField HeaderText="ردیف">
<ItemStyle Width="7%" CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center" VerticalAlign="Top"></HeaderStyle>
<ItemTemplate>
                                    <asp:Label ID="Label_Row" runat="server" Text="<%# Container.DataItemIndex+1 %>"></asp:Label>
                                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField SortExpression="UserName" HeaderText="نام کاربری">
<ItemStyle Width="43%" CssClass="Col1"></ItemStyle>
<ItemTemplate>
                                    <asp:HyperLink ID="HyperLink_UserName" runat="server" NavigateUrl='<%# Eval("LoweredUserName", "~/ShowProfile.aspx?uid={0}") %>'
                                        Text='<%# Eval("LoweredUserName") %>' Font-Bold="True"></asp:HyperLink><br />
                                    <asp:Label ID="Label_TypeUser" runat="server" Font-Size="10px"></asp:Label>
                                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="تاریخ عضویت">
<ItemStyle Width="30%" CssClass="Col2" HorizontalAlign="Center"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                    <asp:Label ID="Label_Date" runat="server"></asp:Label>
                                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="تعداد پست ها">
<ItemStyle Width="15%" CssClass="Col1" HorizontalAlign="Center"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                    <asp:Label ID="Label_WriteCount" runat="server"></asp:Label>
                                
</ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="وضعیت">
<ItemStyle Width="5%" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
                                    <asp:Image ID="Image_Online" runat="server" />
                                
</ItemTemplate>
</asp:TemplateField>
</Columns>

<RowStyle Height="30px" HorizontalAlign="Right"></RowStyle>
<EmptyDataTemplate>
                            تاکنون نام کاربری با چنین مشخصاتی ثبت نشده است
                        
</EmptyDataTemplate>

<PagerStyle BackColor="#5C7099" Height="25px" ForeColor="White" HorizontalAlign="Center"></PagerStyle>

<HeaderStyle BackColor="#5C7099" Height="25px" ForeColor="White"></HeaderStyle>
</asp:GridView> &nbsp; <asp:SqlDataSource id="SqlDataSource_BrowseUsers" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" SelectCommand="Forums_UserList" SelectCommandType="StoredProcedure"><SelectParameters>
<asp:Parameter Type="String" DefaultValue="a" Name="Letter"></asp:Parameter>
</SelectParameters>
</asp:SqlDataSource> </TD></TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>

