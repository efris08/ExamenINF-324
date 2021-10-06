<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notas_doc.aspx.cs" Inherits="Ejercicio4.notas_doc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" >
     <asp:Label ID="Label1" runat="server" Text="Promedio de notas por departamentos en Bolivia"></asp:Label>

         <br />
        <br />

         <asp:GridView ID="gvNotas" runat="server">
             <HeaderStyle BackColor="#666699" BorderColor="#009933" BorderStyle="Double" ForeColor="White" />
                </asp:GridView>
        <br />
        <asp:Button ID="btnCerrar" runat="server" OnClick="btnCerrar_Click" Text="Cerrar Sesión" Width="233px" />
    </div>
       
    </form>
</body>
</html>
