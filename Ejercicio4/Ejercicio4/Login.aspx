<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ejercicio4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Estilos.css" rel="stylesheet" />
    <title>Login</title>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
    <div class="form-element">
        <asp:TextBox ID="txtUsu" placeholder="Usuario" runat="server" Width="410px"></asp:TextBox>
    </div>
    <div class="form-element">
       <asp:TextBox ID="txtPass" type="password" placeholder="Password" runat="server" Width="410px"></asp:TextBox>
          
           </div>
        <div class="form-element">
             <asp:Button ID="btnIngresar" runat="server" Text="INGRESAR" Width="461px" OnClick="btnIngresar_Click1" />
             <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
    </form>
  
</body>
</html>
