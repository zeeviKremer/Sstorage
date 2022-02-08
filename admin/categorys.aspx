<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="categorys.aspx.cs" Inherits="Sstorage.admin.categorys" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title> קטגוריות | Sstorage</title>
<link rel="icon" type="image/png" href="/images/icon.png">
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
  <div class="container-table100" >
    <div class="wrap-table100" >
        <center>
            <div style="padding:0px 220px 7px 0px;">
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal">
                 הוספת קטגוריה חדשה
              </button>
              <br />
                <div id="Hidden"></div>
                <div id="Hid"></div>
                <div id="Hid2"></div>
                <div id="Hid5"></div>
            </div>         
      <div class="table100" id="tab" >                   
        <table>
          <thead>
            <tr class="table100-head">
              <th class="column1" style="text-align:center;width:12.5%;">קוד קטגוריה</th>
              <th class="column2" style="text-align:center;width:12.5%;">שם</th>
              <th class="column3" style="text-align:center;width:12.5%;">קטגורית אב</th>              
              <th class="column5" style="text-align:center;width:12.5%;">עריכה</th>              
            </tr>
          </thead>  
              <asp:Repeater ID="RptTable" runat="server">                
                <ItemTemplate>
                    <tr>
              <td class="column1" style="text-align:center;width:12.5%;" ><%#Eval("CatId") %></td>
              <td class="column2" style="text-align:center;width:12.5%;" ><%#Eval("CatName") %></td>
              <td class="column3" style="text-align:center;width:12.5%;" ><%#Eval("FatherName") %></td>              
              <td class="column7"><i class='fa fa-edit' data-toggle="modal" data-target="#exampleModal2" onclick='y(<%#Eval("CatId") %>)' style="font-size:16px;color:#0026ff;"></i></td>
            </tr>                                                          
                </ItemTemplate>
            </asp:Repeater>                               
        </table>         
      </div>
    </center>              
       <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <center><h5 style="font-size: 18px;font-family: 'Perpetua';" class="modal-title" id="exampleModalLabel">הוספת קטגוריה חדשה</h5></center>
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
                                קטגורית אב
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                  <asp:DropDownList ID="DdlFatherId" CssClass="ddl" onchange="validationText()"  runat="server" />                                  
                              </center>
                          </td>   
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                                שם קטגוריה
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                <span class="at1">
                                    <asp:TextBox ID="TxtCatName" runat="server" onkeyup="validationCatName()" />                             
                               </span>
                              </center>
                          </td> 
                      </tr>                                                                                                                   
                   </table>
                <br />                            
            </div>
            <div class="modal-footer" id="footer">
                  <asp:Button ID="BtnAdCat" disabled style="cursor: no-drop;"   CssClass="btn btn-primary" runat="server" Text="אישור"  />             
            </div>
          </div>
        </div>
      </div>



      <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <center><h5 style="font-size: 18px;font-family: 'Perpetua';" class="modal-title" id="exampleModalLabel2">עריכת פרטי קטגוריה</h5></center>
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
                                 קטגורית אב
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                  <asp:DropDownList ID="DdlFatherId2" CssClass="ddl" onchange="validationText2()"  runat="server" />                                  
                              </center>
                          </td>   
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                                שם קטגוריה
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                <span class="at1">
                                    <asp:TextBox ID="TxtCatName2" runat="server" onkeyup="validationCatName2()" />                             
                               </span>
                              </center>
                          </td> 
                      </tr>                                                                                                                   
                   </table>
                <br />                            
            </div>
            <div class="modal-footer" id="footer">
                <asp:Button ID="BtnAddCat2"   CssClass="btn btn-primary" runat="server" Text="אישור" OnClick="BtnAddCat2_Click" />             
            </div>
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
    </style>
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="js/main.js"></script>
<script src="js/main1.js"></script>
<script>
    var CatId = '', CatName = '', FatherId = ''
    var arr = [];
    function z(str) {
        console.log(str)
        for (let i = 0; i < str.length; i++)
            if (str[i] == '#')
                arr.push({});
        var size = 0;
        var catId, catName, fatherId, num
        for (var i = 1; i < str.length; i++) {
            if (str[i - 1] == '$' || str[i - 1] == '#') {
                for (var j = i, num = 0; str[j] != '#'; j++) {
                    if (str[j] == '*') {
                        num++;
                        j++;
                    }
                    if (str[j - 1] == '*' && num == 1) {
                        let k = 0;
                        for (let a = j; str[a] != '*'; a++, k++) { }
                        catId = str.substring(j, (j + k));
                        arr[size].catId = catId;
                    }
                    else if (str[j - 1] == '*' && num == 2) {
                        let k = 0;
                        for (let a = j; str[a] != '*'; a++, k++) { }
                        catName = str.substring(j, (j + k));
                        arr[size].catName = catName;
                    }
                    else if (str[j - 1] == '*' && num == 3) {
                        let k = 0;
                        for (let a = j; str[a] != '#'; a++, k++) { }
                        fatherId = str.substring(j, (j + k));
                        arr[size].fatherId = fatherId;
                    }                   
                }
                size++;
            }
        }
    }
    function y(id) {
        console.log(arr)
        for (var i = 0; i < arr.length; i++) {
            if (arr[i].catId == id) {
                document.getElementById('<%= DdlFatherId2.ClientID %>').value = arr[i].fatherId
                document.getElementById('<%= TxtCatName2.ClientID %>').value = arr[i].catName                   
            }
        }
        str = '<asp:HiddenField ID="Hidden3" runat="server"  ></asp:HiddenField> '
        document.getElementById('Hid').innerHTML = str
        document.getElementById('<%= Hidden3.ClientID %>').value = id
        }
        function validationText() {
            FatherId = document.getElementById('<%= DdlFatherId.ClientID %>').value.trim();                
            if (CatName != '') {                      
                var str1 = '<asp:Button ID="BtnAddCat" CssClass="btn btn-primary" runat="server"  Text="אישור" OnClick="BtnAddCat_Click"  />'
                var str2 = '<asp:HiddenField ID="Hidden1" runat="server"  ></asp:HiddenField> '
                document.getElementById('footer').innerHTML = str1
                document.getElementById('Hidden').innerHTML = str2
                document.getElementById('<%= Hidden1.ClientID %>').value = FatherId                      
            }        
        else {
            var str = '<asp:Button ID="BtnACt" disabled style="cursor: no-drop;" CssClass="btn btn-primary" runat="server"  Text="אישור"   />'
            document.getElementById('footer').innerHTML = str
        }

    }
    function validationText2() {    
        FatherId = document.getElementById('<%= DdlFatherId2.ClientID %>').value.trim();                                                    
        var str1 = '<asp:HiddenField ID="Hidden2" runat="server"  ></asp:HiddenField> '        
        document.getElementById('Hid2').innerHTML = str1
        document.getElementById('<%= Hidden2.ClientID %>').value = FatherId
        }   
    function validationCatName() {
        CatName = ''
        CatName = document.getElementById('<%= TxtCatName.ClientID %>').value.trim();        
        validationText()
    }   
    function validationCatName2() {
        CatName = ''
        CatName = document.getElementById('<%= TxtCatName2.ClientID %>').value.trim();        
        validationText2()
    }           
</script> 
<script>

    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'UA-23581568-13');          
</script>
</asp:Content>
