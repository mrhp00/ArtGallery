<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/site.master" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy id="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div class="grid" dir="rtl">
        <div class="rounded">
            <div class="top-outer">
                <div class="top-inner">
                    <div class="top">
                        <h2>
    درباره ما</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <table style="width: 100%">
                            <tr>
                                <td><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Saber_Fatholahi0.jpg"
                                        Style="padding-right: 10px; padding-left: 10px; float: left; padding-bottom: 10px;
                                        padding-top: 10px" />
                                    نام: صابر<br />
                                    نام خانوادگی: فتح الهی<br />
                                    تحصیلات: لیسانس کامپیوتر<br />
                                    ایمیل:saber_fatholahi@yahoo.com<br />
                                    شماره تماس:09124121452<br />
                                    برنامه نویس وب</td>
                            </tr>
                            <tr>
                                <td><asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Fateme_Aftari.jpg"
                                        Style="padding-right: 10px; padding-left: 10px; float: left; padding-bottom: 10px;
                                        padding-top: 10px" />نام :فاطمه<br />
                                    نام خانوادگی:افتری<br />
                                    تحصیلات:لیسانس کامپیوتر<br />
                                    ایمیل:aftari_shomal2000@yahoo.com<br />
                                    شماره تماس:---<br />
                                    طراح و تحلیلگر وب</td>
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

