<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="absorptionProducts.aspx.cs" Inherits="Sstorage.admin.absorptionProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>קליטת מוצר מספק | Sstorage</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder0" runat="server">
    <asp:Literal ID="LtlUserDitels" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <br />
        <center>
            <h1>קליטת סחורה מספק</h1>
            <table style="width:1005px;" border="1" >
                <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        שם ספק
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">
                        <asp:DropDownList ID="DdlSupplierId" Width="500" runat="server" ></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        שם מחסן מקבל
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">
                        <asp:DropDownList ID="DdlStorageId" Width="500" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        מק"ט
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">
                        <asp:DropDownList ID="DdlProdId" Width="500" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        כמות ביחידות
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">
                        <asp:TextBox ID="TxtQytUnits" Width="100" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        כמות במארזים/פקים
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">
                        <asp:TextBox ID="TxtQytPacets" Width="100" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        כמות בקרטונים
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">
                        <asp:TextBox ID="TxtQytBaxs" Width="100" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        כמות משטחים
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">
                        <asp:TextBox ID="TxtQytSurfaces" Width="100" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        תעודת משלוח
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">
                        <asp:FileUpload ID="FuShippingCertificate" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        כמות תקינה
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">                      
                        <asp:RadioButton ID="RbNormalQuantity" GroupName="NormalQuantity" Text="כן" runat="server" />
                        <asp:RadioButton ID="RbNotNormalQuantity" GroupName="NormalQuantity" Text="לא" runat="server" />                       
                    </td>
                </tr>
                <tr>
                    <td style="width:50%;height:50px;font-size:30px;color:#0094ff;text-align:center;">
                        הערות
                    </td>
                    <td style="width:50%;height:50px;font-size:30px;color:#da56fb;text-align:center;">
                      <asp:TextBox ID="TxtRemarks" TextMode="MultiLine" Columns="25" Rows="2" runat="server" />
                    </td>
                </tr>               
            </table>            
            <br />
            <asp:Literal ID="LtlOK" runat="server" />
            <br />
            <asp:Button ID="BtnSubmit" Text="אישור" runat="server" OnClick="BtnSubmit_Click" />
            <br /><br />
        </center>
    </div>


</asp:Content>
