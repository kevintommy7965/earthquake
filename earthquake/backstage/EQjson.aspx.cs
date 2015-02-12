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
    public partial class EQjson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string forjson = "[";
            string sqlstr = "select * from EQ ";
            SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EQdbConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstr, cn);
            cn.Open();
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            int c = dt.Rows.Count;
            for(int i = 0; i < c; i++)
            {
                forjson += "{'EventId':'" + dt.Rows[i]["EventId"].ToString() +
                          "','alert_title':'" + dt.Rows[i]["alert_title"].ToString() +
                          "','alert_color':'" + dt.Rows[i]["alert_color"].ToString() +
                          "','latitude':'" + dt.Rows[i]["latitude"].ToString() +
                          "','longitude':'" + dt.Rows[i]["longitude"].ToString() +
                          "','EventOriginTime':'" + dt.Rows[i]["EventOriginTime"].ToString() +
                          "','EventLocationName':'" + dt.Rows[i]["EventLocationName"].ToString() +
                          "','EventDepth':'" + dt.Rows[i]["EventDepth"].ToString() +
                          "','EventMagnitudeDescription':'" + dt.Rows[i]["EventMagnitudeDescription"].ToString() +
                          "','Description':'" + dt.Rows[i]["Description"].ToString() + "'},";
            }
            string com = ",";
            forjson = forjson.Substring(0, forjson.Length - com.Length);
            forjson += "]";
            forjson = forjson.Replace("'", "\"");
            Response.Write(forjson);
            cn.Dispose();
            cn.Close();
            cmd.Dispose();
            cmd.Cancel();
            dr.Dispose();
            dr.Close();
            dt.Dispose();
            dt.Clear();
        }
    }
}