using Sstorage.BLL;
using Sstorage.DAL;
using Sstorage.admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sstorage
{
    namespace admin
    {
         public partial class ReturnCertificateToSupplaier : System.Web.UI.Page
    {
        User a = new User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                a = (User)Session["user"];
                if (a != null)
                {
                    if (a.Rid > 1)
                        Response.Redirect("login.aspx");
                    else
                    {
                        LtlUserDitels.Text = "" + a.Name;
                        //Ltlaaa.Text = CreaitTable(10);

                    }

                }
                else
                    Response.Redirect("login.aspx");
            }
        }
        public string CreateTable(List<ReturnCertificateToSupplaier> LstReturnToSupp)
        {
            string html = "";
            for (int i =0; i < LstReturnToSupp.Count; i ++)
            {
                    ReturnCertificateToSupplaier ReturnToSupp = new ReturnCertificateToSupplaier();
                    //ReturnToSupp
                      html += "<tr><td class=" + '"' + "column5" + '"' + " style =" + '"' + "text - align: center; " + '"' + " >"+/*+ LstReturnToSupp[i].Status + */"</td>";
                html += "<td class=" + '"' + "column5" + '"' + " style =" + '"' + "text - align: center; " + '"' + " > " + 1 + "</td >";
                html += "<td class=" + '"' + "column5" + '"' + " style =" + '"' + "text - align: center; " + '"' + " > " + 1 + "</td >";
                html += "<td class=" + '"' + "column5" + '"' + " style =" + '"' + "text - align: center; " + '"' + " > " + 1 + "</td >";
                html += "<td class=" + '"' + "column5" + '"' + " style =" + '"' + "text - align: center; " + '"' + " > " + 1 + "</td >";
                html += "<td class=" + '"' + "column5" + '"' + " style =" + '"' + "text - align: center; " + '"' + " > " + 1 + "</td ></tr >";
            }                                                      
            return html;
        }

        protected void DdlSerchCertificate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DdlSerchCertificate_TextChanged1(object sender, EventArgs e)
        {
            if (DdlSerchCertificate.SelectedIndex == 1 || DdlSerchCertificate.SelectedIndex == 2 || DdlSerchCertificate.SelectedIndex == 3)
            {
                TxtCerch.Visible = true;
                Btnserch.Visible = true;
                //if (TxtCerch.Text == "לא הוזן ערך")
                    TxtCerch.Text = "הזן פרמטר חיפוש";
                
            }
            else
            {
                TxtCerch.Visible = false;
                Btnserch.Visible = false;
            }
        }

        protected void BtnSerch_Click(object sender, EventArgs e)
        {

        }

        protected void Btnserch_Click1(object sender, EventArgs e)
        {
            if (TxtCerch.Text == ""|| TxtCerch.Text == "הזן פרמטר חיפוש")
            {
                TxtCerch.Text = "לא הוזן ערך"; 
            }
            else
            {
                if (TxtCerch.Text == "24/06/2021")
                    Ltlaaa.Text = ""/*CreaitTable(3)*/;
            }
        }
    }
    }   
}