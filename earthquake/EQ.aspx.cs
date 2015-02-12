using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class EQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender,  EventArgs e)
        {
            //this.SmartNavigation = true;
            if(!IsPostBack)
            {
                aboutEQ.Visible = false;
                allEQ.Visible = false;
                historyEQ.Visible = false;
                design.Visible = false;
                openData.Visible = false;
                img.Visible = false;
                upHome.Visible = true;
                upHelp.Visible = false;
                upLocation.Visible = false;
                upEmail.Visible = false;
            }
        }

        protected void lbVideo_Click(object sender,  EventArgs e)
        {
            video.Visible = true;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbAboutEQ_Click(object sender,  EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = true;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbAllEQ_Click(object sender,  EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = true;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbHistoryEQ_Click(object sender,  EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = true;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbDesign_Click(object sender,  EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = true;
            openData.Visible = false;
            img.Visible = false;
        }

        protected void lbOpenData_Click(object sender,  EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = true;
            img.Visible = false;
        }

        protected void lbIMG_Click(object sender,  EventArgs e)
        {
            video.Visible = false;
            aboutEQ.Visible = false;
            allEQ.Visible = false;
            historyEQ.Visible = false;
            design.Visible = false;
            openData.Visible = false;
            img.Visible = true;
        }

        protected void lbHome_Click(object sender,  EventArgs e)
        {
            upHome.Visible = true;
            upHelp.Visible = false;
            upLocation.Visible = false;
            upEmail.Visible = false;
        }

        protected void lbHelp_Click(object sender,  EventArgs e)
        {
            upHelp.Visible = true;
            upHome.Visible = false;            
            upLocation.Visible = false;
            upEmail.Visible = false;
        }

        protected void lbLocation_Click(object sender,  EventArgs e)
        {
            upHome.Visible = false;
            upHelp.Visible = false;
            upLocation.Visible = true;
            upEmail.Visible = false;
        }

        protected void lbAIMS_Click(object sender,  EventArgs e)
        {

        }

        protected void lbEmail_Click(object sender,  EventArgs e)
        {
            upHome.Visible = false;
            upHelp.Visible = false;
            upLocation.Visible = false;
            upEmail.Visible = true;
        }
    }
}