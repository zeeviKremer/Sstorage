using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sstorage.BLL;
using Sstorage.DAL;


namespace Sstorage
{
    namespace admin
    {
        public partial class categorys : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    User a = (User)Session["user"];
                    if (a != null)
                    {
                        if (a.Rid > 1)
                            Response.Redirect("login.aspx");
                        else
                        {
                            LtlUserDitels.Text = "" + a.Name;
                        }
                    }
                    else
                        Response.Redirect("login.aspx");
                    FillData();
                }
            }

            void FillData()
            {
                SqlObject sObject1 = new SqlObject();
                DataTable Dt1 = new DataTable();
                Dt1 = sObject1.FillTable("Tcategorys");
                string html = "$*";
                for (int i = 0; i < Dt1.Rows.Count; i++)
                {
                    html += Dt1.Rows[i]["CatId"].ToString() + "*" + Dt1.Rows[i]["CatName"] + "*" + Dt1.Rows[i]["FatherId"].ToString() + "#*";
                }
                int size = html.Length;
                html = html.Substring(0, (size - 1));
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "z(" + "'" + html + "'" + ")", true);
                sObject1.Close();
                for (int i = 0; i < Dt1.Rows.Count; i++)
                {
                   if(Dt1.Rows[i]["FatherId"].ToString() != null)
                    {
                        for (int j = 0; j < Dt1.Rows.Count; j++)
                        {
                            if (Dt1.Rows[j]["CatId"].ToString() == Dt1.Rows[i]["FatherId"].ToString())
                                Dt1.Rows[i]["FatherName"] = Dt1.Rows[j]["CatName"];
                        }
                    }
                }
                RptTable.DataSource = Dt1;
                RptTable.DataBind();                
                SqlObject sObject3 = new SqlObject();
                DataTable Dt3 = new DataTable();
                Dt3 = sObject3.ExecuteKeyValue("CatName", "FatherId", "Tcategorys");
                DdlFatherId.DataSource = Dt3;
                DdlFatherId.DataTextField = "TextField";
                DdlFatherId.DataValueField = "ValueField";
                DdlFatherId.DataBind();
                DdlFatherId2.DataSource = Dt3;
                DdlFatherId2.DataTextField = "TextField";
                DdlFatherId2.DataValueField = "ValueField";
                DdlFatherId2.DataBind();
                sObject3.Close();
            }

            protected void BtnAddCat_Click(object sender, EventArgs e)
            {
                Category Cat = new Category();
                Cat.CatName = TxtCatName.Text;
                Cat.FatherId = int.Parse(Hidden1.Value);
                //if (Cat.FatherId != 0)
                //    Cat.FatherName = Hidden5.Value;
                TxtCatName.Text = "";
                int Exist = Cat.isExist(Cat);
                if (Exist == 0)
                {
                    Cat.AddCategory(Cat);
                    FillData();
                }
            }
            protected void BtnAddCat2_Click(object sender, EventArgs e)
            {
                Category Cat = new Category();
                Cat.CatId = int.Parse(Hidden3.Value);
                Cat.CatName = TxtCatName2.Text;
                Cat.FatherId = int.Parse(Hidden2.Value);
                TxtCatName2.Text = "";
                Cat.UpCategory(Cat);
                FillData();
            }
        }
    }    
}