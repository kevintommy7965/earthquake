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
    public partial class helpJson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string forjson = "[";
            string sqlstr = "select * from help ";
            SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EQdbConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sqlstr, cn);
            cn.Open();
            cmd.Connection = cn;
            cmd.ExecuteNonQuery();
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            int c = dt.Rows.Count;
            for (int i = 0; i < c; i++)
            {
                forjson += "{'Id':'" + dt.Rows[i]["Id"].ToString() +
                          "','helpLat':'" + dt.Rows[i]["helpLat"].ToString() +
                          "','helpLong':'" + dt.Rows[i]["helpLong"].ToString() +
                          "','lastpower':'" + dt.Rows[i]["lastPower"].ToString() +                         
                          "','helpTime':'" + dt.Rows[i]["helpTime"].ToString() +
                          "'},";
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