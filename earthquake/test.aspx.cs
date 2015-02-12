using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class test : System.Web.UI.Page
    {
        string y = "<table border='0'>";
        protected void Page_Load(object sender,  EventArgs e)
        {

        }

        protected void Button1_Click(object sender,  EventArgs e)
        {
            Label1.Text = "";
            string x = TextBox1.Text.ToString().Trim();
            string[] sArry = x.Split(',');
            foreach(string i in sArry)
            {
                try
                {
                    y += "<tr>";
                    double dd = Convert.ToDouble(i.Trim());                    
                    if (dd < 100.00)
                        y += "<td>" + i + "</td>";
                    y += "</tr>";
                }
                catch 
                {
                    y += "<tr><td>幹幹幹幹幹</td></tr>";
                }
            }
            y += "</table>";
            Label1.Text = y;
     }
 }
}