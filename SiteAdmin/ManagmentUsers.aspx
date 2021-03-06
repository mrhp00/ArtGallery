<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="ManagmentUsers.aspx.cs" Inherits="SiteAdmin_ManagmentUsers" Title="Untitled Page" EnableSessionState="true"%>
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
                            مدیریت کاربران</h2>
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
                                <td>
                                    تعداد کل کاربران:<asp:Literal ID="lblTotUsers" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td>
                                    تعداد اعضای آنلاین:<asp:Literal ID="lblOnlineUsers" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td>
                                    برای دیدن لیست اعضا بروی یکی از حروف زیرکلیک نمایید</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Repeater ID="rptAlphabet" runat="server" OnItemCommand="rptAlphabet_ItemCommand">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ValidationGroup="123" CommandArgument='<%# Container.DataItem %>' Text='<%# Container.DataItem %>'></asp:LinkButton>
                                            &nbsp;
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    برای جستجوی کاربران می توانید ازقسمتی از نام کاربری یا ایمیل آنها استفاده نمایید.</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddlSearchTypes" runat="server" CssClass="DropDownList" Width="100px">
                                        <asp:ListItem Selected="True" Text="نام کاربری" Value="UserName"></asp:ListItem>
                                        <asp:ListItem Text="ایمیل" Value="E-mail"></asp:ListItem>
                                    </asp:DropDownList>
                                    شامل
                                    <asp:TextBox ID="txtSearchText" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="btnSearch"
                                        runat="server" CssClass="Button" OnClick="btnSearch_Click" Text="جستجو" ValidationGroup="1111" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="gvwUsers" runat="server" AutoGenerateColumns="False" CssClass="datatable"
                                        DataKeyNames="UserName" GridLines="None" OnRowCreated="gvwUsers_RowCreated" OnRowDeleting="gvwUsers_RowDeleting"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="نام کاربری">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle Width="40%" />
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink_UserName" runat="server" Font-Bold="True" NavigateUrl='<%# Eval("UserName", "~/ShowProfile.aspx?uid={0}") %>'
                                                        Text='<%# Bind("UserName") %>'></asp:HyperLink>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:HyperLinkField DataNavigateUrlFields="Email" DataNavigateUrlFormatString="mailto:{0}"
                                                DataTextField="Email" HeaderText="ایمیل">
                                                <ItemStyle Width="25%" CssClass="Date" />
                                            </asp:HyperLinkField>
                                            <asp:TemplateField HeaderText="تاریخ ایجاد">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CreationDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" CssClass="Date" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("CreationDate", "{0:D}"),true) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="آخرین فعالیت">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("LastActivityDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" CssClass="Date" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("LastActivityDate", "{0:D}"),true) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:CheckBoxField DataField="IsApproved" HeaderText="مجاز">
                                                <ItemStyle HorizontalAlign="Center" Width="5%" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:CheckBoxField>
                                            <asp:HyperLinkField DataNavigateUrlFields="UserName" DataNavigateUrlFormatString="~/SiteAdmin/EditUser.aspx?UserName={0}"
                                                Text="&lt;img src='../images/edit1.gif' border='0' /&gt;">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:HyperLinkField>
                                            <asp:ButtonField ButtonType="Image" CommandName="Delete" ImageUrl="~/images/delete1.gif">
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            </asp:ButtonField>
                                        </Columns>
                                        <RowStyle CssClass="row" />
                                        <EmptyDataTemplate>
                                            <b>No users found for the specified criteria</b>
                                        </EmptyDataTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table></contenttemplate>
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

