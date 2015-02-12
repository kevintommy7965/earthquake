<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EQsave.aspx.cs" Inherits="earthquake.EQsave" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>震在救你</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="http://fonts.googleapis.com/css?family=Karla:400 700" rel="stylesheet" />
    <link href="default.css" rel="stylesheet" type="text/css" media="all" />
    <link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
    <style>
        html body #map-canvas {
            height: 100%;
            margin: 20px;
            padding: 0px;
            margin-bottom: 30px;
        }

        #menu li:hover {
            background-color: #008C9A;
        }

        #menu li:active {
            background-color: aliceblue;
        }

        #menu li:visited {
            background-color: aqua;
        }

        .helpCSS {
            text-align: center;
            vertical-align: middle;
        }

        /*p{
            width:100%;
            height:200px;
        }*/
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="wrapper">
            <div id="header-wrapper">
                <div id="header" class="container">
                    <div id="logo">
                        <h1><a href="#">震在救你</a></h1>
                        <p>Design by <a href="#" rel="nofollow">AIMS</a></p>
                    </div>
                    <div id="banner">
                        <a href="#" class="image">
                            <img src="images/pic01.jpg" alt="" /></a>
                    </div>
                </div>
            </div>
            <div id="menu-wrapper">
                <div id="menu" class="container">
                    <ul>
                        <li>
                            <asp:LinkButton ID="lbHome" runat="server" OnClick="lbHome_Click">首頁</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="lbHelp" runat="server" OnClick="lbHelp_Click">即時求救資訊</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="lbLocation" runat="server" OnClick="lbLocation_Click">全台救援地點一覽表</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="lbAIMS" runat="server" OnClick="lbAIMS_Click" PostBackUrl="~/EQsave.aspx#Link">關於AIMS</asp:LinkButton></li>
                        <li>
                            <asp:LinkButton ID="lbEmail" runat="server" OnClick="lbEmail_Click">連絡我們</asp:LinkButton></li>
                    </ul>
                </div>
                <!-- end #menu -->
            </div>
            <asp:UpdatePanel ID="upHome" runat="server">
                <ContentTemplate>
                    <div id="page" class="container">
                        <table>
                            <tr>
                                <td>
                                    <div id="sidebar">
                                        <div class="box2">
                                            <div class="title">
                                                <h2>首頁</h2>
                                            </div>
                                            <ul class="style2">
                                                <li>
                                                    <asp:LinkButton ID="lbVideo" runat="server" OnClick="lbVideo_Click">宣傳影片</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbAboutEQ" runat="server" OnClick="lbAboutEQ_Click">關於地震</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbAllEQ" runat="server" OnClick="lbAllEQ_Click">全台地震一覽</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbHistoryEQ" runat="server" OnClick="lbHistoryEQ_Click">歷年地震查詢</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbDesign" runat="server" OnClick="lbDesign_Click">設計理念</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbOpenData" runat="server" OnClick="lbOpenData_Click">OPEN DATA使用說明</asp:LinkButton>
                                                </li>
                                                <li>
                                                    <asp:LinkButton ID="lbIMG" runat="server" OnClick="lbIMG_Click">功能規劃流程圖</asp:LinkButton>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="video" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>宣傳影片</h2>
                                                <span class="byline">Promotional video</span>
                                            </div>
                                            <p>
                                                <iframe width="583" height="480" src="https://www.youtube.com/embed/j_D9MlKzVDE" frameborder="0" allowfullscreen></iframe>
                                                </p>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="aboutEQ" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>關於地震</h2>
                                                <span class="byline">About Earthquake</span>
                                            </div>
                                            <p>
                                                地震，就是突然而強烈的震動。當地球內部長期積累起來的地應力（即單位面積上產生的抵抗外力的力）超過岩層所能承受的限度時，岩層便會突然發生斷裂或錯
                                                位，使積累的能量急劇地釋放出來，並以波動的震盪形式向四方八面傅播出去，令地面發生震動。 震動的發源處稱為震源 focus。大多數震源都在地殼和上地幔頂部，即岩石圈內。根據震源的深度，地震可分為三類：淺源地震（深度在0-70公里）、中源地震（深度在70-300公里）和深源地震（深度在300公里以上）。 由震源豎一垂直線至地面上的位置稱為震中 epicentre。震中是地表距離震源最近的地方，因此地震波最早到達這處，震動也最為強烈，破壞程度也最大。 地震而產生的波動叫地震波。在地球內部移動的地震波稱為體波，可分為縱波（初波／Ｐ波）和橫波（次波／Ｓ波）兩種。縱波傳播時，岩石物質振動的方向與傳播的方向一致，而且傳播速度較快；橫波傳播時，岩石物質的振動方向與傳播方向垂直，而且傳播速度較慢。所以，當地震發生時，人們的感覺是先顛後晃。祇能沿地面傳播的地震波稱為面波（Ｌ波），是縱波或橫波到達地面後，在一定條件下激發起來的次生波，速度比橫波還慢。一般當橫波或面波到達時，振動最為猛烈，破壞作用也最大。 地震是地球上極為普遍的自然現象之一。全世界每年大約發生五百萬次地震，平均起來，真是震個不停。幸而，人能夠感覺到的地震祇佔１％左右，能造成傷害的地震更祇是其中的極少數，而災難性的特大地震就更少了。據統計，全世界平均每年發生約18次能造成嚴重破壞的大地震，而特大的地震平均每年祇有一次。
                                            </p>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="allEQ" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>全台地震一覽</h2>
                                                <span class="byline">Taiwan Earthquake present events</span>
                                            </div>
                                            <p>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EQdbConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [EQ] ORDER BY [EventId] DESC"></asp:SqlDataSource>
                                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="EventId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:HyperLinkField DataNavigateUrlFields="EventId" DataNavigateUrlFormatString="EQsave.aspx?EventId={0}" DataTextField="EventId" HeaderText="EventId" />
                                                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                                    </Columns>
                                                    <EditRowStyle BackColor="#999999" />
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                </asp:GridView>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EQdbConnectionString %>" SelectCommand="SELECT * FROM [EQ] WHERE ([EventId] = @EventId)">
                                                    <SelectParameters>
                                                        <asp:QueryStringParameter Name="EventId" QueryStringField="EventId" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="841px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#EFF3FB" />
                                                </asp:DetailsView>
                                            </p>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="historyEQ" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>歷年地震查詢</h2>
                                                <span class="byline">Taiwan Earthquake events</span>
                                            </div>
                                            <p>
                                                <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged">
                                                    <asp:ListItem>請選擇</asp:ListItem>
                                                    <asp:ListItem>臺北市</asp:ListItem>
                                                    <asp:ListItem>基隆市</asp:ListItem>
                                                    <asp:ListItem> 新北市</asp:ListItem>
                                                    <asp:ListItem>宜蘭縣</asp:ListItem>
                                                    <asp:ListItem>新竹市</asp:ListItem>
                                                    <asp:ListItem>新竹縣</asp:ListItem>
                                                    <asp:ListItem>桃園縣</asp:ListItem>
                                                    <asp:ListItem>苗栗縣</asp:ListItem>
                                                    <asp:ListItem>臺中市</asp:ListItem>
                                                    <asp:ListItem>彰化縣</asp:ListItem>
                                                    <asp:ListItem>南投縣</asp:ListItem>
                                                    <asp:ListItem>嘉義市</asp:ListItem>
                                                    <asp:ListItem>嘉義縣</asp:ListItem>
                                                    <asp:ListItem>雲林縣</asp:ListItem>
                                                    <asp:ListItem>臺南市</asp:ListItem>
                                                    <asp:ListItem>高雄市</asp:ListItem>
                                                    <asp:ListItem>南海諸島</asp:ListItem>
                                                    <asp:ListItem>澎湖縣</asp:ListItem>
                                                    <asp:ListItem>屏東縣</asp:ListItem>
                                                    <asp:ListItem>臺東縣</asp:ListItem>
                                                    <asp:ListItem>花蓮縣</asp:ListItem>
                                                    <asp:ListItem>金門縣</asp:ListItem>
                                                    <asp:ListItem>連江縣</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="839px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <PagerSettings Mode="NextPreviousFirstLast"
                                                        FirstPageText="<<"
                                                        LastPageText=">>"
                                                        PageButtonCount="1"
                                                        Position="Top" />
                                                </asp:DetailsView>
                                            </p>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="design" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>設計理念</h2>
                                                <span class="byline">Design concept</span>
                                                <p>
                                                    根據地質學家研究表示，地球上約有90％的地震，都在環太平洋地震帶上發生，而台灣正位在此地震帶上！依據中央氣象局自 1991 ～ 2006 年這16 年的觀測資料顯示，台灣地區平均每年約發生 18,500 次地震，其中至少有 1,000 次為有感地震，1999年的921地震，更是讓大家記憶猶新。
