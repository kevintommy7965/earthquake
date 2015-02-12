using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Xml;
using System.IO;
using System.Data;


public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
        string desstring = result.Substring(des, desend - des);//這是描述
       
        int start = result.IndexOf("<valueName>alert_title");
        int end = result.IndexOf("<valueName>EventPublisher");
        string con = "<info><parameter>" + result.Substring(start, end - start);
        //string head = "<parameter>" + con;
        con += "<valueName>test</valueName><value>test</value></parameter></info>";
        //Label1.Text = con;
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
        //GridView1.DataSource = dt;
        //GridView1.DataBind();
        int c = dt.Rows.Count;
        string z = "";
        for (int i = 0; i < c; i++)
        {
            z += dt.Rows[i][0].ToString() + "<br>";
        }
        //Label1.Text = z;

        //XmlDocument XmlDoc = new XmlDocument();
        //XmlDoc.LoadXml(con);
        //XmlNodeList NodeLists = XmlDoc.SelectNodes("info/parameter/value");
        //string testall = "";
        //foreach (XmlNode OneNode in NodeLists)
        //{
        //    testall += OneNode.InnerText + "<br>";
        //}
        //Label1.Text = testall;
    }
}