<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="ShowMessage.aspx.cs" Inherits="Users_ShowMessage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <asp:GridView ID="GridView_ShowMessage" runat="server" AutoGenerateColumns="False"
        DataSourceID="SqlDataSource_ShowMessage" ShowHeader="False" Style="border-right: #333399 1px solid;
        border-top: #333399 1px solid; border-left: #333399 1px solid; border-bottom: #333399 1px solid"
        Width="100%">
        <Columns>
            <asp:TemplateField HeaderText="Message" SortExpression="Message">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Message") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; padding-right: 1%; padding-left: 1%; padding-bottom: 1%; padding-top: 1%;">
                        <tr>
                            <td style="font-weight: bold; color: #ffffff; height: 30px; background-color: #738fbf;">
                                <asp:Label ID="Label_Subject" runat="server" Style="float: right" Text='<%# Eval("Subject") %>'></asp:Label>
                                <asp:Label ID="Label_Date" runat="server" Style="float: left" Text='<%# SDKClass.GetFarsiDate(Eval("AddedDate"),false) %>'></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="Col2">
                                <asp:Label ID="Label_Message" runat="server" Style="text-align: justify" Text='<%# Eval("Message") %>'></asp:Label></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_ShowMessage" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
        SelectCommand="Forums_PMMessageDetails" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="MessageID" QueryStringField="mid"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

