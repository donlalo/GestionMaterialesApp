<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormRegistrosHumedad.aspx.cs" Inherits="WebArduino.humedad.registros.WebFormRegistrosHumedad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataSourceID="SqlDataSource1" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="humedad" HeaderText="humedad" SortExpression="humedad" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" />
                <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ejemplo1ConnectionString %>" ProviderName="<%$ ConnectionStrings:ejemplo1ConnectionString.ProviderName %>" SelectCommand="SELECT humedad, fecha, hora FROM sensorhumedad"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
