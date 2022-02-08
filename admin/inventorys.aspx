<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="inventorys.aspx.cs" Inherits="Sstorage.admin.inventorys" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <title> מלאים  | Sstorage</title> 
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
            <div style="padding:0px 290px 7px 0px;">
              חיפוש מוצר לפי
                <span class="b" onclick="t(1)">שם</span>
                <span style="padding:5px 5px 7px 5px;">  / </span>
                <span class="b" onclick="t(2)">מק"ט</span>
                <span style="padding:5px 5px 7px 5px;">  / </span>
                <span class="b" style="padding:0px 0px 7px 5px;" onclick="t(3)">ברקוד  </span><br />               
                <asp:DropDownList ID="DdlSerch" CssClass="f" runat="server" AutoPostBack="true" OnTextChanged="DdlSerch_TextChanged" Width="200" ></asp:DropDownList>
                <asp:DropDownList ID="DdlSerch2" CssClass="e" runat="server" AutoPostBack="true" OnTextChanged="DdlSerch2_TextChanged" Width="200" ></asp:DropDownList>
                <asp:DropDownList ID="DdlSerch3" CssClass="e" runat="server" AutoPostBack="true" OnTextChanged="DdlSerch3_TextChanged" Width="200" ></asp:DropDownList>
            </div>                     
      <div class="table100"  id="tab" >                   
        <table>
          <thead>
            <tr class="table100-head">
              <th class="column1" style="text-align:center;width:12.5%;">קוד מחסן</th>
              <th class="column2" style="text-align:center;width:12.5%;">שם</th>
              <th class="column3" style="text-align:center;width:12.5%;">כמות ביחידות</th>
              <th class="column4" style="text-align:center;width:12.5%;">מיקומים</th>                      
            </tr>
          </thead>
              <asp:Repeater ID="RptTable" runat="server">                
                <ItemTemplate>
                    <tr >
                        <td class="column1" style="text-align:center;width:12.5%;" ><%#Eval("StoragesLocatorId") %></td>
                        <td class="column2" style="text-align:center;width:12.5%;" ><%#Eval("StorageName") %></td>
                        <td class="column3" ID="0<%#Eval("StoragesLocatorId") %>" style="text-align:center;width:12.5%;" ><%#Eval("Quantity") %></td>
                        <td class="column4" style="text-align:center;width:12.5%;" id="<%#Eval("StoragesLocatorId") %>" ><%#Eval("LocatorName") %></td>              
                    </tr>                                                          
                </ItemTemplate>
            </asp:Repeater>                               
        </table>  
          <br />
          <br />
          אם יש כמה מיקומים שיהיה סליידר דאון וגם אם מחסן רזרבות לעשות סליידר דאון למשטחים
      </div>
    </center>                   
    </div>
  </div>
</div>


    <span id="e">מה קורה</span>
<table>
    <tr>        
        <td>:מיקומים<br />  איתור   מספר משטח   כמות<br />  איתור   מספר משטח   כמות<br />  איתור   מספר משטח   כמות<br />  חילוץ הפרודקט בפונקציית aaa  </td>
    </tr>
</table>
    <asp:Literal ID="str" runat="server" />
    <asp:Literal ID="str1" runat="server" />
