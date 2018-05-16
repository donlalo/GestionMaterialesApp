<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultarUsuario.aspx.cs" Inherits="WebArduino.editarUsuarios.consultarUsuario.ConsultarUsuario1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <title>Editar Usuarios.</title>
    <link rel="stylesheet" type="text/css" href="/editarUsuarios/css/style.css" />
    
</head>
<body>
    <div class="header">
        Sesion iniciada por : <asp:Label runat="server" ID="lblusuario"></asp:Label>
    </div>
    <h1>Edicion de usuarios.
            <span>Exclusivamente para uso administrativo.</span></h1>
        <br />
        
    <form id="form1" runat="server">
    <div  class="contenedor_edit">
        <table>
        
        <tr>
            <td><asp:Label runat="server" Text="Buscar : " BackColor="White" BorderColor="White" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="Large"></asp:Label></td>
            <td><asp:TextBox runat="server" ID="txtBuscar" CssClass="textbox" Width="196px" placeholder="ingresar busqueda"></asp:TextBox></td>
            <td>filtrar por : </td>
            <td><asp:DropDownList runat="server" ID="ddlTipoBusqueda" CssClass="textbox">
                <asp:ListItem Value="0">Nickname</asp:ListItem>
                <asp:ListItem Value="1">Rut</asp:ListItem>
                </asp:DropDownList></td>
            <td><asp:Button runat="server" ID="btnBuscar" Text="Buscar" OnClick="btnBuscar_Click" BackColor="#CCFF33" BorderColor="Black" BorderStyle="Solid" ForeColor="Black" Height="31px" style="margin-left: 11px" Width="165px"/></td>
        </tr>
          </table>
        <br />
        
        <table>
            <tr>
                <td><asp:Label runat="server" Text="Datos usuario." BackColor="White" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="Large"></asp:Label> </td>
            </tr>
        <tr>
            <td>Rut : </td>
            <td><asp:TextBox runat="server" ID="txtRut" placeholder="rut sin digito verificador" CssClass="textbox" Width="195px"></asp:TextBox></td>
            <td><asp:Button runat="server" ID="btnVerUsuario" Text="ver usuario" OnClick="btnVerUsuario_Click"/></td>
        </tr>
        <tr>
            <td>Primer nombre : </td>
            <td><asp:TextBox runat="server" ID="txtP_nom"  CssClass="textbox" Width="196px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Segundo nombre : </td>
            <td><asp:TextBox runat="server" ID="txtS_nom"  CssClass="textbox" Width="196px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Primer apellido : </td>
            <td><asp:TextBox runat="server" ID="txtP_ape"  CssClass="textbox" Width="196px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Segundo apellido : </td>
            <td><asp:TextBox runat="server" ID="txtS_ape"  CssClass="textbox" Width="196px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Telefono : </td>
            <td><asp:TextBox runat="server" ID="txtFono"  CssClass="textbox" Width="196px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Fecha de nacimiento : </td>
            <td><asp:DropDownList class="textbox" id="cbxDia" runat="server" placeholder="Dia">
                        <asp:ListItem Text="01" value="0"></asp:ListItem>
                        <asp:ListItem Text="02" value="1"></asp:ListItem>
                        <asp:ListItem Text="03" value="2"></asp:ListItem>
                        <asp:ListItem Text="04" value="3"></asp:ListItem>
                        <asp:ListItem Text="05" value="4"></asp:ListItem>
                        <asp:ListItem Text="06" value="5"></asp:ListItem>
                        <asp:ListItem Text="07" value="6"></asp:ListItem>
                        <asp:ListItem Text="08" value="7"></asp:ListItem>
                        <asp:ListItem Text="09" value="8"></asp:ListItem>
                        <asp:ListItem Text="10" value="9"></asp:ListItem>
                        <asp:ListItem Text="11" value="10"></asp:ListItem>
                        <asp:ListItem Text="12" value="11"></asp:ListItem>
                        <asp:ListItem Text="13" value="12"></asp:ListItem>
                        <asp:ListItem Text="14" value="13"></asp:ListItem>
                        <asp:ListItem Text="15" value="14"></asp:ListItem>
                        <asp:ListItem Text="16" value="15"></asp:ListItem>
                        <asp:ListItem Text="17" value="16"></asp:ListItem>
                        <asp:ListItem Text="18" value="17"></asp:ListItem>
                        <asp:ListItem Text="19" value="18"></asp:ListItem>
                        <asp:ListItem Text="20" value="19"></asp:ListItem>
                        <asp:ListItem Text="21" value="20"></asp:ListItem>
                        <asp:ListItem Text="22" value="21"></asp:ListItem>
                        <asp:ListItem Text="23" value="22"></asp:ListItem>
                        <asp:ListItem Text="24" value="23"></asp:ListItem>
                        <asp:ListItem Text="25" value="24"></asp:ListItem>
                        <asp:ListItem Text="26" value="25"></asp:ListItem>
                        <asp:ListItem Text="27" value="26"></asp:ListItem>
                        <asp:ListItem Text="28" value="27"></asp:ListItem>
                        <asp:ListItem Text="29" value="28"></asp:ListItem>
                        <asp:ListItem Text="30" value="29"></asp:ListItem>
                        <asp:ListItem Text="31" value="30"></asp:ListItem>
                    </asp:DropDownList>
                  <!--**************************************************-->
                    <asp:DropDownList class="textbox" id="cbxMes" runat="server" placeholder="Mes">
                        <asp:ListItem Text="01" value="0"></asp:ListItem>
                        <asp:ListItem Text="02" value="1"></asp:ListItem>
                        <asp:ListItem Text="03" value="2"></asp:ListItem>
                        <asp:ListItem Text="04" value="3"></asp:ListItem>
                        <asp:ListItem Text="05" value="4"></asp:ListItem>
                        <asp:ListItem Text="06" value="5"></asp:ListItem>
                        <asp:ListItem Text="07" value="6"></asp:ListItem>
                        <asp:ListItem Text="08" value="7"></asp:ListItem>
                        <asp:ListItem Text="09" value="8"></asp:ListItem>
                        <asp:ListItem Text="10" value="9"></asp:ListItem>
                        <asp:ListItem Text="11" value="10"></asp:ListItem>
                        <asp:ListItem Text="12" value="11"></asp:ListItem>
                    </asp:DropDownList>    
                  <!--***************************************************-->
                        <asp:DropDownList class="textbox" id="cbxAño" runat="server" placeholder="año">
                        <asp:ListItem Text="2015" value="0"></asp:ListItem>
                        <asp:ListItem Text="2014" value="1"></asp:ListItem>
                        <asp:ListItem Text="2013" value="2"></asp:ListItem>
                        <asp:ListItem Text="2012" value="3"></asp:ListItem>
                        <asp:ListItem Text="2011" value="4"></asp:ListItem>
                        <asp:ListItem Text="2010" value="5"></asp:ListItem>
                        <asp:ListItem Text="2009" value="6"></asp:ListItem>
                        <asp:ListItem Text="2008" value="7"></asp:ListItem>
                        <asp:ListItem Text="2007" value="8"></asp:ListItem>
                        <asp:ListItem Text="2006" value="9"></asp:ListItem>
                        <asp:ListItem Text="2005" value="10"></asp:ListItem>
                        <asp:ListItem Text="2004" value="11"></asp:ListItem>
                        <asp:ListItem Text="2003" value="12"></asp:ListItem>
                        <asp:ListItem Text="2002" value="13"></asp:ListItem>
                        <asp:ListItem Text="2001" value="14"></asp:ListItem>
                        <asp:ListItem Text="2000" value="15"></asp:ListItem>
                        <asp:ListItem Text="1999" value="16"></asp:ListItem>
                        <asp:ListItem Text="1998" value="17"></asp:ListItem>
                        <asp:ListItem Text="1997" value="18"></asp:ListItem>
                        <asp:ListItem Text="1996" value="19"></asp:ListItem>
                        <asp:ListItem Text="1995" ></asp:ListItem>
                        <asp:ListItem Text="1994" ></asp:ListItem>
                        <asp:ListItem Text="1993" ></asp:ListItem>
                        <asp:ListItem Text="1992" ></asp:ListItem>
                        <asp:ListItem Text="1991" ></asp:ListItem>
                        <asp:ListItem Text="1990" ></asp:ListItem>
                        <asp:ListItem Text="1989" ></asp:ListItem>
                        <asp:ListItem Text="1988" ></asp:ListItem>
                        <asp:ListItem Text="1987" ></asp:ListItem>
                        <asp:ListItem Text="1986" ></asp:ListItem>
                        <asp:ListItem Text="1985" ></asp:ListItem>
                        <asp:ListItem Text="1984" ></asp:ListItem>
                        <asp:ListItem Text="1983" ></asp:ListItem>
                        <asp:ListItem Text="1982" ></asp:ListItem>
                        <asp:ListItem Text="1981" ></asp:ListItem>
                        <asp:ListItem Text="1980" ></asp:ListItem>
                        <asp:ListItem Text="1979" ></asp:ListItem>
                        <asp:ListItem Text="1978" ></asp:ListItem>
                        <asp:ListItem Text="1977" ></asp:ListItem>
                        <asp:ListItem Text="1976" ></asp:ListItem>
                        <asp:ListItem Text="1975" ></asp:ListItem>
                        <asp:ListItem Text="1974" ></asp:ListItem>
                        <asp:ListItem Text="1973" ></asp:ListItem>
                        <asp:ListItem Text="1972" ></asp:ListItem>
                        <asp:ListItem Text="1971" ></asp:ListItem>
                        <asp:ListItem Text="1970" ></asp:ListItem>
                        <asp:ListItem Text="1969" ></asp:ListItem>
                        <asp:ListItem Text="1968" ></asp:ListItem>
                        <asp:ListItem Text="1967" ></asp:ListItem>
                        <asp:ListItem Text="1966" ></asp:ListItem>
                        <asp:ListItem Text="1965" ></asp:ListItem>
                        <asp:ListItem Text="1964" ></asp:ListItem>
                        <asp:ListItem Text="1963" ></asp:ListItem>
                        <asp:ListItem Text="1962" ></asp:ListItem>
                        <asp:ListItem Text="1961" ></asp:ListItem>
                        <asp:ListItem Text="1960" ></asp:ListItem>
                        <asp:ListItem Text="1959" ></asp:ListItem>
                        <asp:ListItem Text="1958" ></asp:ListItem>
                        <asp:ListItem Text="1957" ></asp:ListItem>
                        <asp:ListItem Text="1956" ></asp:ListItem>
                        <asp:ListItem Text="1955" ></asp:ListItem>
                        <asp:ListItem Text="1954" ></asp:ListItem>
                        <asp:ListItem Text="1953" ></asp:ListItem>
                        <asp:ListItem Text="1952" ></asp:ListItem>
                        <asp:ListItem Text="1951" ></asp:ListItem>
                        <asp:ListItem Text="1950" ></asp:ListItem>
                        <asp:ListItem Text="1949" ></asp:ListItem>
                        <asp:ListItem Text="1948" ></asp:ListItem>
                        <asp:ListItem Text="1947" ></asp:ListItem>
                        <asp:ListItem Text="1946" ></asp:ListItem>
                        <asp:ListItem Text="1945" ></asp:ListItem>
                        <asp:ListItem Text="1944" ></asp:ListItem>
                        <asp:ListItem Text="1943" ></asp:ListItem>
                        <asp:ListItem Text="1942" ></asp:ListItem>
                        <asp:ListItem Text="1941" ></asp:ListItem>
                    </asp:DropDownList></td>
        </tr>
    </table>
    </div>
        <br />
        <div class="botones">
            <asp:Button runat="server" ID="btnGuardar" Text="Guardar cambios" BackColor="#99CCFF" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="30px" OnClick="btnGuardar_Click"/>
            <asp:Button runat="server" ID="btnEliminar" Text="Eliminar" BackColor="Red" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="30px" OnClick="btnEliminar_Click"/>
            <asp:Button runat="server" ID="btnNuevo" Text="Nuevo" BackColor="#00CC99" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="30px" OnClick="btnNuevo_Click"/>
            <asp:Button runat="server" ID="btnIngresar" Text="Ingresar" BackColor="#99FF66" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Height="30px" OnClick="btnIngresar_Click"/>
        </div>
    </form>
</body>
</html>
