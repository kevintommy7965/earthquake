using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Collections;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
using System.Xml;


namespace earthquake
{
    public partial class EQsave : System.Web.UI.Page
    {
        string mapviewcontent = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                video.Visible = false;
                aboutEQ.Visible = false;
                allEQ.Visible = true;
                historyEQ.Visible = false;
                design.Visible = false;
                openData.Visible = false;
                img.Visible = false;
                upHome.Visible = true;
                upHelp.Visible = false;
                upLocation.Visible = false;
                upEmail.Visible = false;
            }
            editScript();//放救援地點的圖
            //EQinfo();//把地震加入資料庫
            SqlDataSource3.DataBind();
            GridView2.DataBind();
        }
        public void editScript()
        {
            mapView.InnerHtml = "";
            string sqlstring = "select * from rescue";
            SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EQdbConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstring, cn);
            cn.Open();
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            int c = dt.Rows.Count;
            //Response.Write("<script>alert('"+dt.Rows[344]["address"].ToString()+"')</script>");
            mapviewcontent += "<script>";
            mapviewcontent += "function initialize() { " +
                              " var myLatlng = new google.maps.LatLng(25.0626404,121.5592497); " +
                              " var mapOptions = { " +
                              " zoom: 8, " +
                              " center: myLatlng " +
                              " };" +
                              " var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions); ";
            for (int i = 0; i < c; i++)
            {
                if (i != 343)
                {
                    mapviewcontent += " var contentString = ' " + dt.Rows[i]["name"].ToString() + "<br>" + dt.Rows[i]["tel"].ToString() + "<br>" + dt.Rows[i]["address"].ToString() + " ';";

                    mapviewcontent += " var infowindow" + i + "  = new google.maps.InfoWindow({ " +
                                      " content:contentString " +
                                      " }); ";
                    mapviewcontent += " var marker" + i + " = new google.maps.Marker({ " +
                                      " position: new google.maps.LatLng( " + dt.Rows[i]["latitute"].ToString() + " , " + dt.Rows[i]["longtitute"].ToString() + " ), " +
                                      " map: map, " +
                                      " title: ' " + dt.Rows[i]["team"].ToString() + " ' " +
                                      " }); " +
                                      " google.maps.event.addListener(marker" + i + ", 'click', function() { " +
                                      " infowindow" + i + ".open(map,marker" + i + "); " +
                                      " }); ";
                }
            }
            mapviewcontent += " } " +
                              " google.maps.event.addDomListener(window, 'load', initialize); " +
                              " </script> ";
            mapView.InnerHtml = mapviewcontent;
            cn.Dispose();
            cn.Close();
            cmd.Dispose();
            cmd.Cancel();
            dr.Dispose();
            dr.Close();
            dt.Dispose();
            dt.Clear();
        }
        public void EQinfo()
        {
            //將要取得HTML原如碼的網頁放在WebRequest.Create(@”網址” )
            WebRequest myRequest = WebRequest.Create(@"https://alerts.ncdr.nat.gov.tw/Capstorage/CWB/2015/Earthquake/CWB-EQ104006.cap");

            //Method選擇GET
            myRequest.Method = "GET";

            //取得WebRequest的回覆
            WebResponse myResponse = myRequest.GetResponse();

            //Streamreader讀取回覆
            StreamReader sr = new StreamReader(myResponse.GetResponseStream());

            //將全文轉成string
            string result = sr.ReadToEnd();
            //找 <description>
            int des = result.IndexOf(" <description>");
            //找</description>結尾
            int desend = result.IndexOf("</description>");
            string desStr = result.Substring(des, desend - des);//這是描述

            //接下來是其他的資訊
            int start = result.IndexOf("<valueName>alert_title");
            int end = result.IndexOf("<valueName>EventPublisher");
            string con = "<info><parameter>" + result.Substring(start, end - start);
            //把XML格式完整
            con += "<valueName>test</valueName><value>test</value></parameter></info>";           
            //新建XML文件類別
            XmlDocument Xmldoc = new XmlDocument();
            //從指定的字串載入XML文件
            Xmldoc.LoadXml(con);
            //建立此物件，並輸入透過StringReader讀取Xmldoc中的Xmldoc字串輸出
            XmlReader Xmlreader = XmlReader.Create(new System.IO.StringReader(Xmldoc.OuterXml));
            //建立DataSet
            DataSet ds = new DataSet();
            //透過DataSet的ReadXml方法來讀取Xmlreader資料
            ds.ReadXml(Xmlreader);
            //建立DataTable並將DataSet中的第0個Table資料給DataTable
            DataTable dt = ds.Tables[0];     
      
            //開始進SQL
            string findSameID = "select EventId from EQ where EventId = @EventId";//先確認是否已存過
            SqlConnection cn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EQdbConnectionString"].ConnectionString);
            SqlCommand cmd2 = new SqlCommand(findSameID, cn2);
            cn2.Open();
            cmd2.Connection = cn2;
            cmd2.Parameters.AddWithValue("EventId" , dt.Rows[2][1].ToString());
            cmd2.ExecuteNonQuery();
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if(!dr2.Read())
            {
                dr2.Dispose();
                dr2.Close();
                string[] latlong = dt.Rows[4][1].ToString().Split(',');             
                string inserttoEQ = "insert into EQ (EventId , alert_title , alert_color , latitude , longitude , EventOriginTime , EventLocationName , EventDepth , EventMagnitudeDescription , Description) values (@EventId , @alert_title , @alert_color , @latitude , @longitude , @EventOriginTime , @EventLocationName , @EventDepth , @EventMagnitudeDescription , @Description)";
                SqlCommand cmd3 = new SqlCommand(inserttoEQ, cn2);
                cmd3.Connection = cn2;
                cmd3.Parameters.AddWithValue("@EventId",dt.Rows[2][1].ToString());
                cmd3.Parameters.AddWithValue("@alert_title",dt.Rows[0][1].ToString());
                cmd3.Parameters.AddWithValue("@alert_color",dt.Rows[1][1].ToString());
                cmd3.Parameters.AddWithValue("@latitude",latlong[0].ToString());
                cmd3.Parameters.AddWithValue("@longitude",latlong[1].ToString());
                cmd3.Parameters.AddWithValue("@EventOriginTime",dt.Rows[3][1].ToString());
                cmd3.Parameters.AddWithValue("@EventLocationName",dt.Rows[5][1].ToString());
                cmd3.Parameters.AddWithValue("@EventDepth",dt.Rows[6][1].ToString());
                cmd3.Parameters.AddWithValue("@EventMagnitudeDescription",dt.Rows[7][1].ToString());
                cmd3.Parameters.AddWithValue("@Description", desStr);
                cmd3.ExecuteNonQuery();
                cmd3.Dispose();
                cmd3.Cancel();
            }
            cn2.Dispose();
            cn2.Close();
            cmd2.Dispose();
            cmd2.Cancel();
        }        
        protected void lbVideo_Click(object sender, EventArgs e)
        {
            video.Visible = true;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbAboutEQ_Click(object sender, EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = true;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbAllEQ_Click(object sender, EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = true;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbHistoryEQ_Click(object sender, EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = true;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbDesign_Click(object sender, EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = true;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbOpenData_Click(object sender, EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = true;
            img.Visible = false;
        }

        protected void lbIMG_Click(object sender, EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = true;
        }

        protected void lbHome_Click(object sender, EventArgs e)
        {
            upHome.Visible = true;
            upHelp.Visible = false;
            upLocation.Visible = false;
            upEmail.Visible = false;
        }

        protected void lbHelp_Click(object sender, EventArgs e)
        {
            upHelp.Visible = true;
            upHome.Visible = false;
            upLocation.Visible = false;
            upEmail.Visible = false;
            SqlDataSource3.DataBind();
            GridView2.DataBind();
        }

        protected void lbLocation_Click(object sender, EventArgs e)
        {
            upHome.Visible = false;
            upHelp.Visible = false;
            upLocation.Visible = true;
            upEmail.Visible = false;
        }

        protected void lbAIMS_Click(object sender, EventArgs e)
        {

        }

        protected void lbEmail_Click(object sender, EventArgs e)
        {
            upHome.Visible = false;
            upHelp.Visible = false;
            upLocation.Visible = false;
            upEmail.Visible = true;
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectCity = "select * from EQ where EventLocationName like N'%" + ddlCity.SelectedItem.Text.ToString() + "%'";
            SqlConnection cn3 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EQdbConnectionString"].ConnectionString);
            SqlCommand cmd4 = new SqlCommand(selectCity, cn3);
            cn3.Open();
            cmd4.Connection = cn3;
            cmd4.ExecuteNonQuery();
            SqlDataReader dr3 = cmd4.ExecuteReader();
            DataTable dt3 = new DataTable();
            dt3.Load(dr3);
            DetailsView2.DataSource = dt3;
            DetailsView2.DataBind();
            cn3.Dispose();
            cn3.Close();
            cmd4.Dispose();
            cmd4.Cancel();
            dr3.Dispose();
            dr3.Close();
            dt3.Dispose();
            dt3.Clear();
        }

        protected void btSend_Click(object sender, EventArgs e)
        {
            if (tbEmail.Text.Trim() == "")
                erroMSG.InnerHtml = "e-mail未填寫";
            else if (tbContent.Text.Trim() == "")
                erroMSG.InnerHtml = "問題內容未填寫";
            else
            {
                string QAstr = "insert into QA (email , question) values (@email , @question)";
                SqlConnection cn5 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EQdbConnectionString"].ConnectionString);
                SqlCommand cmd5 = new SqlCommand(QAstr, cn5);
                cn5.Open();
                cmd5.Connection = cn5;
                cmd5.Parameters.AddWithValue("@email", tbEmail.Text.ToString().Trim());
                cmd5.Parameters.AddWithValue("@question", tbContent.Text.ToString().Trim());
                cmd5.ExecuteNonQuery();
                cn5.Dispose();
                cn5.Close();
                cmd5.Dispose();
                cmd5.Cancel();
                tbEmail.Text = "";
                tbContent.Text = "";
                Response.Write("<script>alert('感謝您寶貴的建議，本團隊將會盡速回進給您！');window.location='http://earthquake6215.azurewebsites.net/EQsave';</script>");
            }
        }
    }
}