<%@ Page enableViewState="false" Language="C#" AutoEventWireup="true" CodeFile="EnterArticleComments.aspx.cs" Inherits="EnterArticleComments" EnableSessionState="True"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="CSS/grid.css" rel="stylesheet" type="text/css" />
    <link href="CSS/round.css" rel="stylesheet" type="text/css" />
    <link href="CSS/site.css" rel="stylesheet" type="text/css" />
    <link href="CSS/tool.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
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
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="grid" dir="rtl">
            <div class="rounded">
                <div class="top-outer">
                    <div class="top-inner">
                        <div class="top">
                            <h2>
                                نظرات شما در مورد مقاله</h2>
                        </div>
                    </div>
                </div>
                <div class="mid-outer">
                    <div class="mid-inner">
                        <div class="mid">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        نام شما:</td>
                                    <td style="width: 80%">
                                        <asp:TextBox ID="TextBox_Name" runat="server" CssClass="TextBox" ValidationGroup="4546" Width="50%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Name"
                                            ErrorMessage="لطفا نام خود را وارد نمایید" ValidationGroup="4546">*</asp:RequiredFieldValidator>&nbsp;
                                        <Ajax:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="TextBox_Name" WatermarkCssClass="WaterMark" WatermarkText="نام خود را در اینجا وراد نمایید">
                                        </Ajax:TextBoxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td>
                                        آدرس ایمیل:</td>
                                    <td>
                                        <asp:TextBox ID="TextBox_Email" runat="server" CssClass="TextBox" Width="50%"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_Email"
                                            ErrorMessage="لطفا آدرس ایمیل را در ست وارد نمایید" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="4546">*</asp:RegularExpressionValidator>
                                        <Ajax:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="TextBox_Email"
                                            WatermarkCssClass="WaterMark" WatermarkText="آدرس ایمیل را در اینجا وارد نمایید">
                                        </Ajax:TextBoxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td style="vertical-align: top">
                                        نظر شما:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_Comment"
                                            ErrorMessage="لطفا نظر خود را وارد نمایید" ValidationGroup="4546">*</asp:RequiredFieldValidator></td>
                                    <td style="color: #000000">
                                        <asp:TextBox ID="TextBox_Comment" runat="server" CssClass="TextBox" Height="74px"
                                            TextMode="MultiLine" Width="98%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Style="float: right"
                                            ValidationGroup="4546" />
                                        <Ajax:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server" TargetControlID="TextBox_Comment"
                                            WatermarkCssClass="WaterMark" WatermarkText="متن نظر خود را در اینجا وارد نمایید">
                                        </Ajax:TextBoxWatermarkExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center">
                                        &nbsp;
                                        <asp:Button ID="Button_Save" runat="server" CssClass="Button" OnClick="Button_Save_Click"
                                            Text="ثبت" ValidationGroup="4546" /><br />
                                        <Ajax:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="برای ثبت نظر خودمطمئن هستید؟"
                                            TargetControlID="Button_Save">
                                        </Ajax:ConfirmButtonExtender>
                                        <asp:SqlDataSource ID="SqlDataSource_EnterArticleComments" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer1 %>"
                                            InsertCommand="Articles_InsertComment" InsertCommandType="StoredProcedure" OnInserted="SqlDataSource_EnterArticleComments_Inserted"
                                            ProviderName="<%$ ConnectionStrings:LocalSqlServer.ProviderName %>">
                                            <InsertParameters>
                                                <asp:ControlParameter ControlID="TextBox_Name" Name="AddedBy" PropertyName="Text"
                                                    Type="String" />
                                                <asp:ControlParameter ControlID="TextBox_Email" Name="AddedByEmail" PropertyName="Text"
                                                    Type="String" />
                                                <asp:Parameter Name="AddedByIP" Type="String" />
                                                <asp:SessionParameter DefaultValue="0" Name="ArticleID" SessionField="ArticleID"
                                                    Type="Int32" />
                                                <asp:ControlParameter ControlID="TextBox_Comment" Name="Body" PropertyName="Text"
                                                    Type="String" />
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: center">
                                        <asp:Label ID="Label_Message" runat="server" ForeColor="Blue"></asp:Label></td>
                                </tr>
                            </table>
                                </ContentTemplate>
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
    </form>
</body>
</html>
