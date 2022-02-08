﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="transferCertificate.aspx.cs" Inherits="Sstorage.admin.transferCertificate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title> תעודת העברה | Sstorage</title>
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
<asp:ScriptManager ID="Scrman" runat="server" />   
    <asp:UpdatePanel ID="Updpmain" runat="server">
                <ContentTemplate>
<div id="ssss">
<center>     
    <style> 
        #tab{
            width:1000px;
            padding:0px 50px 6px 0px;
        }    
        .column7{
            text-align:center;vertical-align:middle;width:12.5%; color:#ff0000;cursor:pointer; 
        }
        .a{
            color:#0026ff;
            font-family: 'Perpetua';
            font-size: 22px;
            
        }
        .a:hover{           
            color:#ffffff;
        } 
        .at1{
            border:1px solid;
            border-color:#808080;
            width:50px;
            color:#000000;
            padding: 4px 4px 4px 4px;
        }
        #at2{
            border:1px solid;
            border-color:#808080;
            width:50px;
            color:#000000;
            padding: 4px 4px 4px 4px;
        }
        #at3{
            border:1px solid;
            border-color:#808080;
            width:50px;
            color:#000000;
            padding: 4px 4px 4px 4px;
        }    
        .ddl{
            width:150px;
            height:27px;
            font-family: 'Perpetua';
            font-size: 18px;
            color:#000000;
        }
         .modal-content {
    box-shadow: 0 0 0 5px red;
    border: none;
  }
         .u{
             display:none;
         }
   .slider {
	overflow-y: hidden;
	max-height: 500px; 
  	transition-property: all;
	transition-duration: .5s;
	transition-timing-function: cubic-bezier(0, 0.01, 1, 0.01);  
}
   .slider.closed {
	max-height: 0;
}      
   .ro{
       color:black;
      
   }
   .column{
       width:148px;      
   }
    .TexBox{
            height:22px;
            width:140px;
            font-size:15px;
            color:#808080;
            border:solid 2px;
        }
    </style>
     <script>  
         function ModalMsege(str) {
             alert(str);
         }
         function p1(id) {           
             document.getElementById("" + id).classList.toggle('closed');
         } 
         function p(str) {
             var obg = {
                 ProdName:'', Barcode:'', ShorBarcode:'', Quantity:'',
                 QuantityPecks:'', StoragesLocatorSender:'',
                 StoragesLocatorGeter:'',Price:''
             };             
             var arr = [];           
             for (let i = 0; i < str.length; i++)
                 if(str[i] == '#')
                    arr.push({});  
             var size = 0;
             var ProdName,Barcode,ShorBarcode,Quantity,QuantityPecks,StoragesLocatorSender,StoragesLocatorGeter,Price;            
             for (var i = 1; i < str.length; i++) {
                 if (str[i - 1] == '$' || str[i - 1] == '#') {                     
                     for (var j = i,num = 0; str[j] != '#'; j++) {
                         if (str[j] == '*') {
                             num++;
                             j++;
                         }                             
                         if (str[j - 1] == '*' && num == 1) {
                             let k = 0;
                             for (let a = j; str[a] != '*'; a++, k++) { }                                                       
                             ProdName = str.substring(j, (j + k));                              
                             arr[size].ProdName = ProdName;                             
                         }   
                         else if (str[j - 1] == '*' && num == 2) {
                             let k = 0;
                             for (let a = j; str[a] != '*' ; a++, k++) {}                          
                             Barcode = str.substring(j, (j + k));  
                         arr[size].Barcode = Barcode;
                         }
                         else if (str[j - 1] == '*' && num == 3) {
                             let k = 0;
                             for (let a = j; str[a] != '*' ; a++, k++) {}                             
                             ShorBarcode = str.substring(j, (j + k)); 
                         arr[size].ShorBarcode = ShorBarcode;
                         }
                         else if (str[j - 1] == '*' && num == 4) {
                             let k = 0;
                             for (let a = j; str[a] != '*' ; a++, k++) {}                           
                             Quantity = str.substring(j, (j + k)); 
                         arr[size].Quantity = Quantity;
                         }
                         else if (str[j - 1] == '*' && num == 5) {
                             let k = 0;
                             for (let a = j; str[a] != '*' ; a++, k++) { }                        
                             QuantityPecks = str.substring(j, (j + k));
                         arr[size].QuantityPecks = QuantityPecks;
                         }                         
                     }                                                                                  
                     size++;                     
                 }                   
             }              
             var id = str.substring(0, 3);               
             var html = '<button style="width:48px;color:black; background-color:red;" onclick="p1(' + id + ');return false;">סגירה</button><br/>';
             html += '<table ><tr class="ro"><td>תאור מוצר</td>';
             html += '<td class="column">ברקוד</td>';
             html += '<td class="column">מק"ט</td>';
             html += '<td class="column">כמות</td>';
             html += '<td class="column">מס אריזות</td>';
             html += '<td class="column">מיקום במחסן שולח</td>';
             html += '<td class="column">מיקום במחסן מקבל</td>';
             html += '<td class="column">מחיר ליחידה</td>';
             html += '</tr>';                                                                                           
             for (var i = 0; i < arr.length; i++)
             {
                 html += '<tr><td>' + arr[i].ProdName;
                 html += '</td><td>' + arr[i].Barcode;
                 html += '</td><td>' + arr[i].ShorBarcode;
                 html += '</td><td>' + arr[i].Quantity;
                 html += '</td><td>' + (arr[i].Quantity / arr[i].QuantityPecks);
                 html += '</td><td>' + arr[i].Barcode;
                 html += '</td><td>' + arr[i].Barcode;
                 html += '</td><td>' + arr[i].Price;
                 html += '</td></tr>';                                                                       
             }
             html += '</table>';             
             var string = id;
             for (let i = 0; i < string.length; i++)
                 if (string[i] != '0' && string[i] != '1' && string[i] != '2' && string[i] != '3' && string[i] != '4' && string[i] != '5' && string[i] != '6' && string[i] != '7' && string[i] != '8' && string[i] != '9') {
                     id = string.substring(0, i);
                     i = string.length
                 }
             console.log(id);
             document.getElementById("" + id).innerHTML=(html);            
             setTimeout('p1(' + id + ')', 20);          
         }         
         function qwer() {
             //document.getElementById("Certificate").style = "display:none;"
             //document.getElementById("Detais").style = "display:normal;"
         }
         const toggleModal = () => {
             document.getElementById('aaaaa').classList = ('modal5');
         };  
    </script>                  
   <br />  
    <table style="width:1000px;" border="0">                    
       <tr>
           <td>
                <asp:Panel ID="Panel5" runat="server" Visible="true" >
               <div>                
                חיפוש לפי               
                    <asp:DropDownList ID="DdlSerchCertificate" runat="server" OnTextChanged="DdlSerchCertificate_TextChanged" AutoPostBack="true">
                    <asp:ListItem Disabled="True" Selected="True" Text="בחר אפשרות חיפוש" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="תאריך" Value="1"></asp:ListItem>
                    <asp:ListItem Text="מספר תעודה" Value="2"></asp:ListItem>
                    <asp:ListItem Text="סטטוס" Value="3"></asp:ListItem>   
                    <asp:ListItem Text="מחסן שולח" Value="4"></asp:ListItem>
                    <asp:ListItem Text="מחסן מקבל" Value="5"></asp:ListItem>
                    <asp:ListItem Text="שם עובד" Value="6" accesskey="A"></asp:ListItem>
                </asp:DropDownList>
                   <asp:DropDownList ID="DdlSerchDetails" runat="server" Visible="false" OnTextChanged="DdlSerchDetails_TextChanged" AutoPostBack="true">

                   </asp:DropDownList>
                   <asp:DropDownList ID="DdlSerchDateY" runat="server" Visible="false" OnTextChanged="DdlSerchDateY_TextChanged" AutoPostBack="true">
                       <asp:ListItem Text="2010" Value="2010"></asp:ListItem>
                       <asp:ListItem Text="2011" Value="2011"></asp:ListItem>
                       <asp:ListItem Text="2012" Value="2012"></asp:ListItem>
                       <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
                       <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
                       <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
                       <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
                       <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
                       <asp:ListItem Text="2018" Value="2018"></asp:ListItem>
                       <asp:ListItem Text="2019" Value="2019"></asp:ListItem>
                       <asp:ListItem Text="2020" Value="2020"></asp:ListItem>
                       <asp:ListItem Text="2021" Value="2021" Selected="True"></asp:ListItem>
                   </asp:DropDownList>
                   <asp:DropDownList ID="DdlSerchDateM" runat="server"  Visible="false" OnTextChanged="DdlSerchDateM_TextChanged" AutoPostBack="true">
                       <asp:ListItem Text="01" Value="1" Selected="True"></asp:ListItem>
                       <asp:ListItem Text="02" Value="2"></asp:ListItem>
                       <asp:ListItem Text="03" Value="3"></asp:ListItem>
                       <asp:ListItem Text="04" Value="4"></asp:ListItem>
                       <asp:ListItem Text="05" Value="5"></asp:ListItem>
                       <asp:ListItem Text="06" Value="6"></asp:ListItem>
                       <asp:ListItem Text="07" Value="7"></asp:ListItem>
                       <asp:ListItem Text="08" Value="8"></asp:ListItem>
                       <asp:ListItem Text="09" Value="9"></asp:ListItem>
                       <asp:ListItem Text="10" Value="10"></asp:ListItem>
                       <asp:ListItem Text="11" Value="11"></asp:ListItem>
                       <asp:ListItem Text="12" Value="12"></asp:ListItem>
                   </asp:DropDownList> 
                   <asp:Literal ID="qqq" runat="server" />
                <%--<asp:TextBox ID="TxtCerch" runat="server" Visible="false"  placeholder="הזן פרמטר חיפוש" />
                    <asp:Button ID="Btnserch" Text="אישור" Visible="false" runat="server" OnClick="Btnserch_Click" />--%>
                    </div>
               </asp:Panel>
           </td>

           <td>              
               <asp:Panel ID="Panel3" runat="server" Visible="false" >
    <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal">
        פתיחת תעודה חדשה
      </button>
    </asp:Panel>

           </td>
       </tr>
        <%-- <tr>
            <td style="width:1000px;" colspan="8" id="p2" runat="server">
                <center>
                    <asp:DropDownList ID="DdlActions" runat="server" AutoPostBack="true" OnTextChanged="DdlActions_TextChanged1" >
                        <asp:ListItem Text="בחר פעולה"  Value="0" Disabled="True" Selected="True" />
                        <asp:ListItem Text="משיכת מוצר להורדה"  Value="1" />
                        <asp:ListItem Text='משיכת מוצר לפי מק"ט '  Value="2" />
                        <asp:ListItem Text="עידכון איתור למשטח"  Value="3" />
                    </asp:DropDownList>
                    </center>

            </td>    
        </tr>--%>        
    </table>        
    <asp:Literal ID="i" runat="server" />     
    <asp:Panel ID="Panel4" runat="server" Visible="false" >
        סטטוס <asp:DropDownList ID="DdlSttus" runat="server" AutoPostBack="true">

              </asp:DropDownList>
        <a href="transferCertificate.aspx" >חזרה לשאר התעודות</a>
    </asp:Panel>
    <asp:Literal ID="j" runat="server" />           
     
    
    
    <!-- 1Modal -->
      <div style="border-color:white;" class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <center><h5 style="font-size: 18px;font-family: 'Perpetua';" class="modal-title" id="exampleModalLabel">פתיחת תעודה חדשה</h5></center>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">              
               <br />
                 <table style="width:570px;" border="0">       
                     <tr style="display:none">
                         <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                             <center>                    
                                 תאריך
                             </center>
                         </td>
                         <td style="width:50%;background-color:#ffffff;">
                             <center>
                                 <asp:TextBox ID="TxtDate" runat="server" />
                             </center>

                         </td> 
                     </tr>
                     <tr>
                         <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">
                             <center>
                                 מחסן שולח
                             </center>
                         </td>
                         <td style="width:50%;background-color:#ffffff;">
                             <center>
                                 <asp:DropDownList CssClass="ddl" ID="DdlStorageSender" runat="server" />
                             </center>
                         </td>   
                     </tr>
                     <tr>
                         <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">
                             <center>
                                 מחסן מקבל
                             </center>
                         </td>
                         <td style="width:50%;background-color:#ffffff;">
                             <center>
                                 <asp:DropDownList CssClass="ddl" ID="DdlStorageGeter" runat="server" />
                             </center>
                         </td>  
                     </tr>                                
                 </table>
               <br />                            
            </div>
            <div class="modal-footer">                            
              <asp:Button ID="BtnOpenCertificate" CssClass="btn btn-primary" runat="server"  Text="פתח תעודה" OnClick="BtnOpenCertificate_Click"  />                          
              <asp:Literal ID="LtlAaa" runat="server" />
            </div>
          </div>
        </div>
      </div>
     
    
    
    <!-- 2Modal -->
    <%--  <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div style="width:1000px;max-height:600px; " class="modal-dialog" role="document">
          <div style="width:1000px;max-height:600px; " class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">פתיחת תעודה חדשה</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">              
                  <br />
                   <table style="width:570px;" border="0">       
        <tr>
            <td style="width:50%;">                
                <center>                    
                תאריך
                    </center>
            </td>
            <td style="width:50%;">
                <center>
                    <asp:TextBox ID="TextBox1" runat="server" />
                    </center>

            </td> 
            </tr>
                    <tr>
            <td style="width:50%;">
                <center>
                מחסן שולח
                    </center>
            </td>
            <td style="width:50%;">
                <center>
                <asp:DropDownList ID="DropDownList1" runat="server" />
                    </center>
            </td>   
                        </tr>
                    <tr>
            <td style="width:50%;">
                <center>
                מחסן מקבל
                    </center>
            </td>
            <td style="width:50%;">
                <center>
                <asp:DropDownList ID="DropDownList2" runat="server" />
                    </center>
            </td>  
                        </tr>                                
    </table>
                   <br />                            
            </div>
            <div class="modal-footer">  
                <br />
                <h3>    </h3>
                <br />
              <button type="button" class="btn btn-secondary" data-dismiss="modal">סגירה</button>
              <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server"  Text="פתח תעודה" OnClick="BtnOpenCertificate_Click" />              
            </div>
          </div>
        </div>
      </div>--%>
  
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
   <br />
                
     <div class="limiter">
  <div class="container-table100">
    <div class="wrap-table100">      
      <div class="table100" >                   
        <table style="width:1200px;">
          <thead>
              <asp:Panel ID="PanCertificate" runat="server" >
            <tr class="table100-head" id="Certificate" style="display:normal;">
              <th class="column5" style="text-align:center;">תאריך פתיחה</th>
              <th class="column5" style="text-align:center;">מספר תעודה</th>
              <th class="column5" style="text-align:center;">סטטוס</th>
              <th class="column5" style="text-align:center;">מחסן שולח</th>
              <th class="column5" style="text-align:center;">מחסן מקבל</th>              
              <th class="column5" style="text-align:center;">כמות מוצרים</th>
              <th class="column5" style="text-align:center;">שם עובד</th>       
              <th class="column5" style="text-align:center;">פרטים</th>              
            </tr>
              </asp:Panel>
              <asp:Panel ID="PanDetais" runat="server" Visible="false" >
              <tr class="table100-head" id="Detais" style="display:normal;">
              <th class="column5" style="text-align:center;">תאור מוצר</th>
              <th class="column5" style="text-align:center;">ברקוד</th>
              <th class="column5" style="text-align:center;">מק"ט</th>              
              <th class="column5" style="text-align:center;">כמות</th>
              <th class="column5" style="text-align:center;">מס אריזות</th>              
              <th class="column5" style="text-align:center;">מיקום במחסן שולח</th>
              <th class="column5" style="text-align:center;">מיקום במחסן מקבל</th>       
              <th class="column5" style="text-align:center;">מחיר ליחידה</th>              
            </tr>
               </asp:Panel>
          </thead> 
            <asp:Repeater ID="Repeater1" runat="server">                
                <ItemTemplate>
             <tr  >
              <td class="column5" style="text-align:center;"><%#Eval("Date") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("CertificateId") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("Status") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("StorageSenderName") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("StorageGeterName") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("CertificateId") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("UserName") %></td>
              <td class="column5" style="text-align:center;"><asp:Button ID="BtnCertDetails" runat="server" OnClick="BtnCertDetails_Click" Text="פירט תעודה" CommandArgument='<%#Eval("CertificateId") %>'  /></td> 
             </tr> 
                    <tr class="u">
                        <td></td>
                    </tr>                    
                        <tr   >
                        <td colspan="8">  
                            <div class="slider closed" style="direction:rtl;" id="<%#Eval("CertificateId") %>">
                                <button onclick="p('<%#Eval("CertificateId") %>');return false;">סגירה</button>
                                <%--<table style="width:1200px;">
                                    <thead>            
                                        <tr class="table100-head" >
                                            <th class="column5" style="text-align:center;">תאור מוצר</th>
                                            <th class="column5" style="text-align:center;">ברקוד</th>
                                            <th class="column5" style="text-align:center;">מק"ט</th>              
                                            <th class="column5" style="text-align:center;">כמות</th>
                                            <th class="column5" style="text-align:center;">מס אריזות</th>              
                                            <th class="column5" style="text-align:center;">מיקום במחסן שולח</th>
                                            <th class="column5" style="text-align:center;">מיקום במחסן מקבל</th>       
                                            <th class="column5" style="text-align:center;">מחיר ליחידה</th>              
                                        </tr>
                                    </thead> 
                                </table>
                                <br />
                                <p>Bl...</p>
                                 <br />
                                <p>Bl...</p>
                                 <br />
                                <p>Bl...</p>
                                 <br />
                                <p>Bl...</p>
                                 <br />
                                <p>Bl...</p>
                                 <br />
                                <p>Bl...</p>--%>
                            </div>
                            
		                     <%--   <div class="slider closed" id="<%#Eval("CertificateId") %>">
		                        	<p>Bl...</p><br />                                    
		                        </div>	                        
                            <button onclick="p(<%#Eval("CertificateId") %>);return false;">Toggle slider</button>--%>
                        </td>
                    </tr>
            </ItemTemplate>
            </asp:Repeater> 
             <asp:Panel ID="Panel1" runat="server" Visible="false" >
                   
            <tr  >
              <td class="column5" style="text-align:center;"><asp:DropDownList ID="DdlProdName" runat="server" AutoPostBack="true" OnTextChanged="DdlProdName_TextChanged" ><asp:ListItem Text="בחר מוצר"  Value="0" Disabled="True" Selected="True" /></asp:DropDownList></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ReadOnly="true" ID="TxtBarcode" runat="server" ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ReadOnly="true" ID="TxtShorBarcode" runat="server" ></asp:TextBox></span></td>              
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtQuantity" runat="server"   ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtPack" runat="server"  ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ReadOnly="true" ID="TxtSenderLocatorName" runat="server" ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ReadOnly="true" ID="TxtGeterLocatorName" runat="server" ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtPrice" ReadOnly="true" runat="server"  ></asp:TextBox></span></td>
            </tr>                                    
        
    </asp:Panel>
            <asp:Repeater ID="Repeater2" runat="server">                
                <ItemTemplate>
             <tr  >
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtProdName" ReadOnly="true" runat="server"  Text='<%#Eval("ProdName") %>' ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtBarcode" ReadOnly="true" runat="server" Text='<%#Eval("Barcode") %>'  ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtShorBarcode" ReadOnly="true" runat="server" Text='<%#Eval("ShorBarcode") %>'  ></asp:TextBox></span></td>              
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtQuantity1" ReadOnly="true" runat="server" Text='<%#Eval("Quantity") %>'   ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtPack1" ReadOnly="true" runat="server" Text='<%#Eval("Pack") %>' ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtSenderLocatorName" ReadOnly="true" runat="server" Text='<%#Eval("SenderLocatorName") %>'  ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtGeterLocatorName" ReadOnly="true" runat="server"  Text='<%#Eval("GeterLocatorName") %>' ></asp:TextBox></span></td>
              <td class="column5" style="text-align:center;"><span class="TexBox"><asp:TextBox ID="TxtPrice1" ReadOnly="true" runat="server" Text='<%#Eval("Price") %>' ></asp:TextBox></span></td>
            </tr> 
            </ItemTemplate>
            </asp:Repeater> 
          <asp:Repeater ID="Repeater3" runat="server">                
              <HeaderTemplate>
                    <thead>
            <tr class="table100-head"  >
              <th class="column5" style="text-align:center;">תאור מוצר</th>
              <th class="column5" style="text-align:center;">ברקוד</th>
              <th class="column5" style="text-align:center;">מק"ט</th>
              <th class="column5" style="text-align:center;">כמות</th>
              <th class="column5" style="text-align:center;">מס אריזות</th>              
              <th class="column5" style="text-align:center;">מיקום במחסן שולח</th>
              <th class="column5" style="text-align:center;">מיקום במחסן מקבל</th>       
              <th class="column5" style="text-align:center;">מחיר ליחידה</th>              
            </tr>            
          </thead>   
              </HeaderTemplate>  
              <ItemTemplate>  
                  <tr  >
              <td class="column5" style="text-align:center;"><%#Eval("ProdId") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("ProdId") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("ProdId") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("Quantity") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("Quantity") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("Quantity") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("Quantity") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("Quantity") %></td>
             </tr>              
            </ItemTemplate>
              </asp:Repeater> 
            <asp:Repeater ID="RptTable" runat="server">                
                <ItemTemplate>
                     <tr>
              <td class="column5" style="text-align:center;"><%#Eval("Barcode") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("ShorBarcode") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("ProdName") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("ProdName") %></td>
              <%--<td class="column5" style="text-align:center;"> <asp:DropDownList ID="DdlSurfaceId" runat="server" AutoPostBack="true" OnTextChanged="DdlSurfaceId_TextChanged" ><asp:ListItem Text="בחר משטח"  Value="0" Disabled="True" Selected="True" /></asp:DropDownList></td> --%>
              <%--<td class="column5" style="text-align:center;"><asp:TextBox ID="TexQuantity" runat="server" Text="<%#Eval("Quantity") %>" ></asp:TextBox></td>--%>
                         <td class="column5" style="text-align:center;"><%#Eval("ProdName") %></td>
              <%--<td class="column5" style="text-align:center;"><asp:TextBox ID="TextQuantityUnitsPeck" runat="server" Text="<%#Eval("QuantityUnitsPeck") %>" ></asp:TextBox></td>--%>
                         <td class="column5" style="text-align:center;"><%#Eval("ProdName") %></td>
              <td class="column5" style="text-align:center;"><%#Eval("LocatorName") %></td>
              <td class="column5" style="text-align:center;"><asp:Button ID="Button1"  runat="server" Text="אישור ההורדה" OnClick="BtnDownloadOk_Click" /></td>          
            </tr>            
                   <%-- <tr>
              <td class="column5" style="text-align:center;"><asp:TextBox ID="TxtBarcode" runat="server" ></asp:TextBox></td>
              <td class="column5" style="text-align:center;"><asp:TextBox ID="TextShorBarcode" runat="server" ></asp:TextBox></td>
              <td class="column5" style="text-align:center;"><asp:TextBox ID="TextProdName" runat="server" ></asp:TextBox></td>
              <td class="column5" style="text-align:center;"> <asp:DropDownList ID="DdlSurfaceId" runat="server" AutoPostBack="true" OnTextChanged="DdlSurfaceId_TextChanged" ><asp:ListItem Text="בחר משטח"  Value="0" Disabled="True" Selected="True" /></asp:DropDownList></td> 
              <td class="column5" style="text-align:center;"><asp:TextBox ID="TexQuantity" runat="server" ></asp:TextBox></td>
              <td class="column5" style="text-align:center;"><asp:TextBox ID="TextQuantityUnitsPeck" runat="server" ></asp:TextBox></td>
              <td class="column5" style="text-align:center;"><asp:TextBox ID="TextLocatorName" runat="server" ></asp:TextBox></td>
              <td class="column5" style="text-align:center;"><asp:Button ID="Button1"  runat="server" Text="אישור ההורדה" OnClick="BtnDownloadOk_Click" /></td>          
            </tr>            --%>                                                   
                </ItemTemplate>
            </asp:Repeater> 
            <%--<tr><td><asp:DropDownList ID="DdlSurfaceId" runat="server" AutoPostBack="true" OnTextChanged="DdlSurfaceId_TextChanged" ><asp:ListItem Text="בחר משטח"  Value="0" Disabled="True" Selected="True" /></asp:DropDownList></td></tr>--%>
        </table>          
      </div>  
        <asp:Panel ID="Panel2" runat="server" Visible="false" >
        <asp:Button ID="BtnNewRow" runat="server"  Text="+" OnClick="BtnNewRow_Click" />
            </asp:Panel>
    </div>      
  </div>
</div>                             
</center>
    </div>    
                </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>