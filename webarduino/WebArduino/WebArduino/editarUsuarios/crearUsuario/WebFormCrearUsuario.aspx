<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormCrearUsuario.aspx.cs" Inherits="WebArduino.editarUsuarios.crearUsuario.WebFormCrearUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td></td>
                <td></td>
                <td><asp:Label ID="lblsesion_" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>Nickname : </td>
                <td></td>
                <td><asp:TextBox runat="server" ID="txtNick"></asp:TextBox></td>
                <td><asp:Button runat="server" ID="btnIngresar" Text="ingresar" OnClick="btnIngresar_Click"/></td>
            </tr>
            <tr>
                <td>Contraseña : </td>
                <td></td>
                <td><asp:TextBox runat="server" ID="txtCon" TextMode="Password"></asp:TextBox></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td><asp:TextBox runat="server" TextMode="Password" ID="txtConfirmarPass" placeholder="ing. contraseña"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Tipo : </td>
                <td></td>
                <td>
                    <asp:DropDownList runat="server" ID="ddltipo">
                        <asp:ListItem Text="administrador"></asp:ListItem>
                        <asp:ListItem Text="normal"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