以年份統計來分析，地震發生次數最多的是在 1999 年，主要是受到 921 地震之影響，該年共計發生了 49,919 次地震，其中有感地震達 3,228 次之多。而就災害性地震資料統計分析，從 1901 年至今計有 97 次地震，造成了重大的災害，因此可被列為災害性地震。
正因如此，居住在台灣的我們，怎麼能夠不瞭解該如何保護自己呢？
當地震來臨時，民眾很有可能錯過第一時間的逃生機會而導致受困。根據統計，在地震發生後的前三天獲救及存活的機率最高，意即若能即時把握受困後的72小時黃金救援時間，救災的效率及民眾的生命存活率將可以大大增加。在這72小時中，由於災害剛剛發生，通訊能力與資訊傳播的效率遠遠不如日常。受困的民眾需要求救，而未受困的民眾必須先確保自身安全而後伸出援手，若緊急情況，則需要公權力單位介入協助。該如何協調整合三方訊息，正是我們努力的方向！
根據資策會FIND結合Mobile First調查數據顯示，台灣持有智慧型手機及平板電腦的民眾已高達1,330萬人，而根據2014年「台灣寬頻網路使用調查」結果，台灣行動上網普及率達到47.27%，近半年曾經行動上網人數達988萬，與去年4月的普及率41.13%、855萬人相較，行動上網人數大幅成長，約新增了133萬人。若是考慮其他可攜性行動裝置的使用者，用戶數還將大大增加。
綜合以上資訊與考慮，本團隊將開發一款結合智慧型行動裝置與政府開放資料的APP，透過中央氣象局所提供的開放資料以及防災中心的開放資料，由部署於Microsoft Azure雲端伺服環境的服務程式自動擷取與整理後，發佈給本APP的使用者。同時，使用者也可以使用簡易的『一鍵式』通報系統發出求救訊號給伺服程式，伺服程式會依照裝置使用者的已知位置與情況通告附近的搜救人員或是救助中心。災害區域附近的未受困使用者也可以使用本系統聯繫關心的家人，並在安全許可的情形下，協助附近的被困使用者，化熱情為力量！
科技不止來自於人性，更應該以人為本，就讓科技讓你更安全﹑更幸福！
                                                </p>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="openData" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>OPEN DATA使用說明</h2>
                                                <span class="byline">Open Data</span>
                                                <p>
                                                    本系統使用政府開放資料蒐集地震與天然災害相關訊息，預計使用開放資料來自（但不限）於以下來源：
