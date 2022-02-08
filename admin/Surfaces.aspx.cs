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
        public partial class Surfaces : System.Web.UI.Page
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


            public void FillData()
            {
                SqlObject sql = new SqlObject();
                DataTable Dt = new DataTable();
                Dt = sql.ExecuteKeyValue("ProdName", "ProdId", "Tproducts");
                DdlProdName.DataSource = Dt;
                DdlProdName.DataTextField = "TextField";
                DdlProdName.DataValueField = "ValueField";
                DdlProdName.DataBind();
                sql.Close();
            }
            protected void BtnSubmit_Click(object sender, EventArgs e)
            {
                int prodId = Convert.ToInt32(DdlProdName.SelectedValue);
                int qytUnits = Convert.ToInt32(TxtQty.Text);                
                int qytBox = Convert.ToInt32(TxtQtyBox.Text);
                User a = (User)Session["user"];
                int userId = a.Uid;
                string remarks = TxtRemarks.Text;
                SqlObject sql = new SqlObject();
                string str = "insert into Tsurfaces(ProdId,Quantity,QuantityUnitsBox,UserIdOpen,Remarks)values (";
                str += "" + prodId + "," + qytUnits + "," + qytBox + "," + userId + ",N'" + remarks + "')";
                sql.ExecuteNonQuery(str);
                str = "select max(SurfaceId) from Tsurfaces";
                int SurfaceId = sql.ExecuteScalarInt(str);
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "surfaceNumber(" + "'" + SurfaceId + "'" + ")", true);
                sql.Close();
            }
            protected void BtnSubmit2_Click(object sender, EventArgs e)
            {
                int SurfaceId = Convert.ToInt32(TxtSrfId.Text);
                string SurfaceLocator = TxtSrfLocator.Text;
                Surface surface = new Surface(SurfaceId);
                SqlObject sql = new SqlObject();
                string str = "update Tsurfaces set LocatorName = '"+ SurfaceLocator + "' where SurfaceId = " + SurfaceId;
                string str1 = "select StoragesLocatorId from TstoragesLocators where StorageId = 3 and LocatorName = '" + SurfaceLocator + "'";
                int NewLocatorId = sql.ExecuteScalarInt(str1);
                string str2 = "select StoragesLocatorId from TsurfacesLocators where SurfaceId = " + SurfaceId;
                int HoldLocatorId = sql.ExecuteScalarInt(str2);
                string str3 = "select StoragesLocatorIdHistory from TsurfacesLocators where SurfaceId = " + SurfaceId;
                string LocatorHistory = sql.ExecuteScalarString(str3);
                User a = (User)Session["user"];
                int userId = a.Uid;
                string str4 = "update TsurfacesLocators set StoragesLocatorId = " + NewLocatorId + ", StoragesLocatorIdHistory = '" + LocatorHistory + HoldLocatorId + "@', UserIdUpdate = " + userId;
                str4 += "where SurfaceId = " + SurfaceId;
                sql.ExecuteNonQuery(str4);
                sql.ExecuteNonQuery(str);
                sql.Close();
            }

            protected void SurfacesMap_Click(object sender, EventArgs e)
            {
                Response.Redirect("SurfacesMap.aspx");
            }
        }
    }    
}