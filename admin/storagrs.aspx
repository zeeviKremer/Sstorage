<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="storagrs.aspx.cs" Inherits="Sstorage.admin.storagrs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title> מחסנים | Sstorage</title>
<link rel="icon" type="image/png" href="/images/icon.png">
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
            <div style="padding:0px 235px 7px 0px;">
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal">
                 הוספת מחסן חדש
              </button>
              <br />
                <div id="Hidden"></div>
                <div id="Hid"></div>
                <div id="Hid2"></div>
            </div>         
      <div class="table100" id="tab" >                   
        <table>
          <thead>
            <tr class="table100-head">
              <th class="column1" style="text-align:center;width:12.5%;">קוד מחסן</th>
              <th class="column2" style="text-align:center;width:12.5%;">שם</th>
              <th class="column3" style="text-align:center;width:12.5%;">עיר</th>
              <th class="column4" style="text-align:center;width:12.5%;">כתובת</th>
              <th class="column5" style="text-align:center;width:12.5%;">מנהל</th>
              <th class="column5" style="text-align:center;width:12.5%;">טלפון</th>
              <th class="column5" style="text-align:center;width:12.5%;">דואר אלקרוני</th>
              <th class="column5" style="text-align:center;width:12.5%;">עריכה</th>              
            </tr>
          </thead>  
              <asp:Repeater ID="RptTable" runat="server">                
                <ItemTemplate>
                    <tr>
              <td class="column1" style="text-align:center;width:12.5%;" ><%#Eval("StorageId") %></td>
              <td class="column2" style="text-align:center;width:12.5%;" ><%#Eval("StorageName") %></td>
              <td class="column3" style="text-align:center;width:12.5%;" ><%#Eval("CityName") %></td>
              <td class="column4" style="text-align:center;width:12.5%;" ><%#Eval("Address") %></td>
              <td class="column5" style="text-align:center;width:12.5%;" ><%#Eval("DirectorName") %></td>
              <td class="column5" style="text-align:center;width:12.5%;" ><%#Eval("Phone") %></td>
              <td class="column5" style="text-align:center;width:12.5%;" ><%#Eval("Email") %></td>
              <td class="column7"><i class='fa fa-edit' data-toggle="modal" data-target="#exampleModal2" onclick='y(<%#Eval("StorageId") %>)' style="font-size:16px;color:#0026ff;"></i></td>
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
              <center><h5 style="font-size: 18px;font-family: 'Perpetua';" class="modal-title" id="exampleModalLabel">הוספת מחסן חדש</h5></center>
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
                                שם 
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                <span class="at1" >
                                    <asp:TextBox ID="TxtName" runat="server" onkeyup="validationName()" />                             
                               </span>
                              </center>
                          </td> 
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">
                              <center>
                                 עיר
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                  <asp:DropDownList ID="DdlCity" CssClass="ddl"  runat="server" />                                  
                              </center>
                          </td>   
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                               כתובת
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                <span class="at1" >
                                    <asp:TextBox ID="TxtAddress" runat="server" onkeyup="validationAddress()" />                             
                               </span>
                              </center>
                          </td> 
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                                מנהל
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                <span class="at1" >
                                    <asp:TextBox ID="TxtDcrName" runat="server" onkeyup="validationDcrName()" />                             
                               </span>
                              </center>
                          </td> 
                      </tr>
                      <tr>
                         <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                             <center>                    
                                 טלפון
                             </center>
                         </td>
                         <td style="width:50%;background-color:#ffffff;">
                             <center>
                                <span class="at1">
                                    <asp:TextBox ID="TxtPhone" runat="server" onkeyup="validationPhone()" />                                 
                                </span>
                             </center>
                         </td> 
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                                דואר אלקטרוני
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                  <span class="at1">
                                   <asp:TextBox ID="TxtEmail" runat="server" onkeyup="validationEmail()" />                                                                        
                                  </span>
                              </center>
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



      <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <center><h5 style="font-size: 18px;font-family: 'Perpetua';" class="modal-title" id="exampleModalLabel2">עריכת פרטי מחסן</h5></center>
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
                                שם 
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                <span class="at1" >
                                    <asp:TextBox ID="TxtName2" runat="server" onkeyup="validationName2()" />                             
                               </span>
                              </center>
                          </td> 
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">
                              <center>
                                 עיר
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                  <asp:DropDownList ID="DdlCity2" CssClass="ddl"  runat="server" />                                  
                              </center>
                          </td>   
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                               כתובת
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                <span class="at1" >
                                    <asp:TextBox ID="TxtAddress2" runat="server" onkeyup="validationAddress2()" />                             
                               </span>
                              </center>
                          </td> 
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                                מנהל
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                <span class="at1" >
                                    <asp:TextBox ID="TxtDcrName2" runat="server" onkeyup="validationDcrName2()" />                             
                               </span>
                              </center>
                          </td> 
                      </tr>
                      <tr>
                         <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                             <center>                    
                                 טלפון
                             </center>
                         </td>
                         <td style="width:50%;background-color:#ffffff;">
                             <center>
                                <span class="at1">
                                    <asp:TextBox ID="TxtPhone2" runat="server" onkeyup="validationPhone2()" />                                 
                                </span>
                             </center>
                         </td> 
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                                דואר אלקטרוני
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                  <span class="at1">
                                   <asp:TextBox ID="TxtEmail2" runat="server" onkeyup="validationEmail2()" />                                                                        
                                  </span>
                              </center>
                          </td> 
                      </tr>                                                                        
                   </table>                   
                <br />                            
            </div>
            <div class="modal-footer" id="footer">                             
              <asp:Button ID="BtnAddStor2"  CssClass="btn btn-primary" runat="server" CommandArgument=""  Text="אישור" OnClick="BtnAddStor2_Click"/>                                        
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
    var storName = '', city = '',cityid='',  address = '', dctName = '',  phone = '', email = ''           
    var arr = [];
    var arrCitys = [];
    function z3(str) {
        console.log('ttttttttttt')
        for (let i = 0; i < str.length; i++)
            if (str[i] == '#')
                arrCitys.push({});
        var size = 0;
        var CityId, CityName, num
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
                        CityId = str.substring(j, (j + k));
                        arrCitys[size].CityId = CityId;
                    }
                    else if (str[j - 1] == '*' && num == 2) {
                        let k = 0;
                        for (let a = j; str[a] != '#'; a++, k++) { }
                        CityName = str.substring(j, (j + k));
                        arrCitys[size].CityName = CityName;
                    }                    
                }
                size++;
            }
        }
    }
    function z(str) {        
        var fullstr = str.split('~')
        var str1 = fullstr[0]
        var str2 = fullstr[1]
        console.log(str1)
        for (let i = 0; i < str1.length; i++)
            if (str1[i] == '#')
                arr.push({});
        var size = 0;
        var StorId, StorName, City, Address, DctName, Phone, Email, num
        for (var i = 1; i < str1.length; i++) {
            if (str1[i - 1] == '$' || str1[i - 1] == '#') {
                for (var j = i, num = 0; str1[j] != '#'; j++) {
                    if (str1[j] == '*') {
                        num++;
                        j++;
                    }
                    if (str1[j - 1] == '*' && num == 1) {
                        let k = 0;
                        for (let a = j; str1[a] != '*'; a++, k++) { }
                        StorId = str1.substring(j, (j + k));
                        arr[size].StorId = StorId;
                    }
                    else if (str1[j - 1] == '*' && num == 2) {
                        let k = 0;
                        for (let a = j; str1[a] != '*'; a++, k++) { }
                        StorName = str1.substring(j, (j + k));
                        arr[size].StorName = StorName;
                    }
                    else if (str1[j - 1] == '*' && num == 3) {
                        let k = 0;
                        for (let a = j; str1[a] != '*'; a++, k++) { }
                        City = str1.substring(j, (j + k));
                        arr[size].City = City;
                    }
                    else if (str1[j - 1] == '*' && num == 4) {
                        let k = 0;
                        for (let a = j; str1[a] != '*'; a++, k++) { }
                        Address = str1.substring(j, (j + k));
                        arr[size].Address = Address;
                    }
                    else if (str1[j - 1] == '*' && num == 5) {
                        let k = 0;
                        for (let a = j; str1[a] != '*'; a++, k++) { }
                        DctName = str1.substring(j, (j + k));
                        arr[size].DctName = DctName;
                    }
                    else if (str1[j - 1] == '*' && num == 6) {
                        let k = 0;
                        for (let a = j; str1[a] != '*'; a++, k++) { }
                        Phone = str1.substring(j, (j + k));
                        arr[size].Phone = Phone;
                    }                    
                    else if (str1[j - 1] == '*' && num == 7) {
                        let k = 0;
                        for (let a = j; str1[a] != '#'; a++, k++) { }
                        Email = str1.substring(j, (j + k));
                        arr[size].Email = Email;
                    }
                }
                size++;
            }
        }
        console.log(str2)
        for (let i = 0; i < str2.length; i++)
            if (str2[i] == '#')
                arrCitys.push({});
        var size = 0;
        var CityId, CityName, num
        for (var i = 1; i < str2.length; i++) {
            if (str2[i - 1] == '$' || str2[i - 1] == '#') {
                for (var j = i, num = 0; str2[j] != '#'; j++) {
                    if (str2[j] == '*') {
                        num++;
                        j++;
                    }
                    if (str2[j - 1] == '*' && num == 1) {
                        let k = 0;
                        for (let a = j; str2[a] != '*'; a++, k++) { }
                        CityId = str2.substring(j, (j + k));
                        arrCitys[size].CityId = CityId;
                    }
                    else if (str2[j - 1] == '*' && num == 2) {
                        let k = 0;
                        for (let a = j; str2[a] != '#'; a++, k++) { }
                        CityName = str2.substring(j, (j + k));
                        arrCitys[size].CityName = CityName;
                    }
                }
                size++;
            }
        }
    }
    function y(id) {        
        for (let i = 0; i < arr.length; i++) {
            if (arr[i].StorId == id) {
                document.getElementById('<%= TxtName2.ClientID %>').value = arr[i].StorName
                for (let j = 0; j < arrCitys.length; j++)
                    if (arrCitys[j].CityName == arr[i].City)
                        document.getElementById('<%= DdlCity2.ClientID %>').value = arrCitys[j].CityId
                        
                document.getElementById('<%= TxtAddress2.ClientID %>').value = arr[i].Address
                document.getElementById('<%= TxtDcrName2.ClientID %>').value = arr[i].DctName
                document.getElementById('<%= TxtPhone2.ClientID %>').value = arr[i].Phone
                document.getElementById('<%= TxtEmail2.ClientID %>').value = arr[i].Email
            }
        }                 
        str = '<asp:HiddenField ID="Hidden3" runat="server"  ></asp:HiddenField> '
        document.getElementById('Hid').innerHTML = str                
        document.getElementById('<%= Hidden3.ClientID %>').value = id
    }
    function validationText() { 
        city = document.getElementById('<%= DdlCity.ClientID %>').value.trim();                
        if (storName != '' && address != '' && dctName != '' && phone != '' && email != '' ) {                      
            var str1 = '<asp:Button ID="BtnAddStor" CssClass="btn btn-primary" runat="server"  Text="אישור" OnClick="BtnAddStor_Click"  />'
            var str2 = '<asp:HiddenField ID="Hidden1" runat="server"  ></asp:HiddenField><asp:HiddenField ID="Hidden11" runat="server"  ></asp:HiddenField> '
            document.getElementById('footer').innerHTML = str1
            document.getElementById('Hidden').innerHTML = str2
            for (let i = 0; i < arrCitys.length; i++)
                if (arrCitys[i].CityId == city)
                    document.getElementById('<%= Hidden11.ClientID %>').value = arrCitys[i].CityName
            document.getElementById('<%= Hidden1.ClientID %>').value = city                      
        }        
        else {
            var str = '<asp:Button ID="BtnAStor" disabled style="cursor: no-drop;" CssClass="btn btn-primary" runat="server"  Text="אישור"   />'
            document.getElementById('footer').innerHTML = str
        }

    }
    function validationText2() {        
        city = document.getElementById('<%= DdlCity2.ClientID %>').value.trim();                                                    
        var str1 = '<asp:HiddenField ID="Hidden2" runat="server"  ></asp:HiddenField><asp:HiddenField ID="Hidden12" runat="server"  ></asp:HiddenField> '
        console.log(city)
        document.getElementById('Hid2').innerHTML = str1
        for (let i = 0; i < arrCitys.length; i++)
            if (arrCitys[i].CityId == city)
                document.getElementById('<%= Hidden12.ClientID %>').value = arrCitys[i].CityName
        document.getElementById('<%= Hidden2.ClientID %>').value = city
        }   
    function validationName() {
        storName = ''
        storName = document.getElementById('<%= TxtName.ClientID %>').value.trim();        
        validationText()
    }
    function validationAddress() {
        address = ''
        address = document.getElementById('<%= TxtAddress.ClientID %>').value.trim();
        validationText()
    } 
    function validationDcrName() {
        dctName = ''
        dctName = document.getElementById('<%= TxtDcrName.ClientID %>').value.trim();
        validationText()
    } 
    function validationPhone() {
        phone = ''
        phone = document.getElementById('<%= TxtPhone.ClientID %>').value.trim();      
        validationText()
    }
    function validationEmail() {
        email = ''
        email = document.getElementById('<%= TxtEmail.ClientID %>').value.trim();                
        validationText()
    }
    function validationName2() {
        storName = ''
        storName = document.getElementById('<%= TxtName2.ClientID %>').value.trim();
        validationText2()
    }
    function validationAddress2() {
        address = ''
        address = document.getElementById('<%= TxtAddress2.ClientID %>').value.trim();
        validationText2()
    }
    function validationDcrName2() {
        dctName = ''
        dctName = document.getElementById('<%= TxtDcrName2.ClientID %>').value.trim();
        validationText2()
    } 
    function validationPhone2() {
        phone = ''
        phone = document.getElementById('<%= TxtPhone2.ClientID %>').value.trim();      
        validationText2()
    }
    function validationEmail2() {
        email = ''
        email = document.getElementById('<%= TxtEmail2.ClientID %>').value.trim();
        validationText2()
    }
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
</script> 
</asp:Content>
