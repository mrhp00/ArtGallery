<%@ Page enableViewState="false" Language="C#" MasterPageFile="~/Forum.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" Title="Untitled Page" EnableSessionState="True"%>
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
    <asp:UpdatePanel id="UpdatePanel1" runat="server">
        <contenttemplate>
<TABLE style="BORDER-RIGHT: #0b198c 1px solid; BORDER-TOP: #0b198c 1px solid; BORDER-LEFT: #0b198c 1px solid; WIDTH: 100%; BORDER-BOTTOM: #0b198c 1px solid" class="Col2"><TBODY><TR><TD style="FONT-WEIGHT: bold; COLOR: #ffffff; HEIGHT: 30px; BACKGROUND-COLOR: #5c7099" colSpan=2>جستجو انجمن ها</TD></TR><TR><TD style="PADDING-RIGHT: 1%; WIDTH: 49%">جستجو بوسیله کلمات کلیدی</TD><TD style="PADDING-RIGHT: 1%; WIDTH: 49%">جستجو توسط نام کاربری</TD></TR><TR><TD style="PADDING-RIGHT: 1%; WIDTH: 49%">کلمات کلیدی:</TD><TD style="PADDING-RIGHT: 1%; WIDTH: 49%">نام کاربری:</TD></TR><TR><TD style="PADDING-RIGHT: 1%; WIDTH: 49%"><asp:TextBox id="TextBox_KeyWord" runat="server" Width="60%" ValidationGroup="110" CssClass="TextBox"></asp:TextBox><asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ValidationGroup="110" ErrorMessage="*" ControlToValidate="TextBox_KeyWord"></asp:RequiredFieldValidator> <BR /><Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender2" watermarkText="کلمه کلیدی را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_KeyWord" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender><BR /><asp:DropDownList id="DropDownList_Type" runat="server" CssClass="DropDownList">
                    <asp:ListItem Selected="True" Value="0">جستجوی عناوین</asp:ListItem>
                    <asp:ListItem Value="1">جستجوی  تمام پست ها</asp:ListItem>
                </asp:DropDownList></TD><TD style="PADDING-RIGHT: 1%; WIDTH: 49%"><asp:TextBox style="TEXT-ALIGN: left" id="TextBox_UserName" runat="server" Width="60%" ValidationGroup="120" CssClass="TextBox"></asp:TextBox> <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ValidationGroup="120" ErrorMessage="*" ControlToValidate="TextBox_UserName"></asp:RequiredFieldValidator><BR /><Ajax:TextBoxWatermarkExtender id="TextBoxWatermarkExtender1" watermarkText="نام کاربری را اینجا وارد نمایید" runat="server" TargetControlID="TextBox_UserName" WatermarkCssClass="WaterMark"></Ajax:TextBoxWatermarkExtender> <Ajax:AutoCompleteExtender id="autoComplete1" runat="server" TargetControlID="TextBox_UserName" BehaviorID="AutoCompleteEx" CompletionInterval="1000" EnableCaching="true" CompletionListCssClass="autocomplete_completionListElement" CompletionListItemCssClass="autocomplete_listItem" CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" DelimiterCharacters=";, :" ServicePath="SearchWebService.asmx" ServiceMethod="GetSearchCompletaionUserList" MinimumPrefixLength="2"><Animations>
                    <OnShow>
                        <Sequence>
                            
                            <OpacityAction Opacity="0" />
                            <HideAction Visible="true" />
                            
                            <ScriptAction Script="
                                // Cache the size and setup the initial size
                                var behavior = $find('AutoCompleteEx');
                                if (!behavior._height) {
                                    var target = behavior.get_completionList();
                                    behavior._height = target.offsetHeight - 2;
                                    target.style.height = '0px';
                                }" />
                            
                            
                            <Parallel Duration=".4">
                                <FadeIn />
                                <Length PropertyKey="height" StartValue="0" EndValueScript="$find('AutoCompleteEx')._height" />
                            </Parallel>
                        </Sequence>
                    </OnShow>
                    <OnHide>
                        
                        <Parallel Duration=".4">
                            <FadeOut />
                            <Length PropertyKey="height" StartValueScript="$find('AutoCompleteEx')._height" EndValue="0" />
                        </Parallel>
                    </OnHide></Animations>
</Ajax:AutoCompleteExtender><BR /><asp:DropDownList id="DropDownList_Type2" runat="server" Width="60%" CssClass="DropDownList"><asp:ListItem Selected="True" Value="0">پیدا کردن تمام پست های نوشته شده توسط کاربر</asp:ListItem>
<asp:ListItem Value="1">پیداکردن موضوعات نوشته شده توسط کاربر</asp:ListItem>
</asp:DropDownList> </TD></TR><TR style="TEXT-ALIGN: center"><TD style="PADDING-RIGHT: 1%; WIDTH: 49%"><asp:Button id="Button_Serach" onclick="Button_Serach_Click" runat="server" ValidationGroup="110" CssClass="Button" Text="جستجو"></asp:Button> </TD><TD style="PADDING-RIGHT: 1%; WIDTH: 49%"><asp:Button id="Button_Search2" onclick="Button_Search2_Click" runat="server" ValidationGroup="120" CssClass="Button" Text="جستجو"></asp:Button> </TD></TR></TBODY></TABLE>
</contenttemplate>
    </asp:UpdatePanel>
    </div>
</asp:Content>

