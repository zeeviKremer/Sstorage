<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="Sstorage.admin.products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<title> מוצרים | Sstorage</title>
<link rel="icon" type="image/png" href="/images/icon.png">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="css/plugins/dataTables.bootstrap.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder0" runat="server">
    <asp:Literal ID="LtlUserDitels" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
<div class="limiter">
  <div class="container-table100" >
      <center>      
      <div class="container">
          <div style="padding:0px 0px 16px 0px;">
              <button type="button" class="btn btn-primary"  data-toggle="modal" data-target="#exampleModal">
                 הוספת מוצר חדש
              </button>
              </div>
          <div class="row" >
              <asp:Repeater ID="RptTable" runat="server">                
                  <ItemTemplate>
                      <div class="col col-lg-3 col-md-6 col-sm-12" >
                          <center>
                              <h1><%#Eval("ProdName") %></h1><br />
                              <img src="../uploads/images/products/<%#Eval("PicName") %>" /><br /><br />
                              <h4><%#Eval("Price") %>   ש"ח</h4><br />
                          </center>
                      </div>
                  </ItemTemplate>
              </asp:Repeater>
          </div>
       </div>
          </center>
       <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <center><h5 style="font-size: 18px;font-family: 'Perpetua';" class="modal-title" id="exampleModalLabel">הוספת מוצר חדש</h5></center>
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
                                קטגוריה
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                  <asp:DropDownList ID="DdlCatId" CssClass="ddl" onchange="validationText()"  runat="server" />                                  
                              </center>
                          </td>   
                      </tr>
                      <tr>
                          <td style="width:50%;background-color:#ffffff;font-family: 'Perpetua';font-size: 18px;color:#000000;">                
                              <center>                    
                                שם מוצר
                              </center>
                          </td>
                          <td style="width:50%;background-color:#ffffff;">
                              <center>
                                <span class="at1">
                                    <asp:TextBox ID="TxtPtorName" runat="server" onkeyup="validationProdName()" />                             
                               </span>
                              </center>
                          </td> 
                      </tr>                                                                                                                   
                   </table>
                <br />                            
            </div>
            <div class="modal-footer" id="footer">
                  <asp:Button ID="BtnAdProd" disabled style="cursor: no-drop;"   CssClass="btn btn-primary" runat="server" Text="אישור"  />             
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
  </div>
</div>
    
    
    <script src="js/jquery/jquery.dataTables.min.js"></script>
    <script src="js/bootstrap/dataTables.bootstrap.min.js"></script>
    <%--<script>
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
    </script>--%>      
</asp:Content>
