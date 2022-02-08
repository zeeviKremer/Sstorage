<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="InventoryMovements.aspx.cs" Inherits="Sstorage.admin.InventoryMovements" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title> תנועות מלאי | Sstorage</title>
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder0" runat="server">
<asp:Literal ID="LtlUserDitels" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    
         
             <div class="limiter">
     <div class="container-table100">
        <div style="width:100%;">
         <center>
             
             <table style="width:280px;">
                 <tr class="aa">
                     <td style="width:100%;">
                        <a href="absorptionProducts.aspx" style="width:100%;" class="aa"  > תעודת קליטה מספק </a>
                     </td>
                 </tr>
                 <tr class="aa">
                     <td style="width:100%;">
                        <a href="ReturnCertificateToSupplaier.aspx" style="width:100%;" class="aa"  > תעודת החזרה לספק </a>
                     </td>
                 </tr>
                 <tr class="aa">
                     <td style="width:100%;">
                        <a href="ShippingClientCertificate.aspx" style="width:100%;" class="aa"  >תעודת משלוח ללקוח </a>
                     </td>
                 </tr>
                 <tr class="aa">
                     <td style="width:100%;">
                        <a href="ReturnCertificateFromClient.aspx" style="width:100%;" class="aa"  > תעודת החזרה מלקוח </a>
                     </td>
                 </tr>
                 <tr class="aa">
                     <td style="width:100%;">
                        <a href="transferCertificate.aspx" style="width:100%;" class="aa"  > תעודת העברה בין חנויות </a>
                     </td>
                 </tr>
                 <tr class="aa">
                     <td style="width:100%;">
                        <a href="DownloadProducts.aspx"  style="width:100%;" class="aa"   > תעודת העברת רזרבות לליקוט  </a>
                         
                     </td>
                 </tr>
             </table> 
             </div>
         <div id="a">
             
         </div>
             </center>
    </div>
              
</div>   
             
    
    <style>
        .aaa{
            color:#000000;
            font-size:20px;
        }
        .aaa:hover{
            font-size:25px;
        }
        .aa{
            /*background:#ffffff;*/
            color:#b200ff;
            font-size:20px;
            width:280px;
        }
        .aa:hover{
           /* background:#ffffff;*/
            color:#0026ff;
        }
    </style>
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="js/main.js"></script>
<script src="js/main1.js"></script>
<script>

    

    

	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
</script>

</asp:Content>
