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
        public partial class transferCertificate : System.Web.UI.Page
        {
            int CertificateId;
            User  a = new User();
            string ColumnName ;
            int Pid;
            int flag = 0;                           
            TransferCertificate TC = new TransferCertificate();
            List<TtransferCertificateDetails> LstTCD = new List<TtransferCertificateDetails>();
            List<TCDvalue> LstTcdValue = new List<TCDvalue>();            
            TtransferCertificateDetails TCD = new TtransferCertificateDetails();
            //List<Product> LstProducts = new List<Product>();
            // LstProducts = (List<Product>)Application["Products"];
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    a = (User)Session["user"];
                    Application["flag"] = flag;
                    if (a != null)
                    {
                        if (a.Rid > 1)
                            Response.Redirect("login.aspx");
                        else
                        {
                            LtlUserDitels.Text = "" + a.Name;
                        }
                        FillData();
                        DateTime date = DateTime.Today;
                        string date1 = Convert.ToString(date);
                        TxtDate.Text = date1.Substring(0, 10);

                    }
                    else
                        Response.Redirect("login.aspx");
                    //p2.Visible = false;
                    Panel3.Visible = true;
                    List<Product> LstProducts = new List<Product>();
                    Product product = new Product();
                    LstProducts = product.GetAllProduct();
                    Application["Products"] = LstProducts;
                    List<StoragesLocators> LstStoragesLocators = new List<StoragesLocators>();
                    StoragesLocators SL = new StoragesLocators();
                    LstStoragesLocators = SL.GetAllLocators();
                    Application["StoragesLocators"] = LstStoragesLocators;

                    List<StoragesLocatorsProducts> LstStoragesLocatorsProducts = new List<StoragesLocatorsProducts>();
                    StoragesLocatorsProducts SLP = new StoragesLocatorsProducts();
                    LstStoragesLocatorsProducts = SLP.GetAllSLP();
                    Application["StoragesLocatorsProducts"] = LstStoragesLocatorsProducts;




                }


            }
            public void FillData()
            {
                SqlObject sql = new SqlObject();
                DataTable Dt = new DataTable();
                Dt = sql.ExecuteKeyValue("StorageName", "StorageId", "Tstorages");
                DdlStorageSender.DataSource = Dt;
                DdlStorageSender.DataTextField = "TextField";
                DdlStorageSender.DataValueField = "ValueField";
                DdlStorageSender.DataBind();
                Dt = sql.ExecuteKeyValue("StorageName", "StorageId", "Tstorages");
                DdlStorageGeter.DataSource = Dt;
                DdlStorageGeter.DataTextField = "TextField";
                DdlStorageGeter.DataValueField = "ValueField";
                DdlStorageGeter.DataBind();                
                sql.Close();
                List<TransferCertificate> LstTC = new List<TransferCertificate>();                
                TransferCertificate TC = new TransferCertificate();
                LstTC = TC.GetTenCertificats();
                List<Storages> LstStorages = new List<Storages>();
                Storages storage = new Storages();
                LstStorages = storage.GetAllStorages();
                for(int i =0; i < LstTC.Count; i ++)
                {
                    for(int j =0;j< LstStorages.Count;j++)
                    {
                        if (LstStorages[j].StorageId == LstTC[i].StorageGeterId)
                            LstTC[i].StorageGeterName = LstStorages[j].StorageName;
                        if (LstStorages[j].StorageId == LstTC[i].StorageSenderId)
                            LstTC[i].StorageSenderName = LstStorages[j].StorageName;
                    }
                }
                List<User> LstUsers = new List<User>();
                User user = new User();
                LstUsers = user.GetAllUsers();
                for (int i = 0; i < LstTC.Count; i++)
                {
                    for (int j = 0; j < LstUsers.Count; j++)
                    {
                        if (LstUsers[j].Uid == LstTC[i].UserId)
                            LstTC[i].UserName = LstUsers[j].Name;                        
                    }
                }
                Repeater1.DataSource = LstTC;
                Repeater1.DataBind();
            }

            protected void BtnOpenCertificate_Click(object sender, EventArgs e)
            {
                BtnOpenCertificate.Attributes.Add("AutoPostback", "true");
                int StorageSenderId = Convert.ToInt32( DdlStorageSender.SelectedValue);
                int StorageGeterId = Convert.ToInt32(DdlStorageGeter.SelectedValue);
                int isExist = TransferCertificate.isExist(StorageSenderId, StorageGeterId);
                if (isExist != 0)
                {
                    string str = "קיימת תעודה בסטטוס טיוטא ממחסן " + DdlStorageSender.Text + " למחסן "+ DdlStorageGeter.Text;
                    //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "ModalMsege(" + "'" + str + "'" + ")", true);     
                    LtlAaa.Text = str;
                }
                else
                {               
                    Application["StorageSenderId"] = StorageSenderId;
                    Application["StorageGeterId"] = StorageGeterId;
                    TCDvalue tcdValue = new TCDvalue();
                    LstTcdValue.Add(tcdValue);
                    Application["LstTcdValue"] = LstTcdValue;
                    a = (User)Session["user"];
                    TC.UserId = a.Uid;
                    TC.StorageSenderId = StorageSenderId;
                    TC.StorageGeterId =  StorageGeterId;
                    DateTime date = DateTime.Now;
                    TC.Date = date;
                    int id = TC.OpenTransferCertificate(TC);
                    TCD.CertificateId = id;               
                    Application["id"] = id;
                    Application["LstTCD"] = LstTCD;
                    List<TransferCertificate> LstTC = new List<TransferCertificate>();
                    Repeater1.DataSource = LstTC;
                    Repeater1.DataBind();
                    ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "qwer()", true);
                    Repeater2.DataSource = LstTCD;
                    Repeater2.DataBind();
                    Panel1.Visible = true;
                    SqlObject sql = new SqlObject();
                    DataTable Dt = new DataTable();                
                    Dt = sql.ExecuteKeyValueSorting("ProdName", "ProdId", "Tproducts" , "ProdName");
                    DdlProdName.DataSource = Dt;
                    DdlProdName.DataTextField = "TextField";
                    DdlProdName.DataValueField = "ValueField";
                    DdlProdName.DataBind();
                    string SenderQuery , GeterQuery , StorageSender, StorageGeter;
                    SenderQuery = " select StorageName from Tstorages where StorageId =" + StorageSenderId;
                    GeterQuery = " select StorageName from Tstorages where StorageId =" + StorageGeterId;
                    StorageSender = sql.ExecuteScalarString(SenderQuery);
                    StorageGeter = sql.ExecuteScalarString(GeterQuery);
                    Dt = sql.ExecuteKeyValueSorting("StatusName", "StatusId", "Tstatuses", "StatusName");
                    DdlSttus.DataSource = Dt;
                    DdlSttus.DataTextField = "TextField";
                    DdlSttus.DataValueField = "ValueField";
                    DdlSttus.DataBind();
                    sql.Close();
                    i.Text = "תעודה מספר   " + TCD.CertificateId + "  זמן פתיחת התעודה    " + TC.Date + "מחסן שולח" + "   " + StorageSender + "מחסן מקבל   " + "   " + StorageGeter ;                
                    Panel2.Visible = true;
                    Panel3.Visible = false;
                    Panel4.Visible = true;
                    Panel5.Visible = false;
                }
            }
            
            //protected void DdlActions_TextChanged1(object sender, EventArgs e)
            //{
            //    TransferCertificate TC = new TransferCertificate();
            //    if (DdlActions.SelectedValue == "1")
            //    {                    
            //        Pid = TC.Pull();
            //        List<Inventorys> LstInventorys = new List<Inventorys>();
            //        LstInventorys = (List<Inventorys>)Application["Inventorys"];
            //        Inventorys Inventory = new Inventorys();
            //        for(int i =0; i < LstInventorys.Count;i++)
            //        {
            //            if(LstInventorys[i].ProdId == Pid)
            //            {
            //                Inventory.InventoryId = LstInventorys[i].InventoryId;
            //                Inventory.ProdId = LstInventorys[i].ProdId;
            //                Inventory.StoragesLocatorId = LstInventorys[i].StoragesLocatorId;
            //                Inventory.Quantity = LstInventorys[i].Quantity;
            //            }
            //        }

            //        List<StoragesLocators> LstStoragesLocators = new List<StoragesLocators>();
            //        LstStoragesLocators = (List<StoragesLocators>)Application["StoragesLocators"];
            //        StoragesLocators SL = new StoragesLocators();
            //        for (int i = 0; i < LstStoragesLocators.Count; i++)
            //        { 
            //            if(LstStoragesLocators[i].StoragesLocatorId == Inventory.StoragesLocatorId&& LstStoragesLocators[i].StorageId==3)
            //            {
            //                SL.StoragesLocatorId = LstStoragesLocators[i].StoragesLocatorId;
            //                SL.StorageId = LstStoragesLocators[i].StorageId;
            //                SL.LocatorName = LstStoragesLocators[i].LocatorName;
            //            }

            //        }

            //        List<StoragesLocatorsProducts> LstStoragesLocatorsProducts = new List<StoragesLocatorsProducts>();
            //        LstStoragesLocatorsProducts = (List<StoragesLocatorsProducts>)Application["StoragesLocatorsProducts"];
            //        StoragesLocatorsProducts SLP = new StoragesLocatorsProducts();
            //        for(int i =0; i < LstStoragesLocatorsProducts.Count; i ++)
            //        {
            //            if(LstStoragesLocatorsProducts[i].StoragesLocatorId==SL.StoragesLocatorId)
            //            {
            //                SLP.StoragesLocatorsProductsId = LstStoragesLocatorsProducts[i].StoragesLocatorsProductsId;
            //                SLP.StoragesLocatorId = LstStoragesLocatorsProducts[i].StoragesLocatorId;
            //                SLP.ProdId = LstStoragesLocatorsProducts[i].ProdId;
            //                SLP.Maximum = LstStoragesLocatorsProducts[i].Maximum;
            //                SLP.Minimum = LstStoragesLocatorsProducts[i].Minimum;
            //            }
            //        }

            //        List<Surface> LstSurfaces = new List<Surface>();
            //        LstSurfaces = (List<Surface>)Application["Surfaces"];
            //        int count = 0;                    
            //        for(int i = 0; i < LstSurfaces.Count; i ++)
            //        {
            //            if (LstSurfaces[i].ProdId == Pid)
            //                count++;
            //        }
            //        Surface[] Surf = new Surface[count];
            //        int flag = 0;
            //        for (int i = 0; i < LstSurfaces.Count; i++)
            //        {                        
            //            if(LstSurfaces[i].ProdId == Pid)
            //            {
            //                Surface Surf1 = new Surface();
            //                Surf1.SurfaceId = LstSurfaces[i].SurfaceId;
            //                Surf1.ProdId = LstSurfaces[i].ProdId;
            //                Surf1.Quantity = LstSurfaces[i].Quantity;
            //                Surf1.Remarks = LstSurfaces[i].Remarks;
            //                Surf[flag] = Surf1;                            
            //                flag++;
            //            }                                                        
            //        }
            //        List<SurfacesLocators> LstSurfacesLocators = new List<SurfacesLocators>();
            //        LstSurfacesLocators = (List<SurfacesLocators>)Application["SurfacesLocators"];
                    
            //        string html = "מוצר להורדה <br />";
            //        html += "קוד מוצר : " + Pid + " מיקום בליקוט : " + SL.LocatorName + "<br /> מיקומי משטחים ברזרבות : <select name =" + '"' + "select1" + '"' + " style="+'"'+ "width: 280px;" + '"'+" >";
            //        html += "<option value= "+'"'+"0"+'"'+ " Disabled="+'"'+"True"+'"'+" Selected="+'"'+"True"+'"'+" >בחר משטח </option>";
            //        for(int i = 0; i <Surf.Length; i ++)
            //        { 
            //           for(int j = 0; j < LstSurfacesLocators.Count; j ++)
            //           {
            //               if(Surf[i].SurfaceId== LstSurfacesLocators[j].SurfaceId)
            //                {
            //                    int SurfLocatorId = LstSurfacesLocators[j].StoragesLocatorId;
            //                    for(int k = 0; k < LstStoragesLocators.Count; k ++)
            //                    {
            //                        if(LstStoragesLocators[k].StoragesLocatorId == SurfLocatorId)
            //                        {
            //                            string SurfaceLocatorName = (string)LstStoragesLocators[k].LocatorName;
            //                            html += "<option value=" + '"' + (i + 1) + '"' + ">" + " מספר משטח " + Surf[i].SurfaceId + ".................."+ SurfaceLocatorName+ " </option>";
                                       
                                        
            //                        }
            //                    }
            //                }
            //           }
                        
                        
            //        }
            //        html += "</select> ";
            //        html += " כמות להורדה  <input type="+'"'+"text"+'"'+" name="+'"'+"TxtQyntity"+'"'+" runat="+'"'+"server"+'"'+" Width="+'"'+"60px"+'"'+" Height="+'"'+"20px"+'"'+ " value=" + '"'+ (SLP.Maximum - Inventory.Quantity) + '"'+" ></input>";
            //        html += "  אישור  <input type=" + '"' + "text" + '"' + " name=" + '"' + "TxtDownloadOk" + '"' + " runat=" + '"' + "server" + '"' + " style="+'"'+" Width:20px; Height:20px;" + '"' + "  ></input>"; 
            //        j.Text = html;
            //    }

            //}

            protected void BtnLocatorName_Click(object sender, EventArgs e)
            {
                List<StoragesLocators> SL = new List<StoragesLocators>();
                SL = (List<StoragesLocators>)Application["StoragesLocators"];
                int size = SL.Count;
                string h = "";
                for(int i =0; i < size; i ++)
                {
                    h += "<br />";
                    h += "" + SL[i].LocatorName;
                }               
            }

            protected void BtnDownloadOk_Click(object sender, EventArgs e)
            {
                TCD.CertificateId = 1;
                TCD.SurfaceId = 1;
                TCD.Quantity = 1;
                //TCD.WritheQuantityInDCDetails(TCD);
            }

            protected void BtnNewRow_Click(object sender, EventArgs e)
            {
                 LstTCD=(List<TtransferCertificateDetails>)Application["LstTCD"];
                TtransferCertificateDetails TCD1 = new TtransferCertificateDetails();
                TCDvalue tcdValue = new TCDvalue();
                LstTcdValue = (List<TCDvalue>)Application["LstTcdValue"];
                TCD1.CertificateId =(int) Application["id"];
                int PId = Convert.ToInt32(DdlProdName.SelectedValue);                
                if (LstTCD != null)
                {                    
                    int IsExest = 0;
                    for(int i =0; i < LstTcdValue.Count; i++)
                    {
                        if (LstTcdValue[i].ProdId == PId)
                            IsExest = 1;
                    }
                    if(IsExest == 0)
                    {
                        tcdValue.ProdId = PId;
                        int Quantity = 0;
                        if (TxtQuantity.Text != "")
                            Quantity = Convert.ToInt32(TxtQuantity.Text);
                        TCD1.Quantity = Quantity;
                        int id = TCD1.AddingDetails(TCD1);
                        TCD1.CertificateDetailsId = id;
                        tcdValue.ProdName = DdlProdName.SelectedItem.Text;
                        tcdValue.Barcode = TxtBarcode.Text;
                        tcdValue.ShorBarcode = TxtShorBarcode.Text;
                        tcdValue.Quantity = TxtQuantity.Text;
                        tcdValue.Pack = TxtPack.Text;
                        tcdValue.SenderLocatorName = TxtSenderLocatorName.Text;
                        tcdValue.GeterLocatorName = TxtGeterLocatorName.Text;
                        tcdValue.Price = TxtPrice.Text;                        
                        int flag1 = (int)Application["flag"];
                        if (flag1==0)
                            LstTcdValue.RemoveAt(0);                                                
                        LstTcdValue.Add(tcdValue);
                        flag1 = 1;
                        Application["flag"] = flag1;
                        Application["LstTcdValue"] = LstTcdValue;
                        TxtBarcode.Text = "";
                        TxtShorBarcode.Text = "";
                        TxtQuantity.Text = "";
                        TxtPack.Text = "";
                        TxtSenderLocatorName.Text = "";
                        TxtGeterLocatorName.Text = "";
                        TxtPrice.Text = "";
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "qwer()", true);
                        PanCertificate.Visible = false;
                        PanDetais.Visible = true;
                        Repeater2.DataSource = LstTcdValue;
                        Repeater2.DataBind();
                    }
                }                                
            }            
            protected void DdlProdName_TextChanged(object sender, EventArgs e)
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "qwer()", true);
                PanCertificate.Visible = false;
                PanDetais.Visible = true;
                int Pid = Convert.ToInt32(DdlProdName.SelectedValue);
                List<Product> LstProducts = (List<Product>)Application["Products"];
                for (int i =0;i < LstProducts.Count;i++)
                {
                    if(LstProducts[i].ProdId == Convert.ToInt32(DdlProdName.SelectedValue))
                    {
                        TxtBarcode.Text = LstProducts[i].Barcode;
                        TxtShorBarcode.Text = LstProducts[i].ShorBarcode;
                        TxtPrice.Text = LstProducts[i].Price.ToString();
                        if (TxtQuantity.Text!="")
                        {
                            if (Convert.ToInt32(TxtQuantity.Text) % LstProducts[i].QuantityUnitsPeck == 0)
                                TxtPack.Text = "" + Convert.ToInt32(TxtQuantity.Text) / LstProducts[i].QuantityUnitsPeck;
                            else
                                TxtPack.Text = " ";
                        }                        
                        int j, k , l;
                        List<StoragesLocatorsProducts> LstSlp = (List<StoragesLocatorsProducts>)Application["StoragesLocatorsProducts"];
                        List<StoragesLocators> LstSl = (List<StoragesLocators>)Application["StoragesLocators"];
                        for (j = 0;j< LstSlp.Count; j++)
                        {
                            if(LstSlp[j].ProdId == Convert.ToInt32(DdlProdName.SelectedValue))
                            {
                                k = LstSlp[j].StoragesLocatorId;
                                for (l = 0; l < LstSl.Count; l++)
                                {
                                    if (LstSl[l].StoragesLocatorId == k && LstSl[l].StorageId == (int)Application["StorageSenderId"])
                                        TxtSenderLocatorName.Text = LstSl[l].LocatorName;
                                    if (LstSl[l].StoragesLocatorId == k && LstSl[l].StorageId == (int)Application["StorageGeterId"])
                                        TxtGeterLocatorName.Text = LstSl[l].LocatorName;
                                }
                            }
                        }
                        //int Quantity = Convert.ToInt32(TxtQuantity.Text);
                        //float Price = Quantity * (LstProducts[i].Price);
                        //TxtPrice.Text = Price.ToString();
                    }
                }
            }

            protected void DdlSerchCertificate_TextChanged(object sender, EventArgs e)
            {
                if (DdlSerchCertificate.SelectedIndex == 2 || DdlSerchCertificate.SelectedIndex == 3 || DdlSerchCertificate.SelectedIndex == 4 || DdlSerchCertificate.SelectedIndex == 5 || DdlSerchCertificate.SelectedIndex == 6)
                {
                    SqlObject sql = new SqlObject();
                    DataTable Dt = new DataTable();
                    DdlSerchDetails.Visible = false;
                    DdlSerchDateY.Visible = false;
                    DdlSerchDateM.Visible = false;
                    qqq.Text = "";
                    if (DdlSerchCertificate.SelectedIndex == 2)
                    {
                        DdlSerchDetails.Visible = true;
                        DdlSerchDateY.Visible = false;
                        DdlSerchDateM.Visible = false;
                        qqq.Text = "";
                        Dt = sql.ExecuteKeyValue("TransferCertificateId", "TransferCertificateId", "TtransferCertificate");
                        DdlSerchDetails.DataSource = Dt;
                        DdlSerchDetails.DataTextField = "TextField";
                        DdlSerchDetails.DataValueField = "ValueField";
                        DdlSerchDetails.DataBind();
                        ColumnName = "TransferCertificateId";                        
                    }                       
                    if (DdlSerchCertificate.SelectedIndex == 3)
                    {
                        DdlSerchDetails.Visible = true;
                        DdlSerchDateY.Visible = false;
                        DdlSerchDateM.Visible = false;
                        qqq.Text = "";
                        Dt = sql.ExecuteKeyValue("StatusName", "StatusId", "Tstatuses");
                        DdlSerchDetails.DataSource = Dt;
                        DdlSerchDetails.DataTextField = "TextField";
                        DdlSerchDetails.DataValueField = "ValueField";
                        DdlSerchDetails.DataBind();
                        ColumnName = "Status";
                    }
                    if (DdlSerchCertificate.SelectedIndex == 4)
                    {
                        DdlSerchDetails.Visible = true;
                        DdlSerchDateY.Visible = false;
                        DdlSerchDateM.Visible = false;
                        qqq.Text = "";
                        Dt = sql.ExecuteKeyValue("StorageName", "StorageId", "Tstorages");
                        DdlSerchDetails.DataSource = Dt;
                        DdlSerchDetails.DataTextField = "TextField";
                        DdlSerchDetails.DataValueField = "ValueField";
                        DdlSerchDetails.DataBind();
                        ColumnName = "StorageSenderId";
                    }
                    if (DdlSerchCertificate.SelectedIndex == 5)
                    {
                        DdlSerchDetails.Visible = true;
                        DdlSerchDateY.Visible = false;
                        DdlSerchDateM.Visible = false;
                        qqq.Text = "";
                        Dt = sql.ExecuteKeyValue("StorageName", "StorageId", "Tstorages");
                        DdlSerchDetails.DataSource = Dt;
                        DdlSerchDetails.DataTextField = "TextField";
                        DdlSerchDetails.DataValueField = "ValueField";
                        DdlSerchDetails.DataBind();
                        ColumnName = "StorageGeterId";
                    }
                    if (DdlSerchCertificate.SelectedIndex == 6)
                    {
                        DdlSerchDetails.Visible = true;
                        DdlSerchDateY.Visible = false;
                        DdlSerchDateM.Visible = false;
                        qqq.Text = "";
                        Dt = sql.ExecuteKeyValue("UserName", "UserId", "Tusers");
                        DdlSerchDetails.DataSource = Dt;
                        DdlSerchDetails.DataTextField = "TextField";
                        DdlSerchDetails.DataValueField = "ValueField";
                        DdlSerchDetails.DataBind();
                        ColumnName = "UserIdOpen";
                    }
                    Application["ColumnName"] = ColumnName;
                }
                else if(DdlSerchCertificate.SelectedIndex == 1)
                {
                    DdlSerchDetails.Visible = false;
                    DdlSerchDateY.Visible = true;
                    DdlSerchDateM.Visible = true;
                    qqq.Text = "";
                }
                else
                {
                    DdlSerchDetails.Visible = false;
                    DdlSerchDateY.Visible = false;
                    DdlSerchDateM.Visible = false;
                    qqq.Text = "";
                }
            }            
            protected void DdlSerchDetails_TextChanged(object sender, EventArgs e)
            {
                List<TransferCertificate> LstTC1 = new List<TransferCertificate>();
                TransferCertificate TC = new TransferCertificate();
                ColumnName = (string)Application["ColumnName"];
                int UserId = (DdlSerchDetails.SelectedIndex) + 1 ;
                List<User> LstUsers = new List<User>();
                User user = new User();
                LstUsers = user.GetAllUsers();
                for (int i = 0; i < LstTC1.Count; i++)
                {
                    
                        if (LstUsers[i].Name == ColumnName)
                        UserId = LstUsers[i].Uid;
                    
                }
                //LstTC = TC.GetCertificatsByColumnName(ColumnName, DdlSerchDetails.SelectedItem.Text);
                LstTC1 = TC.GetCertificatsByColumnName(ColumnName, UserId);
                List<Storages> LstStorages = new List<Storages>();
                Storages storage = new Storages();
                LstStorages = storage.GetAllStorages();
                for (int i = 0; i < LstTC1.Count; i++)
                {
                    for (int j = 0; j < LstStorages.Count; j++)
                    {
                        if (LstStorages[j].StorageId == LstTC1[i].StorageGeterId)
                            LstTC1[i].StorageGeterName = LstStorages[j].StorageName;
                        if (LstStorages[j].StorageId == LstTC1[i].StorageSenderId)
                            LstTC1[i].StorageSenderName = LstStorages[j].StorageName;
                    }
                }
                //List<User> LstUsers = new List<User>();
                //User user = new User();
                LstUsers = user.GetAllUsers();
                for (int i = 0; i < LstTC1.Count; i++)
                {
                    for (int j = 0; j < LstUsers.Count; j++)
                    {
                        if (LstUsers[j].Uid == LstTC1[i].UserId)
                            LstTC1[i].UserName = LstUsers[j].Name;
                    }
                }
                Repeater1.DataSource = LstTC1;
                Repeater1.DataBind();
                //if(DdlSerchDetails.SelectedValue=="3")
                //    LstTC = TC.GetCertificatsByColumnName(ColumnName , DdlSerchDetails.SelectedItem.Text);
                //else
                //    LstTC = TC.GetCertificatsByColumnName(ColumnName, DdlSerchDetails.SelectedValue);
            }

            protected void DdlSerchDateY_TextChanged(object sender, EventArgs e)
            {

            }

            protected void DdlSerchDateM_TextChanged(object sender, EventArgs e)
            {
                string y = DdlSerchDateY.SelectedValue;
                string m = DdlSerchDateM.SelectedValue;               
                qqq.Text = y+"  " + m;               
            }

            protected void BtnCertDetails_Click(object sender, EventArgs e)
            {
                CertificateId = int.Parse(((Button)sender).CommandArgument);
                List<TtransferCertificateDetails> LstTCD = new List<TtransferCertificateDetails>();
                LstTCD = TtransferCertificateDetails.GetCertDetailsById(CertificateId);
                string id = CertificateId.ToString();                
                string strTCD = id + "$*";               
                for (int i = 0; i < LstTCD.Count; i++)
                {
                    strTCD += LstTCD[i].ProdName + "*" + LstTCD[i].Barcode + "*" + LstTCD[i].ShorBarcode + "*" + LstTCD[i].Quantity + "*" + LstTCD[i].QuantityUnitsPeck + "*" + LstTCD[i].Quantity + "*" + LstTCD[i].Quantity + "*" + LstTCD[i].Price + "#*";
                }
                int size = strTCD.Length;
                strTCD = strTCD.Substring(0, (size-1));                
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "p(" + "'" + strTCD + "'" + ")", true);
            }
        }
    }   
}