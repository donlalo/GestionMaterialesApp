<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebArduino.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ingresar</title>
    <meta charset="utf-8" />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!--webfonts-->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,300,600,700' rel='stylesheet' type='text/css' />
</head>
<body>
    
        <div class="login-form">
			<div class="head">
				<img src="images/mem2.jpg" alt=""/>		
			</div>
				<form id="form1" runat="server">
					<li>
						<asp:TextBox ID="usuario" runat="server" class="text" value="USUARIO" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'USUARIO';}" /><a href="#" class=" icon user" ></a>
					</li>
					<li>
						<asp:TextBox ID="password" TextMode="Password" runat="server" value="CONTRASEÑA" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'CONTRASEÑA';}" /><a href="#" class=" icon lock" ></a>
					</li>
					<div class="p-container">
								<asp:Button class="ingresar" runat="server" Text="Ingresar" OnClick="Unnamed1_Click" />
							<div class="clear"> </div>
					</div>
				</form>
			</div>
    
</body>
</html>

