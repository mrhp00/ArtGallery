<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="EnterArticleCategories.aspx.cs" Inherits="SiteAdmin_EnterArticleCategories" Title="Untitled Page" %>
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
                            ثبت گروه مقالات</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<TABLE style="WIDTH: 100%"><TBODY><TR><TD><asp:GridView id="GridView_Category" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="datatable" DataKeyNames="CategoryID" DataSourceID="SqlDataSource_Category" GridLines="None" ShowHeader="False" OnRowDataBound="GridView_Category_RowDataBound" __designer:wfdid="w88">
                                        <PagerSettings FirstPageText="&#171;" LastPageText="&#187;" Mode="NumericFirstLast"
                                            PageButtonCount="7" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="ImageUrl" SortExpression="ImageUrl">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ImageUrl") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle Height="75px" Width="75px" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label_Image" runat="server" Text='<%# Bind("ImageUrl") %>' Visible="False"></asp:Label>
                                                    <asp:Image ID="Image_Category" runat="server" Width="75px" Height="75px" ImageUrl='<%# Eval("ImageUrl", "~/CategoriesImage/{0}") %>'
                                                         />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                                <ItemStyle Width="20%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="AddedBy" HeaderText="AddedBy" SortExpression="AddedBy">
                                                <ItemStyle Width="20%" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                                                <ItemStyle Width="30%" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="AddedDate" SortExpression="AddedDate">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AddedDate") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemStyle Width="10%" CssClass="Date" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate", "{0:D}"),true) %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CategoryID" InsertVisible="False" SortExpression="CategoryID">
                                                <ItemStyle Width="10%" HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink_Show" runat="server" NavigateUrl='<%# Eval("CategoryID", "~/BrowseArticles.aspx?CatID={0}") %>'>نمایش</asp:HyperLink>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="row" />
                                        <EmptyDataTemplate>
                                            تاکنون هیچ گروهی در سایت ثبت نشده است.
                                        </EmptyDataTemplate>
                                        <PagerStyle CssClass="pager-row" />
                                    </asp:GridView> </TD></TR><TR><TD><TABLE style="WIDTH: 100%"><TBODY><TR><TD style="WIDTH: 20%">نویسنده:</TD><TD><asp:Label id="Label_UserName" runat="server" __designer:wfdid="w89" Text='<%=Session["UserName"].ToString() %>'></asp:Label></TD></TR><TR><TD style="WIDTH: 20%">عنوان:</TD><TD><asp:TextBox id="TextBox_Title" runat="server" Width="50%" CssClass="TextBox" __designer:wfdid="w90"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="لطفا عنوان مقاله را وارد نمایید" ControlToValidate="TextBox_Title" ValidationGroup="1522" __designer:wfdid="w91">*</asp:RequiredFieldValidator> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="عنوان گروه مقاله را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Title" WatermarkCssClass="WaterMark" __designer:wfdid="w92"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="WIDTH: 20%">توضیحات:</TD><TD><asp:TextBox id="TextBox_Description" runat="server" Width="80%" Height="50px" CssClass="TextBox" __designer:wfdid="w93" TextMode="MultiLine"></asp:TextBox> <Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="توضیحات گروه مقاله را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_Description" WatermarkCssClass="WaterMark" __designer:wfdid="w94"></Ajax:TextBoxWatermarkExtender></TD></TR><TR><TD style="WIDTH: 20%">تصویر:</TD><TD><asp:FileUpload id="FileUpload1" runat="server" Width="100%" __designer:wfdid="w95"></asp:FileUpload></TD></TR><TR><TD colSpan=2><asp:ValidationSummary id="ValidationSummary1" runat="server" ValidationGroup="1522" __designer:wfdid="w96"></asp:ValidationSummary> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:Label id="Label_Messasge" runat="server" __designer:wfdid="w97" ForeColor="Blue"></asp:Label> </TD></TR><TR><TD style="TEXT-ALIGN: center" colSpan=2><asp:SqlDataSource id="SqlDataSource_Category" runat="server" __designer:wfdid="w98" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" InsertCommand="Articles_InsertCategory" InsertCommandType="StoredProcedure" SelectCommand="Articles_GetCategories" SelectCommandType="StoredProcedure" OnInserted="SqlDataSource_Category_Inserted"><InsertParameters>
<asp:SessionParameter SessionField="UserName" Type="String" Name="AddedBy"></asp:SessionParameter>
<asp:ControlParameter PropertyName="Text" Type="String" Name="Title" ControlID="TextBox_Title"></asp:ControlParameter>
<asp:ControlParameter PropertyName="Text" Type="String" Name="Description" ControlID="TextBox_Description"></asp:ControlParameter>
<asp:Parameter Type="String" Name="ImageUrl"></asp:Parameter>
</InsertParameters>
</asp:SqlDataSource> <asp:Button id="Button_Save" onclick="Button_Save_Click" runat="server" CssClass="Button" ValidationGroup="1522" __designer:wfdid="w99" Text="ثبت"></asp:Button> <Ajax:ConfirmButtonExtender id="ConfirmButtonExtender1" runat="server" TargetControlID="Button_Save" __designer:wfdid="w100" ConfirmText="برای ثبت اطلاعات مطمئن هستید؟"></Ajax:ConfirmButtonExtender></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
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

