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


namespace earthquake.backstage
{
    public partial class insertEQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            cmd2.Parameters.AddWithValue("@EventId", dt.Rows[2][1].ToString());
            cmd2.ExecuteNonQuery();
            SqlDataReader dr2 = cmd2.ExecuteReader();
            if (!dr2.Read())
            {
                dr2.Dispose();
                dr2.Close();
                string[] latlong = dt.Rows[4][1].ToString().Split(',');
                string inserttoEQ = "insert into EQ (EventId , alert_title , alert_color , latitude , longitude , EventOriginTime , EventLocationName , EventDepth , EventMagnitudeDescription , Description) values (@EventId , @alert_title , @alert_color , @latitude , @longitude , @EventOriginTime , @EventLocationName , @EventDepth , @EventMagnitudeDescription , @Description)";
                SqlCommand cmd3 = new SqlCommand(inserttoEQ, cn2);
                cmd3.Connection = cn2;
                cmd3.Parameters.AddWithValue("@EventId", dt.Rows[2][1].ToString());
                cmd3.Parameters.AddWithValue("@alert_title", dt.Rows[0][1].ToString());
                cmd3.Parameters.AddWithValue("@alert_color", dt.Rows[1][1].ToString());
                cmd3.Parameters.AddWithValue("@latitude", latlong[0].ToString());
                cmd3.Parameters.AddWithValue("@longitude", latlong[1].ToString());
                cmd3.Parameters.AddWithValue("@EventOriginTime", dt.Rows[3][1].ToString());
                cmd3.Parameters.AddWithValue("@EventLocationName", dt.Rows[5][1].ToString());
                cmd3.Parameters.AddWithValue("@EventDepth", dt.Rows[6][1].ToString());
                cmd3.Parameters.AddWithValue("@EventMagnitudeDescription", dt.Rows[7][1].ToString());
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
    }
}