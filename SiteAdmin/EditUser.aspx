<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/SiteAdmin/admin.master" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="SiteAdmin_EditUser" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy id="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div class="grid" dir="rtl">
        <div class="rounded">
            <div class="top-outer">
                <div class="top-inner">
                    <div class="top">
                        <h2>
                            ویرایش کاربران</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <table cellpadding="2" style="width: 100%">
                                        <tr>
                                            <td class="fieldname" style="width: 20%">
                                                نام کاربری:</td>
                                            <td>
                                                <asp:Literal ID="lblUserName" runat="server"></asp:Literal></td>
                                        </tr>
                                        <tr>
                                            <td class="fieldname">
                                                ایمیل:</td>
                                            <td>
                                                <asp:HyperLink ID="lnkEmail" runat="server"></asp:HyperLink></td>
                                        </tr>
                                        <tr>
                                            <td class="fieldname">
                                                تاریخ عضویت:</td>
                                            <td>
                                                <asp:Literal ID="lblRegistered" runat="server"></asp:Literal></td>
                                        </tr>
                                        <tr>
                                            <td class="fieldname">
                                                آخرین ورود به سایت:</td>
                                            <td>
                                                <asp:Literal ID="lblLastLogin" runat="server"></asp:Literal></td>
                                        </tr>
                                        <tr>
                                            <td class="fieldname">
                                                آخرین فعالیت:</td>
                                            <td>
                                                <asp:Literal ID="lblLastActivity" runat="server"></asp:Literal></td>
                                        </tr>
                                        <tr>
                                            <td class="fieldname">
                                                <asp:Label ID="lblOnlineNow" runat="server" AssociatedControlID="chkOnlineNow" Text="آنلاین:"></asp:Label></td>
                                            <td>
                                                <asp:CheckBox ID="chkOnlineNow" runat="server" Enabled="false" /></td>
                                        </tr>
                                        <tr>
                                            <td class="fieldname">
                                                <asp:Label ID="lblApproved" runat="server" AssociatedControlID="chkApproved" Text="مجاز:"></asp:Label></td>
                                            <td>
                                                <asp:CheckBox ID="chkApproved" runat="server" AutoPostBack="true" OnCheckedChanged="chkApproved_CheckedChanged" /></td>
                                        </tr>
                                        <tr>
                                            <td class="fieldname">
                                                <asp:Label ID="lblLockedOut" runat="server" AssociatedControlID="chkLockedOut" Text="Locked Out:"></asp:Label></td>
                                            <td>
                                                <asp:CheckBox ID="chkLockedOut" runat="server" AutoPostBack="true" OnCheckedChanged="chkLockedOut_CheckedChanged" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px">
                                    ویرایش گروه کاربری:</td>
                            </tr>
                            <tr>
                                <td style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px">
                                    <asp:CheckBoxList ID="chklRoles" runat="server" CellSpacing="4" RepeatColumns="5">
                                    </asp:CheckBoxList></td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Label ID="Label_Message" runat="server" ForeColor="Blue"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <asp:Button ID="btnUpdateRoles" runat="server" CssClass="Button" Text="بروزرسانی"
                                        ValidationGroup="EditProfile" /></td>
                            </tr>
                        </table>
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
</asp:Content>

