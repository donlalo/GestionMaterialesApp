using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebArduino
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private Conectar conn = new Conectar();
        private string u = "";
        private string p = "";
        private int c = 0;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private Boolean validarPass()
        {
            try
            {
                c = int.Parse(p);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            
            try
            {
                u = usuario.Text;
                p = password.Text;

                if (u == "" || p == "")
                {
                    Response.Write("<script type='text/javascript'>alert('DEBE COMPLETAR LOS CAMPOS REQUERIDOS')</script>");
                }
                else
                {
                    if (validarPass() == false)
                    {
                        Response.Write("<script type='text/javascript'>alert('VERIFIQUE SUS DATOS.')</script>");
                    }
                    else
                    {
                        conn.iniciarConexion();
                        if (conn.validarUsuario(u, c) == true)
                        {
                            
                            if (conn.tipoUsuario() == "administrador")
                            {
                                Response.Redirect("/menuAdministrador/index.html", false);
                            }
                            else
                            {
                                Response.Redirect("menu/index.html", false);
                            }
                            Session["usuario"] = u;
                            Session["tipoSesion"] = conn.tipoUsuario();
                        }
                        else
                        {
                            Response.Write("<script type='text/javascript'>alert('VERIFIQUE SUS DATOS.')</script>");
                        }
                    }
                    
                }
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("error : "+ex.Message);
                
            }
            conn.terminarConexion();
            u = "";
            p = "";
        }
    }
}