1.	中央氣象局（地震報告）
2.	國家災害防救科技中心（NCDR公開平台）
3.	Google 災害示警平台
系統使用部署於Microsoft Azure的服務程式自動擷取上述單位開放資料，加以彙整與篩選，進而儲存於資料庫，預計有以下運用方式：
1.	即時資訊：以JSON格式之訊息傳送於各類別行動裝置做即時預警
2.	歷史訊息：經整理後以視覺化資訊方式呈現作為研究與教育目的。
行動裝置端之應用程式（APP）主要服務於最終使用者。
使用者可以設定訊息提示方式與篩選規則（例如：震度與地點），以避免打擾日常生活。
當系統判斷某地震規模可能會對位在該地點的使用者造成危害後，APP會自動進入預警狀態，若使用者未在預定時間內進行系統安全回報，則APP會自動啟動求救模式。
進入求救模式之APP會傳遞相關地點與個人資訊給伺服器，並開啟省電求救模式（通訊功能的開啟與關閉間隔將依尚存電力以及搜救人員位置而定），伺服器會即時提供給搜救人員參考。
完成系統安全回報的使用者，則會由系統轉達平安訊息給預先設定好的聯絡人，避免過多私人聯繫影響救災資訊傳遞。同時，系統會通報其所在地點附近的已知災情，讓使用者選擇恰當的逃生路線或是參與搜救行動。
當搜救人員抵達聲音可傳播的搜救範圍後，受困者的APP將會發出明顯警示聲（如救護車的聲音），並於每次發出警示聲後提供民眾語音回傳功能至搜救單位，掌握受困者之狀況，以利搜救人員依據其危急程度進行救援，提供更多有利於搜救的資訊，提升搜救的效率及準確度。上述種種功能皆為自動啟動，以更能符合受困民眾的需求。
                                                </p>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="img" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>功能規劃流程圖</h2>
                                                <span class="byline">Flow chart</span>
                                            </div>
                                            <img src="images/流程圖.png" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="upHelp" runat="server">
                <ContentTemplate>
                    <div class="title">
                        <br />
                        <h2>即時救援資訊</h2>
                        <span class="byline">Instantly rescue imformation</span>
                    </div>
                    <p>
                        <div class="helpCSS">
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:EQdbConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [help] ORDER BY [Id] DESC" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [help] WHERE [Id] = @original_Id AND (([helpLat] = @original_helpLat) OR ([helpLat] IS NULL AND @original_helpLat IS NULL)) AND (([helpLong] = @original_helpLong) OR ([helpLong] IS NULL AND @original_helpLong IS NULL)) AND (([lastPower] = @original_lastPower) OR ([lastPower] IS NULL AND @original_lastPower IS NULL)) AND (([helpTime] = @original_helpTime) OR ([helpTime] IS NULL AND @original_helpTime IS NULL)) AND (([lastMove] = @original_lastMove) OR ([lastMove] IS NULL AND @original_lastMove IS NULL)) AND (([safe] = @original_safe) OR ([safe] IS NULL AND @original_safe IS NULL))" InsertCommand="INSERT INTO [help] ([helpLat], [helpLong], [lastPower], [helpTime], [lastMove], [safe]) VALUES (@helpLat, @helpLong, @lastPower, @helpTime, @lastMove, @safe)" UpdateCommand="UPDATE [help] SET [helpLat] = @helpLat, [helpLong] = @helpLong, [lastPower] = @lastPower, [helpTime] = @helpTime, [lastMove] = @lastMove, [safe] = @safe WHERE [Id] = @original_Id AND (([helpLat] = @original_helpLat) OR ([helpLat] IS NULL AND @original_helpLat IS NULL)) AND (([helpLong] = @original_helpLong) OR ([helpLong] IS NULL AND @original_helpLong IS NULL)) AND (([lastPower] = @original_lastPower) OR ([lastPower] IS NULL AND @original_lastPower IS NULL)) AND (([helpTime] = @original_helpTime) OR ([helpTime] IS NULL AND @original_helpTime IS NULL)) AND (([lastMove] = @original_lastMove) OR ([lastMove] IS NULL AND @original_lastMove IS NULL)) AND (([safe] = @original_safe) OR ([safe] IS NULL AND @original_safe IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_Id" Type="Int32" />
                                    <asp:Parameter Name="original_helpLat" Type="String" />
                                    <asp:Parameter Name="original_helpLong" Type="String" />
                                    <asp:Parameter Name="original_lastPower" Type="Double" />
                                    <asp:Parameter Name="original_helpTime" Type="String" />
                                    <asp:Parameter Name="original_lastMove" Type="String" />
                                    <asp:Parameter Name="original_safe" Type="Boolean" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="helpLat" Type="String" />
                                    <asp:Parameter Name="helpLong" Type="String" />
                                    <asp:Parameter Name="lastPower" Type="Double" />
                                    <asp:Parameter Name="helpTime" Type="String" />
                                    <asp:Parameter Name="lastMove" Type="String" />
                                    <asp:Parameter Name="safe" Type="Boolean" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="helpLat" Type="String" />
                                    <asp:Parameter Name="helpLong" Type="String" />
                                    <asp:Parameter Name="lastPower" Type="Double" />
                                    <asp:Parameter Name="helpTime" Type="String" />
                                    <asp:Parameter Name="lastMove" Type="String" />
                                    <asp:Parameter Name="safe" Type="Boolean" />
                                    <asp:Parameter Name="original_Id" Type="Int32" />
                                    <asp:Parameter Name="original_helpLat" Type="String" />
                                    <asp:Parameter Name="original_helpLong" Type="String" />
                                    <asp:Parameter Name="original_lastPower" Type="Double" />
                                    <asp:Parameter Name="original_helpTime" Type="String" />
                                    <asp:Parameter Name="original_lastMove" Type="String" />
                                    <asp:Parameter Name="original_safe" Type="Boolean" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="800px">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="helpLat" HeaderText="helpLat" SortExpression="helpLat" />
                                    <asp:BoundField DataField="helpLong" HeaderText="helpLong" SortExpression="helpLong" />
                                    <asp:BoundField DataField="lastPower" HeaderText="lastPower" SortExpression="lastPower" />
                                    <asp:BoundField DataField="helpTime" HeaderText="helpTime" SortExpression="helpTime" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </div>
                        <p>
                        </p>
                        <p>
                        </p>
                    </p>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="upLocation" runat="server">
                <ContentTemplate>
                    <div class="title">
                        <br />
                        <h2>全台救援地點一覽表</h2>
                        <span class="byline">Taiwan rescue whole location imformation</span>
                    </div>
                    <div id="mapView" runat="server" clientidmode="Static"></div>
                    <div id="map-canvas" style="height: 500px"></div>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Panel ID="upEmail" runat="server">
                <ContentTemplate>
                    <div class="title">
                        <br />
                        <h2>聯絡我們</h2>
                        <span class="byline">Contact us</span>
                        <br />
                        <br />
                    </div>
                    <p>
                        <div>
                            <table>
                                <tr>
                                    <td>E-mail：</td>
                                    <td>
                                        <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td>問題內容：</td>
                                    <td>
                                        <asp:TextBox ID="tbContent" runat="server" TextMode="MultiLine" Font-Size="Medium" Height="100px" Width="500px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <div id="erroMSG" runat="server" clientidmode="Static"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btSend" runat="server" Text="送出" OnClick="btSend_Click" /></td>
                                </tr>
                            </table>
                        </div>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                    </p>
                </ContentTemplate>
            </asp:Panel>
        </div>
        <a id="Link"></a>
        <div id="portfolio-wrapper">
            <div id="portfolio" class="container">
                <div id="column1">
                    <div class="title">
                        <h2>李亦君</h2>
                    </div>
                    <a href="#" class="image image-full">
                        <img src="images/Lee.jpg" alt="" /></a>
                    <p>英國南開普敦大學博士 電子與資訊科學</p>
                    <a href="#" class="icon icon-plus-sign button">Read More</a>
                </div>
                <div id="column2">
                    <div class="title">
                        <h2>許秉翔</h2>
                    </div>
                    <a href="#" class="image image-full">
                        <img src="images/Boss.jpg" alt="" /></a>
                    <p>中國文化大學碩士 資訊傳播所</p>
                    <a href="#" class="icon icon-plus-sign button">Read More</a>
                </div>
                <div id="column3">
                    <div class="title">
                        <h2>溫存立</h2>
                    </div>
                    <a href="#" class="image image-full">
                        <img src="images/Wen.jpg" alt="" /></a>
                    <p>中國文化大學學士 資訊傳播學系</p>
                    <a href="#" class="icon icon-plus-sign button">Read More</a>
                </div>
                <div id="column4">
                    <div class="title">
                        <h2>袁鼎皓</h2>
                    </div>
                    <a href="#" class="image image-full">
                        <img src="images/Yuan.jpg" alt="" /></a>
                    <p>中國文化大學學士 資訊傳播學系系</p>
                    <a href="#" class="icon icon-plus-sign button">Read More</a>
                </div>
            </div>
        </div>

        <div id="footer-wrapper">
            <div id="footer" class="container">
                <div id="box1">
                    <div class="title">
                        <h2>Latest Post</h2>
                    </div>
                    <ul class="style1">
                        <li><a href="#">link 1</a></li>
                        <li><a href="#">link 2</a></li>
                        <li><a href="#">link 3</a></li>
                        <li><a href="#">link 4</a></li>
                        <li><a href="#">link 5</a></li>
                        <li><a href="#">link 6</a></li>
                    </ul>
                </div>
                <div id="box2">
                    <div class="title">
                        <h2>Popular Links</h2>
                    </div>
                    <ul class="style1">
                        <li><a href="https://ossonazure.bhuntr.com/index.php" target="_blank">雲端防災應用開發者大賽</a></li>
                        <li><a href="http://www.cwb.gov.tw/V7/earthquake/" target="_blank">中央氣象局地震</a></li>
                        <li><a href="http://tec.earth.sinica.edu.tw/new_web/index.php" target="_blank">台灣地震科學中心</a></li>
                        <li><a href="http://data.gov.tw/" target="_blank">政府資料開放平台</a></li>
                    </ul>
                </div>
                <div id="box3">
                    <div class="title">
                        <h2>Follow Us</h2>
                    </div>
                    <p>Advance Internet Mobility Search.</p>
                    <ul class="contact">
                        <li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
                        <li><a href="#" class="icon icon-facebook"><span>Facebook</span></a></li>
                    </ul>
                    <a href="#" class="icon icon-plus-sign button">AIMS</a>
                </div>
            </div>
        </div>
        </div>
        <div id="copyright" class="container">
            <p>&copy; Untitled. All rights reserved. | Photos by <a href="#">AIMS</a> | Design by <a href="#" rel="nofollow">AIMS</a>.</p>
        </div>
    </form>
</body>
</html>
