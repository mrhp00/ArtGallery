<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="Forum" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <table style="border-right: #0b198c 1px solid; border-top: #0b198c 1px solid; border-left: #0b198c 1px solid; border-bottom: #0b198c 1px solid;" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr style="height: 40px">
            <td colspan="4" style="background-color: #869bbf; font-weight: bold; color: white;">
                &nbsp;به انجمن صفا خوش آمدید</td>
        </tr>
        <tr style="height: 40px">
            <td colspan="4" style="height: 25px">
                در صورتی که برای اولین بار از این سایت دیدن میکنید برای استفاده کامل از تمام امکانات
                سایت لازم است که<a href="CreateUser.aspx"><strong><span
                    style="color: #22229c; text-decoration: underline">ثبت نام</span></strong></a>
                کنید امکان ارسال مطلب و همچنین دسترسی به انجمن هایی که فقط اعضا ثبت نام شده امکان
                دسترسی به آن را دارند از امتیازات ثبت نام در سایت میباشد</td>
        </tr>
        <tr style="color:White;font-weight:bold;height:40px;background-color: #869bbf;">
            <td style="width: 60%; height: 25px">
                انجمن</td>
            <td style="width: 24%">
                آخرین تاپیک</td>
            <td style="width: 8%">
                موضوع ها</td>
            <td style="width: 8%; text-align: center;">
                نوشته ها</td>
        </tr>
        <tr style="height: 40px">
            <td style="height: 25px; padding-right: 5px; vertical-align: middle;" class="Col1" colspan="4">
                <asp:HyperLink ID="HyperLink_TopTopic" runat="server" Font-Bold="True" NavigateUrl="~/TopTopics.aspx">بالاترین های انجمن</asp:HyperLink><br />
                معرفي پربيننده ترين تاپيكها در انجمنهاي مختلف</td>
        </tr>
        <tr>
            <td colspan="4">
                        <asp:GridView ID="GridView_ForumList" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="CategoryID" DataSourceID="SqlDataSource_Category" GridLines="None"
                            OnRowDataBound="GridView_ArchivNews_RowDataBound" ShowHeader="False" style="width: 100%">
                            <Columns>
                                <asp:TemplateField HeaderText="انجمن" SortExpression="CategoryName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td style="font-weight: bold;
                                                    color: white; height: 40px; padding-right: 5px; border-right: #0b198c 1px solid; border-top: #0b198c 1px solid; border-left: #0b198c 1px solid; background-color: #869bbf;">
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("CategoryName") %>'></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeader="False" OnRowDataBound="GridView2_RowDataBound" Width="100%" style="border-right: #0b198c 1px solid; border-top: #0b198c 1px solid; border-left: #0b198c 1px solid; border-bottom: #0b198c 1px solid" GridLines="Horizontal">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ForumID" InsertVisible="False" SortExpression="ForumID"
                                                        Visible="False">
                                                        <EditItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("ForumID") %>'></asp:Label>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label_ForumID" runat="server" Text='<%# Bind("ForumID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemStyle CssClass="Col2" HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/forum_old.gif" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID"
                                                        Visible="False" />
                                                    <asp:TemplateField HeaderText="ForumName" SortExpression="ForumName">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl='<%# Eval("ForumID","~/BrowseForums.aspx?FID={0}") %>'
                                                                Text='<%# Bind("ForumName") %>' style="padding-right: 5px"></asp:HyperLink><br />
                                                            <asp:Label ID="Label2" runat="server" Font-Bold="False" Text='<%# Bind("ForumDescription") %>' style="padding-right: 5px"></asp:Label><br />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" Width="60%" CssClass="Col1" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="آخرین نوشته">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="20%" CssClass="Col2" />
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink_TopicTitle" runat="server" Visible="False">[HyperLink_TopicTitle]</asp:HyperLink><br />
                                                            <asp:Label ID="Label_BY" runat="server" Visible="False"></asp:Label>
                                                            <asp:HyperLink ID="HyperLink_UserName" runat="server" Visible="False">[HyperLink_UserName]</asp:HyperLink><br />
                                                            <asp:Label ID="Label_Date" runat="server" Visible="False"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="موضوع ها">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="8%" CssClass="Col1" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label_TopicCount" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="نوشته ها">
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" CssClass="Col2" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label_WriterCount" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle Height="60px" VerticalAlign="Middle" CssClass="Row" HorizontalAlign="Right" />
                                            </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle Width="60%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CategoryID" InsertVisible="False" SortExpression="CategoryID"
                                    Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CategoryID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
            </td>
        </tr>
    </table>
                        <asp:SqlDataSource ID="SqlDataSource_Category" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                            SelectCommand="Forums_CategoriesList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

