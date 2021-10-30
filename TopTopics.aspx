<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="TopTopics.aspx.cs" Inherits="TopTopics" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy id="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td colspan="4" style="border-right: #8b90c3 1px solid;
                border-top: #8b90c3 1px solid; font-weight: bold;
                border-left: #8b90c3 1px solid; color: white; height: 40px; background-color: #869bbf;">
                <asp:Label ID="Label_ForumName" runat="server" Font-Bold="True" Style="padding-right: 5px">انجمن: بالاترین های انجمن</asp:Label></td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView_TopicsList" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="TopicID" DataSourceID="SqlDataSource_ForumList" GridLines="Horizontal"
                    OnRowDataBound="GridView_TopTopicsList_RowDataBound" Style="border-right: #8b90c3 1px solid;
                    border-top: #8b90c3 1px solid; border-left: #8b90c3 1px solid; border-bottom: #8b90c3 1px solid"
                    Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="TopicID" InsertVisible="False" SortExpression="TopicID"
                            Visible="False">
                            <EditItemTemplate>
                                &nbsp;
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label_ID" runat="server" Text='<%# Eval("TopicID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="موضوع" SortExpression="Subject">
                            <EditItemTemplate>
                                &nbsp;
                            </EditItemTemplate>
                            <ItemStyle CssClass="Col1" HorizontalAlign="Right" VerticalAlign="Middle" Width="60%" />
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink_TopicTitle" runat="server" Font-Bold="True" NavigateUrl='<%# Eval("TopicID", "~/ShowThread.aspx?tid={0}") %>'
                                    Style="padding-right: 5px" Text='<%# Eval("Subject") %>'></asp:HyperLink><br />
                                <asp:Label ID="Label_UserName" runat="server" Style="padding-right: 5px" Text='<%# Eval("UserID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="آخرین نوشته">
                            <ItemStyle CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle" Width="25%" />
                            <ItemTemplate>
                                <asp:Label ID="Label_Date" runat="server" Visible="False"></asp:Label><br />
                                <asp:Label ID="Label_By" runat="server" Visible="False"></asp:Label>
                                <asp:HyperLink ID="HyperLink_UserName" runat="server" Visible="False">[HyperLink_UserName]</asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="پاسخ ها">
                            <ItemStyle CssClass="Col1" HorizontalAlign="Center" VerticalAlign="Middle" Width="8%" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                            <ItemTemplate>
                                <asp:Label ID="Label_ReplyCount" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ViewCount" HeaderText="نمایش ها" SortExpression="ViewCount">
                            <ItemStyle CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle Height="40px" HorizontalAlign="Right" VerticalAlign="Middle" />
                    <EmptyDataTemplate>
                        در این انجمن تاکنون تاپیکی ثبت نشده است
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#5C7099" Font-Bold="True" ForeColor="White" Height="25px"
                        HorizontalAlign="Right" VerticalAlign="Middle" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_ForumList" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                    SelectCommand="Forums_TopTopicsList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