<style>
        .e{
            display:none;
            Width:200px;
        }
        .f{            
            Width:200px;
        }
        #tab{
            width:1000px;
            padding:0px 150px 6px 0px;            
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
        .b{
            
            cursor:pointer;
            
        }
        
    </style>  
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="js/main.js"></script>
<script src="js/main1.js"></script>
    <script>                                                 
        var arrLocators = []
        var arrStorages = []
        var arrProducts = []       
        var arrSurfaces = []
        var index           
        function t(id) {
            if (id == 1) {
                document.getElementById("<%= DdlSerch.ClientID %>").style = "display:block;"
                document.getElementById("<%= DdlSerch2.ClientID %>").style = "display:none;"
                document.getElementById("<%= DdlSerch3.ClientID %>").style = "display:none;"
            }
            if (id == 2) {
                document.getElementById("<%= DdlSerch.ClientID %>").style = "display:none;"
                document.getElementById("<%= DdlSerch2.ClientID %>").style = "display:block;"
                document.getElementById("<%= DdlSerch3.ClientID %>").style = "display:none;"
            }
            if (id == 3) {
                document.getElementById("<%= DdlSerch.ClientID %>").style = "display:none;"
                document.getElementById("<%= DdlSerch2.ClientID %>").style = "display:none;"
                document.getElementById("<%= DdlSerch3.ClientID %>").style = "display:block;"
            }            
            var dropdown = document.getElementById("<%= DdlSerch.ClientID %>");
            dropdown.options[dropdown.options.length] = new Option(`${arrProducts[0].ProdName}`, `${arrProducts[0].ProdId}`)
            dropdown.innerHTML = ""
            for (let i = 0; i < arrProducts.length; i++) {
                if (id == 1)
                    dropdown.options[dropdown.options.length] = new Option(`${arrProducts[i].ProdName}`, `${arrProducts[i].ProdId}`)
                if (id == 2)
                    dropdown.options[dropdown.options.length] = new Option(`${arrProducts[i].ShorBarcode}`, `${arrProducts[i].ProdId}`)
                if (id == 3)
                    dropdown.options[dropdown.options.length] = new Option(`${arrProducts[i].Barcode}`, `${arrProducts[i].ProdId}`)
            }                        
        }
        function aa(str) {          
            for (let i = 0; i < str.length; i++)
                if (str[i] == '#')
                    arrProducts.push({});
            var size = 0;
            var ProdId, ProdName, ShorBarcode, Barcode, num;
            for (var i = 1; i< str.length; i++) {
                if (str[i - 1] == '$' || str[i - 1] == '#') {
                    for (var j = i, num = 0; str[j] != '#'; j++) {
                        if (str[j] == '*') {
                            num++;
                            j++;
                        }
                        if (str[j - 1] == '*' && num == 1) {
                            let k = 0;
                            for (let a = j; str[a] != '*'; a++, k++) { }
                            ProdId = str.substring(j, (j + k));
                            arrProducts[size].ProdId = ProdId;
                        }
                        else if (str[j - 1] == '*' && num == 2) {
                            let k = 0;
                            for (let a = j; str[a] != '*'; a++, k++) { }
                            ProdName = str.substring(j, (j + k));
                            arrProducts[size].ProdName = ProdName;
                        }
                        else if (str[j - 1] == '*' && num == 3) {
                            let k = 0;
                            for (let a = j; str[a] != '*'; a++, k++) { }
                            ShorBarcode = str.substring(j, (j + k));
                            arrProducts[size].ShorBarcode = ShorBarcode;
                        }
                        else if (str[j - 1] == '*' && num == 4) {
                            let k = 0;
                            for (let a = j; str[a] != '#'; a++, k++) { }
                            Barcode = str.substring(j, (j + k));
                            arrProducts[size].Barcode = Barcode;
                        }
                    }
                    size++;
                }
            }           
            
        }                
        function slieder(id) {
            console.log(id)           
            document.getElementById("" + id).classList.toggle('closed');
        }
        function func1(str) {                        
            for (let i = 0; i < str.length; i++)
                if (str[i] == '#')
                    arrLocators.push({});
            var size = 0;
            var StorageId, SurfId, LocatorName, Quantity, num;
            arrLocators[0].StorageId = ''           
            arrLocators[0].LocatorName = ''
            arrLocators[0].Quantity = ''
            for (var i = 1;  str[i+1] != '$'; i++) {                
                if (str[i - 1] == '$' || str[i - 1] == '#') {
                    if (str[i] == '@' && str[i + 1] == '3') {                        
                        for (var j = i, num = 0; str[j] != '#'; j++) {
                            if (str[j] == '@') {
                                num++;
                                j++;
                            }
                            if (str[j - 1] == '@' && num == 1) {
                                let k = 0;
                                for (let a = j; str[a] != '@'; a++, k++) { }
                                StorageId = str.substring(j, (j + k));
                                arrLocators[size].StorageId = StorageId;
                            }
                            else if (str[j - 1] == '@' && num == 2) {
                                let k = 0;
                                for (let a = j; str[a] != '@'; a++, k++) { }
                                SurfId = str.substring(j, (j + k));
                                arrLocators[size].SurfId = SurfId;
                            }
                            else if (str[j - 1] == '@' && num == 3) {
                                let k = 0;
                                for (let a = j; str[a] != '@'; a++, k++) { }
                                LocatorName = str.substring(j, (j + k));
                                arrLocators[size].LocatorName = LocatorName;
                            }
                            else if (str[j - 1] == '@' && num == 4) {
                                let k = 0;
                                for (let a = j; str[a] != '#'; a++, k++) { }
                                Quantity = str.substring(j, (j + k));
                                arrLocators[size].Quantity = Quantity;
                            }
                            
                            
                        }
                    }
                    else {
                        for (var j = i, num = 0; str[j] != '#'; j++) {
                            if (str[j] == '@') {
                                num++;
                                j++;
                            }
                            if (str[j - 1] == '@' && num == 1) {
                                let k = 0;
                                for (let a = j; str[a] != '@'; a++, k++) { }
                                StorageId = str.substring(j, (j + k));
                                arrLocators[size].StorageId = StorageId;
                            }
                            else if (str[j - 1] == '@' && num == 2) {
                                let k = 0;
                                for (let a = j; str[a] != '@'; a++, k++) { }
                                LocatorName = str.substring(j, (j + k));
                                arrLocators[size].LocatorName = LocatorName;
                            }
                            else if (str[j - 1] == '@' && num == 3) {
                                let k = 0;
                                for (let a = j; str[a] != '#'; a++, k++) { }
                                Quantity = str.substring(j, (j + k));
                                arrLocators[size].Quantity = Quantity;
                            }
                        }
                    }                    
                    size++;
                }
            }
            func3()
            //var html = `<i class="fa fa-angle-down" onclick=func2(${arrLocators[0].StorageId}) style="cursor:pointer;font-size:24px;color:#0026ff;"></i>`
            //document.getElementById('' + arrLocators[0].StorageId).innerHTML = html
            //for (index = 1; str[index] != '$'; index++) { }
            //str = str.substring(index, str.length)
            //if (str.length > 2) {
            //    //$ * 4 * 1 * A4H2 - 2 * 500# * 4 * 8 * B1H1 - 3 * 5# *
            //    console.log("נכנסתי 2")
            //    for (let i = 0; i < str.length; i++)
            //        if (str[i] == '#')
            //            arrSurfaces.push({});
            //    var size = 0;
            //    var StorageId, SurfaceId, LocatorName, Quantity, num;
            //    for (var i = 1; i < str[i] != '$'; i++) {
            //        if (str[i - 1] == '$' || str[i - 1] == '#') {
            //            for (var j = i, num = 0; str[j] != '#'; j++) {
            //                if (str[j] == '*') {
            //                    num++;
            //                    j++;
            //                }
            //                if (str[j - 1] == '*' && num == 1) {
            //                    let k = 0;
            //                    for (let a = j; str[a] != '*'; a++, k++) { }
            //                    StorageId = str.substring(j, (j + k));
            //                    arrSurfaces[size].StorageId = StorageId;
            //                }
            //                else if (str[j - 1] == '*' && num == 2) {
            //                    let k = 0;
            //                    for (let a = j; str[a] != '*'; a++, k++) { }
            //                    SurfaceId = str.substring(j, (j + k));
            //                    arrSurfaces[size].SurfaceId = SurfaceId;
            //                }
            //                else if (str[j - 1] == '*' && num == 3) {
            //                    let k = 0;
            //                    for (let a = j; str[a] != '*'; a++, k++) { }
            //                    LocatorName = str.substring(j, (j + k));
            //                    arrSurfaces[size].LocatorName = LocatorName;
            //                }
            //                else if (str[j - 1] == '*' && num == 4) {
            //                    let k = 0;
            //                    for (let a = j; str[a] != '#'; a++, k++) { }
            //                    Quantity = str.substring(j, (j + k));
            //                    arrSurfaces[size].Quantity = Quantity;
            //                }
            //            }
            //            size++;
            //        }
            //    }
            //}
            //console.log(arrLocators)
            //console.log(arrSurfaces)
        }
        function func2(id) {
            console.log(id)
            var html = '<button style="width:48px;color:black; background-color:red;" onclick="p1(' + id + ');">סגירה</button><br/>';
            html += '<table ><tr class="ro"><td>מיקום</td>';
            html += '<td class="column">כמות</td></tr>';                                
            for (var i = 0; i < arrLocators.length; i++) {
                html += '<tr><td>' + arrLocators[i].LocatorName;
                html += '</td><td>' + arrLocators[i].Quantity;                
                html += '</td></tr>';
            }
            html += '</table>'; 
            document.getElementById("" + id).innerHTML = (html);
            //setTimeout('slieder(' + id + ');return false;', 20);
            setTimeout('p1(' + id + ');', 20);
        }
        function func3() {
            var flag
            arrStorages.push({ StorageId: '' + arrLocators[0].StorageId, Quantity: parseInt("" + arrLocators[0].Quantity) })
            for (let i = 1; i < arrLocators.length; i++) {
                flag = 0
                if (arrLocators[i].StorageId == arrStorages[0].StorageId)
                    arrStorages[0].Quantity += parseInt("" + arrLocators[i].Quantity)
                else {
                    for (let j = 0; j < arrStorages.length; j++) {
                        if (arrLocators[i].StorageId == arrStorages[j].StorageId) {
                            arrStorages[j].Quantity += parseInt("" + arrLocators[i].Quantity)
                            flag = 1
                        }
                    }
                    if (flag == 0)
                        arrStorages.push({ StorageId: '' + arrLocators[i].StorageId, Quantity: parseInt("" + arrLocators[i].Quantity) })
                }
            }
            for (let i = 0; i < arrStorages.length; i++) {
                document.getElementById("0" + arrStorages[i].StorageId).innerHTML = arrStorages[i].Quantity                
            }
            document.getElementById("e" ).addEventListener("click", sli("3" ))
        }
        function sli(u) {
            console.log(u*2)
        }
    </script>
    <%--onclick="slieder(<%#Eval("StoragesLocatorId") %>)"--%>
    <%--document.getElementById("" + arrStorages[i].StorageId).addEventListener("click", slieder("" + arrStorages[i].StorageId))--%>
</asp:Content>
