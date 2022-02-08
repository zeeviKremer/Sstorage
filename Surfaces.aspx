<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="Surfaces.aspx.cs" Inherits="Sstorage.admin.Surfaces" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title> משטחים | Sstorage</title> 
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
         <div style="padding:60px 335px 7px 0px;">
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal">
                 פתיחת משטח חדש
              </button>             
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal2">
                 עידכון איתור משטח
              </button>
             <asp:Button ID="SurfacesMap" runat="server" CssClass="btn btn-primary" Text="מפת משטחים" OnClick="SurfacesMap_Click" />             
             <br /><br />
             <span id="surfaceNumber"></span>
         </div>
         <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <center><h5 style="font-size: 18px;font-family: 'Perpetua';" class="modal-title" id="exampleModalLabel">פתיחת משטח חדש</h5></center>
                            <button type="button"  class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" >&times;</span>                  
                            </button>
                    </div>
                    <div class="modal-body">              
                        <br />
                        <table style="width:570px;" border="0">                             
                            <tr>
                               <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                                   <center>                    
                                   שם מוצר 
                                   </center>
                               </td>
                               <td style="width:50%;background-color:#ffffff;">
                                   <center>                                       
                                           <asp:DropDownList ID="DdlProdName" runat="server" CssClass="ddl"  />                                                                    
                                   </center>
                               </td> 
                            </tr>
                            <tr>
                                <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">
                                    <center>
                                        כמות ביחידות
                                    </center>
                                </td>
                                <td style="width:50%;background-color:#ffffff;">
                                    <center>
                                        <span class="at1" >
                                            <asp:TextBox ID="TxtQty"   runat="server" onkeyup="validationQty()" />                                  
                                        </span>
                                    </center>
                                </td>   
                            </tr>
                            <tr>
                                <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                                  כמות בקרטונים
                              </center>
                          </td>
                          <td style="background-color:#ffffff;">
                              <center>
                                 <span class="at1" >
                                    <asp:TextBox ID="TxtQtyBox"   runat="server" onkeyup="validationQtyBox()" />                             
                                 </span>
                              </center>
                          </td> 
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                                  הערות
                              </center>
                          </td>
                          <td class="at4" style="width:172px;background-color:#ffffff;">                                                                
                                  <asp:TextBox ID="TxtRemarks" CssClass="at5"  TextMode="MultiLine" Width="300" Height="100"  runat="server" onkeyup="validationRemarks()" />                                                                                                                         
                          </td> 
                      </tr>                                                                                             
                   </table>
                <br />                            
            </div>
            <div class="modal-footer" id="footer">                             
              <asp:Button ID="BtnAdStor" disabled style="cursor: no-drop;" CssClass="btn btn-primary" runat="server" CommandArgument=""  Text="אישור" />                                       
            </div>
          </div>
        </div>
      </div>
          <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <center><h5 style="font-size: 18px;font-family: 'Perpetua';" class="modal-title" id="exampleModalLabel2">עידכון איתור משטח</h5></center>
                            <button type="button"  class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" >&times;</span>                  
                            </button>
                    </div>
                    <div class="modal-body">              
                        <br />
                        <table style="width:570px;" border="0">                             
                            <tr>
                               <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                                   <center>                    
                                   מספר משטח 
                                   </center>
                               </td>
                               <td style="width:50%;background-color:#ffffff;">
                                   <center>
                                       <span class="at1" >
                                           <asp:TextBox  onmousedown="mousedown()" ID="TxtSrfId" runat="server" onkeyup="validationSrfId()" >                                               
                                           </asp:TextBox>
                                           
                                       </span>
                                   </center>
                               </td> 
                            </tr>
                            <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">
                              <center>
                                 איתור חדש
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                  <span class="at1" >
                                      <asp:TextBox ID="TxtSrfLocator" runat="server" onkeyup="validationSrfLocator()" />                                  
                                  </span>
                              </center>
                          </td>   
                      </tr>                                                                                                                   
                   </table>
                <br />                            
            </div>
            <div class="modal-footer" id="footer2">                             
              <asp:Button ID="BtnSub" disabled style="cursor: no-drop;"  CssClass="btn btn-primary" runat="server"  Text="אישור" OnClick="BtnSubmit2_Click" />                                       
            </div>
          </div>
        </div>
      </div>
     </div>   
</div>
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
        .at4{
            
            border-style: inset;
            border-width: 2px;
            width:172px;
        }
        .at5{           
            border: none;
            outline: none;
        }
    </style>   
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="js/main.js"></script>
<script src="js/main1.js"></script>
<script>
    var prodName, Qty, QtyBox, SrfId='', SrfLocator=''
    function mousedown() {
        document.getElementById('cars').style = 'display:none'
        console.log('ppppppppppp')
    }
    function surfaceNumber(Number) {
        let str = 'המשטח נפתח בהצלחה <br />מספר המשטח הוא ' + Number
        document.getElementById('surfaceNumber').innerHTML = str
    }
    function validationText() {
        prodName = document.getElementById('<%= DdlProdName.ClientID %>').value.trim();
        if (Qty != '' && QtyBox != '') {
            var str1 = '<asp:Button ID="BtnSubmit" CssClass="btn btn-primary" runat="server"  Text="אישור" OnClick="BtnSubmit_Click"  />'
            var str2 = '<asp:HiddenField ID="Hidden1" runat="server"  ></asp:HiddenField>'
            document.getElementById('footer').innerHTML = str1
            document.getElementById('Hidden').innerHTML = str2            
            document.getElementById('<%= Hidden1.ClientID %>').value = prodName
        }
        else {
            var str = '<asp:Button ID="Btn1" disabled style="cursor: no-drop;" CssClass="btn btn-primary" runat="server"  Text="אישור"   />'
            document.getElementById('footer').innerHTML = str
        }

    }
    function validationText2() {
        if (SrfId != '' && SrfLocator != '') {
            var str1 = '<asp:Button ID="BtnSubmit2" CssClass="btn btn-primary" runat="server"  Text="אישור" OnClick="BtnSubmit2_Click"  />'
            document.getElementById('footer2').innerHTML = str1                       
        }
        else {
            var str = '<asp:Button ID="Btn" disabled style="cursor: no-drop;" CssClass="btn btn-primary" runat="server"  Text="אישור"   />'
            document.getElementById('footer2').innerHTML = str     
        }        
    }
    function validationQty() {
        Qty = ''
        Qty = document.getElementById('<%= TxtQty.ClientID %>').value.trim();
        validationText()
    }
    function validationQtyBox() {
        QtyBox = ''
        QtyBox = document.getElementById('<%= TxtQtyBox.ClientID %>').value.trim();
        validationText()
    }     
    function validationSrfId() {
        SrfId = ''
        SrfId = document.getElementById('<%= TxtSrfId.ClientID %>').value.trim();
        validationText2()
    }
    function validationSrfLocator() {
        SrfLocator = ''
        SrfLocator = document.getElementById('<%= TxtSrfLocator.ClientID %>').value.trim();
        validationText2()
    }       
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
</script>
</asp:Content>
