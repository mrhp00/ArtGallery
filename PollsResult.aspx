<%@ Page Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="PollsResult.aspx.cs" Inherits="PollsResult" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div class="grid" dir="rtl">
        <div class="rounded">
            <div class="top-outer">
                <div class="top-inner">
                    <div class="top">
                        <h2>
                            نتایج نظر سنجی</h2>
                    </div>
                </div>
            </div>
            <div class="mid-outer">
                <div class="mid-inner">
                    <div class="mid">
                        <Polls:PollControl ID="Pollcontrol1" runat="server" CSSCaption="PollCaption" CssClass="Normal"
                            CSSPollClass="PollBack" Font-Names="tahoma" ImagesFolder="~/Images/PollImage/" ShowPercentage="True"
                            Style="font-family: tahoma" VotesCaption="تعداد آراء :" Width="100%" />
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

