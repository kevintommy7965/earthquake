<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EQ.aspx.cs" Inherits="WebApplication2.EQ" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
        html  body  #map-canvas {
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
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
    <script>
        var map;
        function initialize() {
            var mapOptions = {
                zoom: 8 ,
                center: new google.maps.LatLng(-34.397 , 150.644)
            };
            map = new google.maps.Map(document.getElementById('map-canvas') ,
                mapOptions);
        }

        google.maps.event.addDomListener(window , 'load' , initialize);

    </script>
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
                            <asp:LinkButton ID="lbAIMS" runat="server" OnClick="lbAIMS_Click" PostBackUrl="~/EQ.aspx#Link">關於AIMS</asp:LinkButton></li>
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
                                                <iframe width="420" height="315" src="https://www.youtube.com/embed/TUczbGUv-WM" frameborder="0" allowfullscreen></iframe>
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
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="allEQ" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>全台地震一覽</h2>
                                                <span class="byline">Taiwan Earthquake present events</span>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="historyEQ" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>歷年地震查詢</h2>
                                                <span class="byline">Taiwan Earthquake events</span>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="design" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>設計理念</h2>
                                                <span class="byline">Design concept</span>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdatePanel ID="openData" runat="server">
                                        <ContentTemplate>
                                            <div class="title">
                                                <h2>OPEN DATA使用說明</h2>
                                                <span class="byline">Open Data</span>
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
                        <h2> 即時救援資訊</h2>
                        <span class="byline">Instantly rescue imformation</span>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="upLocation" runat="server">
                <ContentTemplate>
                    <div class="title">
                        <br />
                        <h2> 全台救援地點一覽表</h2>
                        <span class="byline">Taiwan rescue whole location imformation</span>
                    </div>
                    <div id="map-canvas" style="height: 500px"></div>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="upEmail" runat="server">
                <ContentTemplate>
                    <div class="title">
                        <br />
                        <h2> 聯絡我們</h2>
                        <span class="byline">Contact us</span>
                        <br />
                        <br />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
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
