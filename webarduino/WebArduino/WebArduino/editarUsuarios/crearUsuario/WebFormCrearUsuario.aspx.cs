using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Data.Sql;
using System.Drawing;

namespace WebArduino.editarUsuarios.crearUsuario
{
    public partial class WebFormCrearUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblsesion_.Text = Session["usuarioBuscado"].ToString();
            txtCon.BackColor = Color.White;
            txtConfirmarPass.BackColor = Color.White;
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (txtCon.Text == txtConfirmarPass.Text)
            {
                Conectar cnn = new Conectar();
                MySqlCommand cmd = new MySqlCommand();
                try
                {
                    cnn.iniciarConexion();
                    cmd.Connection = cnn.Conexion();
                    cmd.CommandText = "insert into usuario (nickname,pass,rut,tipo) values ('" + txtNick.Text + "'," + int.Parse(txtCon.Text) + "," + int.Parse(lblsesion_.Text) + ",'" + ddltipo.SelectedItem.Text.ToString() + "')";
                    int x = cmd.ExecuteNonQuery();
                    if (x != 0)
                    {
                        Response.Write("<script type='text/javascript'>alert('datos ingresados.')</script>");

                    }
                    else
                    {
                        Response.Write("<script type='text/javascript'>alert('vuelva a intentarlo.')</script>");
                    }
                }
                catch (Exception ex)
                {

                    Response.Write("<script type='text/javascript'>alert('error : '" + ex.Message + ")</script>");
                }
                cnn.terminarConexion();
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('contraseñas son diferentes.')</script>");
                txtCon.BackColor = Color.Red;
                txtConfirmarPass.BackColor = Color.Red;
            }
            
            
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}