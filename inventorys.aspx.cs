using Sstorage.BLL;
using Sstorage.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sstorage
{
    namespace admin
    {
        public partial class inventorys : System.Web.UI.Page
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
            protected void FillData()
            {
                SqlObject Sql = new SqlObject();
                DataTable Dt1 = new DataTable();
                Dt1 = Sql.ExecuteKeyValue("ProdName", "ProdId", "Tproducts");
                DdlSerch.DataSource = Dt1;
                DdlSerch.DataTextField = "TextField";
                DdlSerch.DataValueField = "ValueField";
                DdlSerch.DataBind();
                DataTable Dt2 = new DataTable();
                Dt2 = Sql.ExecuteKeyValue("ShorBarcode", "ProdId", "Tproducts");
                DdlSerch2.DataSource = Dt2;
                DdlSerch2.DataTextField = "TextField";
                DdlSerch2.DataValueField = "ValueField";
                DdlSerch2.DataBind();
                DataTable Dt3 = new DataTable();
                Dt3 = Sql.ExecuteKeyValue("Barcode", "ProdId", "Tproducts");
                DdlSerch3.DataSource = Dt3;
                DdlSerch3.DataTextField = "TextField";
                DdlSerch3.DataValueField = "ValueField";
                DdlSerch3.DataBind();
                Sql.Close();
                string str1 = "$*";
                SqlObject Sql1 = new SqlObject();
                List<Product> LstProds = new List<Product>();
                LstProds = ProductData.GetAllProduct();
                Sql1.Close();
                for (int i= 0;i<LstProds.Count;i++)
                {
                    str1 += LstProds[i].ProdId + "*" + LstProds[i].ProdName + "*" + LstProds[i].ShorBarcode + "*" + LstProds[i].Barcode + "#*";
                }
                str1 = str1.Substring(0, str1.Length - 1);
                str.Text = str1;
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "aa(" + "'" + str1 + "'" + ")", true);
            }

            protected void DdlSerch_TextChanged(object sender, EventArgs e)
            {                              
                    Inventorys invt = new Inventorys();
                    Product Prod = new Product();
                    Prod.ProdId = int.Parse(DdlSerch.SelectedValue);                    
                    List<Inventorys> LstInvt = new List<Inventorys>();
                    LstInvt = invt.GetInventorysByPid(Prod);
                    SqlObject Sql1 = new SqlObject();
                    DataTable Dt1 = new DataTable();
                    Dt1 = Sql1.FillTable("Tstorages");
                    Sql1.Close();
                    for (int i = 0; i < LstInvt.Count; i++)
                    {
                        for (int j = 0; j < Dt1.Rows.Count; j++)
                        {
                            if (LstInvt[i].StoragesLocatorId.ToString() == Dt1.Rows[j]["StorageId"].ToString())
                                LstInvt[i].StorageName = Dt1.Rows[j]["StorageName"].ToString();
                        }
                    }
                    string str = LstInvt[LstInvt.Count - 1].LocatorName;
                    string s = "$" + str + "$";                                                          
                    LstInvt.RemoveAt(LstInvt.Count - 1);
                    RptTable.DataSource = LstInvt;
                    RptTable.DataBind();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "func1(" + "'" + s + "'" + ")", true);
            }            
            protected void DdlSerch_TextChanged1(object sender, EventArgs e)
            {

            }

            protected void DdlSerch2_TextChanged(object sender, EventArgs e)
            {
                Inventorys invt = new Inventorys();
                Product Prod = new Product();
                Prod.ProdId = int.Parse(DdlSerch.SelectedValue);
                List<Inventorys> LstInvt = new List<Inventorys>();
                LstInvt = invt.GetInventorysByPid(Prod);
                SqlObject Sql1 = new SqlObject();
                DataTable Dt1 = new DataTable();
                Dt1 = Sql1.FillTable("Tstorages");
                Sql1.Close();
                for (int i = 0; i < LstInvt.Count; i++)
                {
                    for (int j = 0; j < Dt1.Rows.Count; j++)
                    {
                        if (LstInvt[i].StoragesLocatorId.ToString() == Dt1.Rows[j]["StorageId"].ToString())
                            LstInvt[i].StorageName = Dt1.Rows[j]["StorageName"].ToString();
                    }
                }
                string str = LstInvt[LstInvt.Count - 1].LocatorName;
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "func1(" + "'" + str + "'" + ")", true);
                LstInvt.RemoveAt(LstInvt.Count - 1);
                RptTable.DataSource = LstInvt;
                RptTable.DataBind();
            }

            protected void DdlSerch3_TextChanged(object sender, EventArgs e)
            {
                Inventorys invt = new Inventorys();
                Product Prod = new Product();
                Prod.ProdId = int.Parse(DdlSerch.SelectedValue);
                List<Inventorys> LstInvt = new List<Inventorys>();
                LstInvt = invt.GetInventorysByPid(Prod);
                SqlObject Sql1 = new SqlObject();
                DataTable Dt1 = new DataTable();
                Dt1 = Sql1.FillTable("Tstorages");
                Sql1.Close();
                for (int i = 0; i < LstInvt.Count; i++)
                {
                    for (int j = 0; j < Dt1.Rows.Count; j++)
                    {
                        if (LstInvt[i].StoragesLocatorId.ToString() == Dt1.Rows[j]["StorageId"].ToString())
                            LstInvt[i].StorageName = Dt1.Rows[j]["StorageName"].ToString();
                    }
                }
                string str = LstInvt[LstInvt.Count - 1].LocatorName;
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "func1(" + "'" + str + "'" + ")", true);
                LstInvt.RemoveAt(LstInvt.Count - 1);
                RptTable.DataSource = LstInvt;
                RptTable.DataBind();
            }
        }
    }    
}