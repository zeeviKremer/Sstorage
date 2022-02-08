using Sstorage.BLL;
using Sstorage.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sstorage
{
    namespace admin
    {
        public partial class storagrs : System.Web.UI.Page
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
                Dt1 = sObject1.FillTable("Tstorages");
                DataTable Dt2 = new DataTable();
                Dt2 = sObject1.FillTable("Tcitys");                
                string html = "$*";
                for (int i = 0; i < Dt1.Rows.Count; i++)
                {
                    html += Dt1.Rows[i]["StorageId"].ToString() + "*" + Dt1.Rows[i]["StorageName"] + "*";
                    //for(int j = 0;j<Dt2.Rows.Count;j++)
                    //{
                    //    if(Dt2.Rows[j]["CityId"].ToString()== Dt1.Rows[i]["CityId"].ToString())
                    //        html += Dt2.Rows[j]["CityName"];
                    //}
                    html += Dt1.Rows[i]["CityName"] + "*" + Dt1.Rows[i]["Address"] + "*" + Dt1.Rows[i]["DirectorName"] + "*" + Dt1.Rows[i]["Phone"] + "*" + Dt1.Rows[i]["Email"] + "#*";
                }
                int size = html.Length;
                html = html.Substring(0, (size - 1));                
                string html2 = "$*";
                for (int i = 0; i < Dt2.Rows.Count; i++)
                {
                    html2 += Dt2.Rows[i]["CityId"].ToString() + "*" + Dt2.Rows[i]["CityName"] + "#*";
                }
                int size2 = html2.Length;
                html2 = html2.Substring(0, (size2 - 1));
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "z(" + "'" + html +"~"+ html2 + "'" + ")", true);
                sObject1.Close();                                
                RptTable.DataSource = Dt1;
                RptTable.DataBind();
                SqlObject sObject3 = new SqlObject();
                DataTable Dt3 = new DataTable();
                Dt3 = sObject3.ExecuteKeyValue("CityName", "CityId", "Tcitys");
                DdlCity.DataSource = Dt3;
                DdlCity.DataTextField = "TextField";
                DdlCity.DataValueField = "ValueField";
                DdlCity.DataBind();
                DdlCity2.DataSource = Dt3;
                DdlCity2.DataTextField = "TextField";
                DdlCity2.DataValueField = "ValueField";
                DdlCity2.DataBind();
            }            
            protected void BtnAddStor_Click(object sender, EventArgs e)
            {
                Storages stor = new Storages();
                stor.StorageName = TxtName.Text;               
                stor.Address = TxtAddress.Text;
                stor.DirectorName = TxtDcrName.Text;
                stor.Phone = TxtPhone.Text;
                stor.Email = TxtEmail.Text;
                stor.CityId = int.Parse(Hidden1.Value);
                SqlObject Sql = new SqlObject();
                stor.CityName = (string)Sql.ExecuteScalarString("select CityName from Tcitys where CityId = " + stor.CityId);                
                TxtName.Text = "";
                TxtAddress.Text = "";
                TxtDcrName.Text = "";
                TxtPhone.Text = "";
                TxtEmail.Text = "";
                int Exist = stor.isExist(stor);
                if (Exist == 0)
                {
                    stor.AddStorage(stor);
                    FillData();
                }
            }
            protected void BtnAddStor2_Click(object sender, EventArgs e)
            {
                Storages stor = new Storages();
                stor.StorageId = int.Parse(Hidden3.Value);
                stor.StorageName = TxtName2.Text;
                stor.Address = TxtAddress2.Text;
                stor.DirectorName = TxtDcrName2.Text;
                stor.Phone = TxtPhone2.Text;
                stor.Email = TxtEmail2.Text;
                stor.CityId = int.Parse(Hidden2.Value);
                stor.CityName = Hidden12.Value;
                TxtName2.Text = "";
                TxtAddress2.Text = "";
                TxtDcrName2.Text = "";
                TxtPhone2.Text = "";
                TxtEmail2.Text = "";
                stor.UpStorage(stor);
                FillData();
            }
        }
    }   
}