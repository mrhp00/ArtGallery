<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="SearchResult.aspx.cs" Inherits="SearchResult" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy id="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td colspan="4" style="border-right: #8b90c3 1px solid; border-top: #8b90c3 1px solid;
                font-weight: bold; border-left: #8b90c3 1px solid; color: white; height: 40px;
                background-color: #5c7099">
                نتیجه جستجو</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView_TopicsList" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="TopicID" DataSourceID="SqlDataSource_ForumList" GridLines="Horizontal" Style="border-right: #8b90c3 1px solid;
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
                        <asp:TemplateField>
                            <ItemStyle CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/thread_hot.gif" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="موضوع" SortExpression="Subject">
                            <EditItemTemplate>
                                &nbsp;
                            </EditItemTemplate>
                            <ItemStyle CssClass="Col1" HorizontalAlign="Right" VerticalAlign="Middle" Width="95%" />
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink_TopicTitle" runat="server" Font-Bold="True" NavigateUrl='<%# Eval("TopicID", "~/ShowThread.aspx?tid={0}") %>'
                                    Style="padding-right: 5px" Text='<%# Eval("Subject") %>'></asp:HyperLink><br />
                                <asp:Label ID="Label_UserName" runat="server" Style="padding-right: 5px" Text='<%# Eval("UserID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="40px" HorizontalAlign="Right" VerticalAlign="Middle" />
                    <EmptyDataTemplate>
                        جستجوی شما نتیجه ای در بر نداشت لطفادوباره سعی کنید
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#5C7099" Font-Bold="True" ForeColor="White" Height="20px"
                        HorizontalAlign="Right" VerticalAlign="Top" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_ForumList" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                    SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

