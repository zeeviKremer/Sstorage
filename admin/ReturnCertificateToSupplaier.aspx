<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="ReturnCertificateToSupplaier.aspx.cs" Inherits="Sstorage.admin.ReturnCertificateToSupplaier" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>תעודות הורדת מוצרים  | Sstorage</title>
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder0" runat="server">
    <asp:Literal ID="LtlUserDitels" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="limiter">
        <div class="container-table100">
            <div class="wrap-table100">
                <div class="table100">
                    <div>
                        <centr>
                חיפוש לפי               
                    <asp:DropDownList ID="DdlSerchCertificate" runat="server" OnTextChanged="DdlSerchCertificate_TextChanged1" AutoPostBack="true">
                    <asp:ListItem Disabled="True" Selected="True" Text="בחר אפשרות חיפוש" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="תאריך" Value="1"></asp:ListItem>
                    <asp:ListItem Text="קוד תעודה" Value="2"></asp:ListItem>
                    <asp:ListItem Text="שם ספק" Value="3"></asp:ListItem>   
                    <asp:ListItem Text="סטטוס בהכנה" Value="4"></asp:ListItem>
                    <asp:ListItem Text="סטטוס סגור" Value="5"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TxtCerch" runat="server" Visible="false"  placeholder="הזן פרמטר חיפוש" />
                    <asp:Button ID="Btnserch" Text="אישור" Visible="false" runat="server" OnClick="Btnserch_Click1" />

                <br />
                <br />
                    </centr>
                    </div>
                    <br />               
                     <table style="width: 800px;"><thead><tr class="table100-head">
                        <th class="column5" style="text-align: center;">תאריך</th>
                        <th class="column5" style="text-align: center;">קוד תעודה</th>
                        <th class="column5" style="text-align: center;">מחסן שולח</th>
                        <th class="column5" style="text-align: center;">שם ספק</th>
                        <th class="column5" style="text-align: center;">סטטוס</th>
                        <th class="column5" style="text-align: center;">עובד פותח תעודה</th>
                        </tr></thead>
                         <asp:Literal ID="Ltlaaa" runat="server" />
                         </table>                                       
                </div>
            </div>
        </div>
    </div>
   
</asp:Content>
