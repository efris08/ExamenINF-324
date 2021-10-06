<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notas_est.aspx.cs" Inherits="Ejercicio4.notas_est" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="form-element">
        <asp:Label ID="Label1" runat="server" Text="Estudiante: "></asp:Label>
        <br />
        <asp:GridView ID="gvNotas" runat="server">
        </asp:GridView>
   
         
        <br />
   
        <asp:Button ID="btnCerrar" runat="server" OnClick="btnCerrar_Click" Text="Cerrar Sesión" Width="232px" /> 
    </div>
        
    </form>
    
</body>
</html>
