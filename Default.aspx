<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="grid" dir="rtl">
        <div class="rounded">
            <div class="top-outer">
                <div class="top-inner">
                    <div class="top">
                        <h2>
                            جدیدترین اخبار</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel id="UpdatePanel1" runat="server">
                            <contenttemplate>
<asp:GridView style="WIDTH: 100%" id="GridView_NewsList" runat="server" Width="100%" DataSourceID="SqlDataSource_News" ShowHeader="False" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="datatable" GridLines="None">
<PagerSettings PageButtonCount="7" Mode="NumericFirstLast" LastPageText="&#187;" FirstPageText="&#171;"></PagerSettings>
<Columns>
<asp:TemplateField SortExpression="Title" HeaderText="عنوان خبر">
<ItemStyle HorizontalAlign="Right" VerticalAlign="Middle"></ItemStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<ItemTemplate>
<asp:Panel id="Panel_Row" runat="server" Width="100%" __designer:wfdid="w36" Height="100%"><asp:Label id="Label_ID" runat="server" Visible="False" Text='<%# Eval("ID") %>' __designer:wfdid="w37">
</asp:Label> <asp:LinkButton id="LinkButton_ShowNews" onclick="LinkButton_ShowNews_Click" runat="server" Text='<%# Bind("Title") %>' CommandArgument="<%# Container.DataItemIndex %>" ValidationGroup="4564" __designer:wfdid="w38"></asp:LinkButton></asp:Panel> <asp:Panel id="Panel_Show" runat="server" Width="200px" CssClass="Preview" __designer:wfdid="w39" Height="200px"><asp:Label style="TEXT-INDENT: 20px; TEXT-ALIGN: justify" id="Label1" runat="server" Text='<%# Eval("Abstruct") %>' __designer:wfdid="w30"></asp:Label><BR /><BR /><asp:LinkButton id="LinkButton_Return" onclick="LinkButton_ShowNews_Click" runat="server" ForeColor="#0000C0" Text="ادامه خبر..." CommandArgument="<%# Container.DataItemIndex %>" ValidationGroup="4564" __designer:wfdid="w41"></asp:LinkButton></asp:Panel> <Ajax:HoverMenuExtender id="HoverMenuExtender_ShowNews" runat="server" __designer:wfdid="w42" TargetControlID="Panel_Row" HoverCssClass="popupHover" PopDelay="25" PopupPosition="Center" PopupControlID="Panel_Show"></Ajax:HoverMenuExtender> 
</ItemTemplate>
</asp:TemplateField>
</Columns>

<RowStyle CssClass="row"></RowStyle>
<EmptyDataTemplate>
<asp:Label id="Label2" runat="server" Width="100%" Text="تاکنون در سایت خبری ثبت نشده است"></asp:Label> 
</EmptyDataTemplate>

<PagerStyle CssClass="pager-row"></PagerStyle>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</asp:GridView> <asp:SqlDataSource id="SqlDataSource_News" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" SelectCommand="News_GetNewsNewest" SelectCommandType="StoredProcedure" UpdateCommand="News_IncrementViewCount" UpdateCommandType="StoredProcedure"><UpdateParameters>
<asp:Parameter Type="Int32" Name="NewsID"></asp:Parameter>
</UpdateParameters>
</asp:SqlDataSource> 
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
    <div class="grid" dir="rtl">
        <div class="rounded">
            <div class="top-outer">
                <div class="top-inner">
                    <div class="top">
                        <h2>
                            جدیدترین مقالات</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
<asp:GridView id="GridView_ArticleList" runat="server" DataSourceID="SqlDataSource_ArticleList" ShowHeader="False" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="datatable" GridLines="None">
<PagerSettings PageButtonCount="7" Mode="NumericFirstLast" LastPageText="&#187;" FirstPageText="&#171;"></PagerSettings>
<Columns>
<asp:TemplateField SortExpression="Title" HeaderText="عنوان">
<ItemStyle Width="80%" HorizontalAlign="Right"></ItemStyle>
<ItemTemplate>
<asp:Panel id="Panel_Row" runat="server" Width="100%" __designer:wfdid="w54" Height="100%">&nbsp;<asp:LinkButton id="LinkButton_Show" onclick="LinkButton_ShowArticle_Click" runat="server" Text='<%# Bind("Title") %>' CommandArgument="<%# Container.DataItemIndex %>" ValidationGroup="11" __designer:wfdid="w55"></asp:LinkButton> <asp:Label id="Label_ID" runat="server" Visible="False" Text='<%# Eval("ArticleID") %>' __designer:wfdid="w56"></asp:Label></asp:Panel><asp:Panel id="Panel_Show" runat="server" Width="200px" CssClass="Preview" __designer:wfdid="w57" Height="200px"><asp:Label style="TEXT-INDENT: 20px; TEXT-ALIGN: justify" id="Label1" runat="server" Text='<%# Eval("Abstract") %>' __designer:wfdid="w40"></asp:Label><BR /><BR /><asp:LinkButton id="LinkButton_Return" onclick="LinkButton_ShowArticle_Click" runat="server" Text="مشاهده مقاله..." CommandArgument="<%# Container.DataItemIndex %>" ValidationGroup="4564" __designer:wfdid="w59"></asp:LinkButton></asp:Panel><Ajax:HoverMenuExtender id="HoverMenuExtender_ShowNews" runat="server" __designer:wfdid="w60" TargetControlID="Panel_Row" HoverCssClass="popupHover" PopDelay="25" PopupPosition="Center" PopupControlID="Panel_Show"></Ajax:HoverMenuExtender>
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="AddedBy" SortExpression="AddedBy" HeaderText="نویسنده">
<ItemStyle Width="20%" HorizontalAlign="Right" VerticalAlign="Middle"></ItemStyle>
</asp:BoundField>
</Columns>

<RowStyle CssClass="row" HorizontalAlign="Right"></RowStyle>
<EmptyDataTemplate>
                                        &nbsp;در گروه انتخابی تاکنون مقاله ای ثبت نشده است.
                                    
</EmptyDataTemplate>

<PagerStyle CssClass="pager-row"></PagerStyle>

<HeaderStyle HorizontalAlign="Right"></HeaderStyle>
</asp:GridView> <asp:SqlDataSource id="SqlDataSource_ArticleList" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>" SelectCommand="Articles_GetArticlesNewst" SelectCommandType="StoredProcedure" UpdateCommand="Articles_IncrementViewCount" UpdateCommandType="StoredProcedure">
                                    <UpdateParameters>
                                        <asp:Parameter Name="ArticleID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource> 
</ContentTemplate>
                        </asp:UpdatePanel>
                        &nbsp;</div>
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
</asp:Content>

