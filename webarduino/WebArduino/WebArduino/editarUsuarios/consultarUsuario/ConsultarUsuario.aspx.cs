using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using MySql.Data;
using System.Data;

namespace WebArduino.editarUsuarios.consultarUsuario
{
    public partial class ConsultarUsuario1 : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            txtRut.Enabled = false;
            lblusuario.Text = Session["usuario"].ToString();
            btnVerUsuario.Enabled = false;
        }
        private bool esNumero(string valor)
        {
            try
            {
                int x = int.Parse(valor);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        private void prepararQuery()
        {
            string query = "";
            if (ddlTipoBusqueda.SelectedItem.Text.ToString() == "Nickname")
            {
                if (esNumero(txtBuscar.Text) == false)
                {
                    query = "select persona.rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,telefono,date_format(fecha_nac,'%d'),date_format(fecha_nac,'%m'),date_format(fecha_nac,'%Y') from persona join usuario on persona.rut=usuario.rut where nickname = '" + txtBuscar.Text + "'";
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('valor no puede ser numerico')</script>");
                }
            }
            else
            {
                if (ddlTipoBusqueda.SelectedItem.Text.ToString() == "Rut")
                {
                    if (esNumero(txtBuscar.Text) == true)
                    {
                        query = "select persona.rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,telefono,date_format(fecha_nac,'%d'),date_format(fecha_nac,'%m'),date_format(fecha_nac,'%Y') from persona where persona.rut = " + int.Parse(txtBuscar.Text);
                    }
                    else
                    {
                        Response.Write("<script type='text/javascript'>alert('busqueda debe ser numerica')</script>");
                    }
                }
            }
             
            buscarUsuario(query);
        }

        private void buscarUsuario(string q)
        {
            Conectar cnn = new Conectar();
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataReader dr = null;
            try
            {
                Session.Remove("usuarioBuscado");
                cnn.iniciarConexion();
                cmd.Connection = cnn.Conexion();
                cmd.CommandText = q;
                dr = cmd.ExecuteReader();// 9 datos devuelve
                if(!dr.HasRows)
                {
                    Response.Write("<script type='text/javascript'>alert('No se han encontrado datos!!')</script>");
                    nuevo();
                }
                else
                {
                    
                    while (dr.Read())
                    {
                        txtRut.Text = dr[0].ToString();
                        txtP_nom.Text = dr[1].ToString();
                        txtS_nom.Text = dr[2].ToString();
                        txtP_ape.Text = dr[3].ToString();
                        txtS_ape.Text = dr[4].ToString();
                        txtFono.Text = dr[5].ToString();
                        cbxDia.SelectedItem.Text = dr[6].ToString();
                        cbxMes.SelectedItem.Text = dr[7].ToString();
                        cbxAño.SelectedItem.Text = dr[8].ToString();
                    }
                    Session["usuarioBuscado"] = txtRut.Text;
                    btnVerUsuario.Enabled = true;
                }

            }
            catch (Exception ex)
            {
                
                Response.Write("<script type='text/javascript'>alert('Error al buscar : '"+ex.Message+")</script>");
            }
            cnn.terminarConexion();
        }
        
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (ddlTipoBusqueda.SelectedIndex == -1 || txtBuscar.Text == "")
            {
                Response.Write("<script type='text/javascript'>alert('Verifique su perfil de busqueda.')</script>");
            }
            else
            {
                prepararQuery();
            }
            
            
        }

        private void nuevo()
        {
            txtP_nom.Text = "";
            txtS_nom.Text = "";
            txtP_ape.Text = "";
            txtS_ape.Text = "";
            txtFono.Text = "";
            txtRut.Text = "";
            txtRut.Enabled = true;
            
        }
        private void guardarCambios()
        {
            Conectar cnn = new Conectar();
            MySqlCommand cmd = new MySqlCommand();
            string nac = cbxAño.SelectedItem.Text.ToString() + "-" + cbxMes.SelectedItem.Text.ToString() + "-" + cbxDia.SelectedItem.Text.ToString();
            try
            {
                cnn.iniciarConexion();
                cmd.Connection = cnn.Conexion();
                cmd.CommandText = "update persona set rut="+int.Parse(txtRut.Text)+",primer_nombre='"+txtP_nom.Text+"',segundo_nombre='"+txtS_nom.Text+"',primer_apellido='"+txtP_ape.Text+"',segundo_apellido='"+txtS_ape.Text+"',telefono="+int.Parse(txtFono.Text)+",fecha_nac='"+nac+"' where rut = "+int.Parse(txtRut.Text);
                int x = cmd.ExecuteNonQuery();
                if (x != 0)
                {
                    Response.Write("<script type='text/javascript'>alert('Registro actualizado.')</script>");
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('no existe registro para eliminar.')</script>");
                    nuevo();
                }
            }
            catch (Exception ex)
            {
                
                Response.Write("<script type='text/javascript'>alert('error al guardar cambios : '"+ex.Message+")</script>");
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (esNumero(txtFono.Text) == true)
            {
                guardarCambios();
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('verificar campo telefono')</script>");
            }
            
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            nuevo();
        }
        private void eliminarUsuario()
        {
            Conectar cnn = new Conectar();
            MySqlCommand cmd = new MySqlCommand();
            try
            {
                cnn.iniciarConexion();
                cmd.Connection = cnn.Conexion();
                cmd.CommandText = "delete from usuario where rut = "+int.Parse(txtRut.Text);
                cmd.CommandText = "delete from persona where rut = "+int.Parse(txtRut.Text);
                int x = cmd.ExecuteNonQuery();
                if (x != 0)
                {
                    Response.Write("<script type='text/javascript'>alert('usuario eliminado!')</script>");
                }
                
            }
            catch (Exception ex)
            {

                Response.Write("<script type='text/javascript'>alert('error al eliminar usuario : '"+ex.Message+")</script>");
            }
            cnn.terminarConexion();
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            eliminarUsuario();
        }
        private void ingresarUsuario()
        {
            Conectar cnn = new Conectar();
            MySqlCommand cmd = new MySqlCommand();
            string f = cbxAño.SelectedItem.Text.ToString() + "-" + cbxMes.SelectedItem.Text.ToString() + "-" + cbxDia.SelectedItem.Text.ToString();
            try
            {
                cnn.iniciarConexion();
                cmd.Connection = cnn.Conexion();
                cmd.CommandText = "insert into persona (rut,primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,telefono,fecha_nac) values ("+int.Parse(txtRut.Text)+",'"+txtP_nom.Text
                    +"','"+txtS_nom.Text+"','"+txtP_ape.Text+"','"+txtS_ape.Text+"',"+int.Parse(txtFono.Text)+",'"+f+"')";
                int x = cmd.ExecuteNonQuery();
                if (x != 0)
                {
                    Response.Write("<script type='text/javascript'>alert('usuario ingresado.')</script>");
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('usuario no ingresado')</script>");
                }

            }
            catch (Exception exc)
            {
                
                 Response.Write("<script type='text/javascript'>alert('error al ingresar usuario : '"+exc.Message+")</script>");
            }
            cnn.terminarConexion();
        }
        private string verificarCampos()
        {
            string mensaje = "";
            if (esNumero(txtRut.Text) == false)
            {
                mensaje = mensaje + "rut \n\r";
            }
            if (esNumero(txtP_nom.Text) == true)
            {
                mensaje = mensaje + "primer nombre \n\r";
            }
            if (esNumero(txtS_nom.Text) == true)
            {
                mensaje = mensaje + "segundo nombre \n\r";
            }
            if (esNumero(txtP_ape.Text) == true)
            {
                mensaje = mensaje + "primer apellido \n\r";
            }
            if (esNumero(txtS_ape.Text) == true)
            {
                mensaje = mensaje + "segundo apellido \n\r";
            }
            if (esNumero(txtFono.Text) == false)
            {
                mensaje = mensaje + "telefono \n\r";
            }
            return mensaje;

        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            if (verificarCampos() == "")
            {
                ingresarUsuario();
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('Verificar campos.')</script>");
            }
            
        }

        protected void btnVerUsuario_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.open('/editarUsuarios/crearUsuario/WebFormCrearUsuario.aspx','popup','width=500,height=300') </script>");
        }
    }
}