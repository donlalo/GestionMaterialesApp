<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormHumedad.aspx.cs" Inherits="WebArduino.humedad.WebFormHumedad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="/humedad/css/style.css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Control humedad.</title>
    <style type="text/css">
        .auto-style1 {
            width: 141px;
        }
    </style>
</head>
<body>
    <h1>Vista de Humedad</h1>
    <br />

    <form id="form1" runat="server">    
    <div class="contenedor">
        <a href="../menu/index.html">Menu</a> / <a href="WebFormHumedad.aspx">Vista de Humedad</a>
        <br />
        <br />
    <table>
        <tr>
            <td>Puerto </td>
            <td class="auto-style1"><asp:DropDownList runat="server" ID="ddlListaPuertos" Width="139px" OnSelectedIndexChanged="ddlListaPuertos_SelectedIndexChanged" style="height: 22px"></asp:DropDownList></td>
            <td><asp:Button id="btnConectar" runat="server" Text="Conectar" OnClick="btnConectar_Click" style="margin-left: 11px" Width="118px"/></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Tasa de baudios</td>
            <td><asp:DropDownList runat="server" ID="ddlBaudRate" Height="27px" Width="140px" OnSelectedIndexChanged="ddlBaudRate_SelectedIndexChanged"></asp:DropDownList></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>Estado : </td>
            <td><asp:Label runat="server" ID="lblEstado"></asp:Label></td>
            <td></td>
        </tr>
    </table>
        <br />
    </div>
        <div class="info">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td>Humedad : </td>
                            <td><asp:TextBox runat="server" ID="txtHumedad" Font-Size="Large" ForeColor="Blue" BorderStyle="Solid"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Regadio : </td>
                            <td><asp:TextBox runat="server" ID="txtEstadoRegadio" Text="Desactivado" BackColor="#FFFF99" BorderStyle="Solid"></asp:TextBox></td>
                        </tr>
                    
                    </table>
                    <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
            <table>
            <tr>
                <td><asp:Button runat="server" ID="btnMostraRegistros" Text="Visualizar registros" OnClick="btnMostraRegistros_Click" BackColor="#99CCFF" BorderStyle="Solid" BorderColor="Black" Font-Bold="True" Font-Italic="False" ForeColor="Black" Height="29px" /></td>
            </tr>
            <tr>
                <td><asp:Button runat="server" ID="btnEliminarRegistros" Text="Eliminar registros" OnClick="btnEliminarRegistros_Click" BackColor="Red" BorderStyle="Solid" BorderColor="Black" Font-Bold="True" Height="29px"/></td>
            </tr>
            
        </table>
        </div>
        
        <div class="informacion">
        <p>
            <em>¡¡Muy importante!! En caso de conectar con el sensor y este devuelve un valor 0 (cero), debe verificar que el sensor este en la posicion correcta.</em>
        </p>
        </div>
    </form>
</body>
</html>
