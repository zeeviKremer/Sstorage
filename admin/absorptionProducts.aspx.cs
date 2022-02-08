using Sstorage.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Sstorage.BLL;

namespace Sstorage
{
    namespace admin
    {
        public partial class absorptionProducts : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if(!IsPostBack)
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
                SqlObject sql1 = new SqlObject();
                DataTable Dt1 = new DataTable();
                Dt1 = sql1.ExecuteKeyValue("SupplierName", "SupplierId", "Tsuppliers");
                DdlSupplierId.DataSource = Dt1;
                DdlSupplierId.DataTextField = "TextField";
                DdlSupplierId.DataValueField = "ValueField";
                DdlSupplierId.DataBind();
                sql1.Close();
                DdlSupplierId.Items.Insert(0, new ListItem("בחר ספק", "-1"));
                DdlSupplierId.Items[0].Attributes.Add("disabled", "true");
                DdlSupplierId.Items[0].Attributes.Add("selected", "true");

                SqlObject sql2 = new SqlObject();
                DataTable Dt2 = new DataTable();
                Dt2 = sql2.ExecuteKeyValue("StorageName", "StorageId", "Tstorages");
                DdlStorageId.DataSource = Dt2;
                DdlStorageId.DataTextField = "TextField";
                DdlStorageId.DataValueField = "ValueField";
                DdlStorageId.DataBind();
                sql2.Close();
                DdlStorageId.Items.Insert(0, new ListItem("בחר מחסן", "-1"));
                DdlStorageId.Items[0].Attributes.Add("disabled", "true");
                DdlStorageId.Items[0].Attributes.Add("selected", "true");

                SqlObject sql3 = new SqlObject();
                DataTable Dt3 = new DataTable();
                Dt3 = sql3.ExecuteKeyValue("ProdName", "ProdId", "Tproducts");
                DdlProdId.DataSource = Dt3;
                DdlProdId.DataTextField = "TextField";
                DdlProdId.DataValueField = "ValueField";
                DdlProdId.DataBind();
                sql3.Close();
                DdlProdId.Items.Insert(0, new ListItem("בחר מוצר", "-1"));
                DdlProdId.Items[0].Attributes.Add("disabled", "true");
                DdlProdId.Items[0].Attributes.Add("selected", "true");
            }

            protected void BtnSubmit_Click(object sender, EventArgs e)
            {
                int supplierId = Convert.ToInt32(DdlSupplierId.SelectedValue);
                int storageId  = Convert.ToInt32(DdlStorageId.SelectedValue);
                int prodId  = Convert.ToInt32(DdlProdId.SelectedValue);
                int qytUnits = Convert.ToInt32(TxtQytUnits.Text);
                int qytPacets = Convert.ToInt32(TxtQytPacets.Text);
                int qytBox = Convert.ToInt32(TxtQytBaxs.Text);
                int qytSurfaces = Convert.ToInt32(TxtQytSurfaces.Text);
                int userId = 1;   
                string shippingCertificate = "";
                if (RbNormalQuantity.Checked)
                    shippingCertificate = "כן";
                else if(RbNotNormalQuantity.Checked)
                    shippingCertificate = "לא";
                string NewFileName = "";
                if (FuShippingCertificate.HasFile)
                {
                    NewFileName = Funcs.RandomName(5);
                    string Aend = Path.GetExtension(FuShippingCertificate.FileName);
                    FuShippingCertificate.SaveAs(Server.MapPath("/uploads/images/products/") + NewFileName + Aend);
                    NewFileName += Aend;

                }
                string picName = NewFileName;                                
                string remarks = TxtRemarks.Text;
                SqlObject sql = new SqlObject();
                string str = "insert into TabsorptionProducts(SupplierId,StorageId,ProdId,Quantity,QuantityUnitsPeck,QuantityUnitsBox,QuantitySurfaces,UserIdGetting,ShippingCertificatePicName,QuantityProper,Remarks)values (";
                str += ""+ supplierId+","+ storageId+","+ prodId+","+ qytUnits+","+ qytPacets+","+ qytBox+","+ qytSurfaces+","+ userId+",N'"+ picName + "',N'"+ shippingCertificate + "',N'"+remarks +"')";
                sql.ExecuteNonQuery(str);
                sql.Close();
                LtlOK.Text = "הפעולה בוצע בהצלחה";
            }
        }
    }    
}