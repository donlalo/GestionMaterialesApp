<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormVistaTemperatura.aspx.cs" Inherits="WebArduino.temperatura.WebFormVistaTemperatura" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <title>Vista Temperatura</title>
    <link rel="stylesheet" type="text/css" href="/temperatura/css/style.css"/>
        <style type="text/css">
            .auto-style1 {
                height: 23px;
            }
        </style>
</head>
<body>
    <div class="usuario">
    </div>
    <header>
        <h1>Vista de Temperatura.
        <span>medicion constante.</span></h1>
    </header>
    <div class="contenedor"><form runat="server" id="formulario">
        <a href="../menu/index.html">Menu</a> / <a href="WebFormVistaTemperatura.aspx">Vista de Temperatura</a>
        <br />
        <br />
        <table>
            <tr>
                <td>Puertos disponibles : </td>
                <td><asp:DropDownList CssClass="ddl" runat="server" ID="puertosDisponibles"  Width="139px" OnSelectedIndexChanged="puertosDisponibles_SelectedIndexChanged"></asp:DropDownList></td>
                <td><asp:Button  runat="server" ID="conectarSensor" Text="Conectar" OnClick="conectarSensor_Click" Width="132px" CssClass="btnConectar" BorderStyle="Solid"/></td>
                <td><label>Estado : </label></td>
                <td><asp:Label runat="server" ID="lblEstadoSensor" Text="No definido."></asp:Label></td>
            </tr>
            <tr>
                <td>tasa de baudios</td>
                <td><asp:DropDownList CssClass="ddl" runat="server" ID="ddlbaudRate" Width="139px" OnSelectedIndexChanged="ddlbaudRate_SelectedIndexChanged"></asp:DropDownList></td>
                <td>(se recomienda "9600").</td>
                <td></td>
            </tr>
         </table>
        <br />
        <table>
            
            <tr>
                <td><asp:Button runat="server" ID="btnMostrarRegistros" Text="Ver historial" OnClick="btnMostrarRegistros_Click" BackColor="#99CCFF" BorderColor="Black" BorderStyle="Solid" Font-Bold="True"/></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
            
                <td><asp:Button runat="server" ID="btnEliminarRegistros" Text="Eliminar registros." OnClick="btnEliminarRegistros_Click" BackColor="Red" BorderColor="Black" BorderStyle="Solid" ForeColor="White" Font-Bold="True"/></td>
                <td>Se eliminaran todos los registros.</td>
                <td></td>
            </tr>
        </Table>
        <br />
        <div id="info">
            
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    Temperatura (Grados Celcius.)<asp:TextBox ID="txtTemp" runat="server" CssClass="temp" Width="263px"></asp:TextBox>
                    <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="5000" OnTick="Timer1_Tick1"></asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        </form>
    </div>
    <div class="info_a">
        <h2 style="text-decoration: underline; background-color: #FFFFFF">
            Clasificacion termica de las hortalizas.
        </h2><fieldset>
            <h3 style="font-size: large; font-family: 'Comic Sans MS'">Hortalizas de estacion fria.</h3>
        <table>
            
            <tr>
                <td>Temperatura recomnendada : </td>
                <td></td>
                <td>entre 15C y 18C</td>
            </tr>
            <tr>
                <td>Temperatura no recomendada : </td>
                <td></td>
                <td> > 24C no tolerable.</td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td style="background-color: #FFFFFF; font-family: 'Arial Black'">GRUPO A</td>
            </tr>
        </table>
        <p>
            A este grupo pertenecen hortalizas como berro de agua, brócoli, betarraga, col berza, col crespa, colirrábano, espinaca, haba, nabo, pastinaca, rábano, raíz picante, repollito de Bruselas, repollo, ruibarbo, rutabaga y salsifí.
        </p>
            <table>
            <tr>
                <td style="background-color: #FFFFFF; font-family: 'Arial Black'">GRUPO B</td>
            </tr>
            </table>
        <p>
            Las hortalizas de este grupo sólo se diferencian de las del grupo anterior en que son susceptibles a heladas cerca de su madurez. Entre los cultivos que pertenecen a este grupo están: acelga, achicoria, alcachofa, apio, apio papa, arveja, cardo, coliflor, endivia, hinojo, lechuga, papa, perejil, repollo chino y zanahoria.
        </p>
            <table>
            <tr>
                <td style="background-color: #FFFFFF; font-family: 'Arial Black'">GRUPO C</td>
            </tr>
            </table>
        <p>
            Las hortalizas que pertenecen a este grupo están adaptadas a temperaturas entre 13 y 24°C y son tolerantes a heladas. Entre las hortalizas que pertenecen a este grupo están: ajo, cebolla, cebollín, cebollino japonés, chalota y puerro. 
        </p>
             </fieldset>
        <fieldset>
            <table>
                <tr>
                    <td><h3 style="font-size: large; font-family: 'Comic Sans MS'">Hortalizas de estacion Calida.</h3></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td style="background-color: #FFFFFF; font-family: 'Arial Black'">GRUPO D.</td>
                </tr>
            </table>
            <p>
                Este grupo se adapta a temperaturas que van entre los 18 y 27°C y no toleran heladas en ningún momento de su desarrollo. Dentro de este grupo están: calabaza, chayote, espárrago, melón, maíz dulce, pepino, pimiento, poroto granado, poroto lima, poroto verde, tomate y zapallo.
            </p>
            <table>
                <tr>
                    <td style="background-color: #FFFFFF; font-family: 'Arial Black'">GRUPO E.</td>
                </tr>
            </table>
            <p>
                Este grupo sólo se diferencia del anterior en que sus temperaturas óptimas son mayores, por sobre los 21°C. Entre los cultivos que pertenecen a este grupo están: ají, berenjena, camote, okra y sandía.
            </p>
        </fieldset>
    </div>
</body>
</html>
