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
    public partial class getHelp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string helpLat = Request.QueryString["helpLat"];
            string helpLong = Request.QueryString["helpLong"];
            string lastPower = Request.QueryString["lastPower"];
            string helpTime = Request.QueryString["helpTime"];
            string lastMove = Request.QueryString["lastMove"];
            string safe = Request.QueryString["safe"];
            if (helpLat != "" && helpLong != "" && lastPower != "" && helpTime != "" && lastMove != "" && safe != "")
            {
                string insertHelp = "insert into help (helpLat , helpLong , lastPower , helpTime , lastMove , safe) values (@helpLat , @helpLong , @lastPower , @helpTime , @lastMove , @safe)";
                SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["EQdbConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand(insertHelp, cn);
                cn.Open();
                cmd.Connection = cn;
                cmd.Parameters.AddWithValue("@helpLat", helpLat);
                cmd.Parameters.AddWithValue("@helpLong", helpLong);
                cmd.Parameters.AddWithValue("@lastPower", Convert.ToSingle(lastPower));
                cmd.Parameters.AddWithValue("@helpTime", helpTime);
                cmd.Parameters.AddWithValue("@lastMove", lastMove);
                cmd.Parameters.AddWithValue("@safe", isINT(safe));
                cmd.ExecuteNonQuery();
                cn.Dispose();
                cn.Close();
                cmd.Dispose();
                cmd.Cancel();
                Response.Write("ok");
            }
            else
                Response.Write("failed");
        }
        public Boolean isINT(string str)
        {
            try
            {
                int i = Convert.ToInt32(str);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}