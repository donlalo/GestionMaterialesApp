using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Data;
using System.IO.Ports;
using System.Drawing;

namespace WebArduino.humedad
{
    public partial class WebFormHumedad : System.Web.UI.Page
    {
        SerialPort puertoSerial = new SerialPort();
        DateTime hoy;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                listarPuertos();
                listarBaudRate();
            }
            if (puertoSerial.IsOpen)
            {
                puertoSerial.Close();
            }
            btn();
        }
        private void btn()
        {
            btnConectar.ForeColor = Color.White;
            btnConectar.BackColor = Color.Green;
        }
        private void listarBaudRate()
        {
            try
            {
                /*300
                1200
                2400
                4800
                9600
                14400
                19200
                28800
                38400
                57600
                115200*/
                ddlBaudRate.Items.Clear();
                ddlBaudRate.Items.Add("300");
                ddlBaudRate.Items.Add("1200");
                ddlBaudRate.Items.Add("2400");
                ddlBaudRate.Items.Add("4800");
                ddlBaudRate.Items.Add("9600");
                ddlBaudRate.Items.Add("14400");
                ddlBaudRate.Items.Add("19200");
                ddlBaudRate.Items.Add("28800");
                ddlBaudRate.Items.Add("38400");
                ddlBaudRate.Items.Add("57600");
                ddlBaudRate.Items.Add("115200");

            }
            catch (Exception ex)
            {
                MessageBox.Show("error : " + ex.Message);
            }
        }
        private void listarPuertos()
        {

            try
            {
                ddlListaPuertos.Items.Clear();
                ddlListaPuertos.Items.Add("COM1");
                ddlListaPuertos.Items.Add("COM2");
                ddlListaPuertos.Items.Add("COM3");
                ddlListaPuertos.Items.Add("COM4");
                ddlListaPuertos.Items.Add("COM5");
                ddlListaPuertos.Items.Add("COM6");


            }
            catch (Exception ex)
            {

                MessageBox.Show("error : " + ex.Message);
            }

        }
        private void cerrarPuerto()
        {
            if (puertoSerial != null || puertoSerial.IsOpen)
            {
                puertoSerial.Close();
                puertoSerial = null;

                listarPuertos();
            }

        }
        private void iniciarRegadio()
        {
            try
            {
                if (puertoSerial.IsOpen || puertoSerial != null)
                {
                    puertoSerial.Close();
                }
                if (int.Parse(txtHumedad.Text) <= 570)
                {
                    puertoSerial.PortName = ddlListaPuertos.SelectedItem.Text.ToString();
                    puertoSerial.BaudRate = int.Parse(ddlBaudRate.SelectedItem.Text.ToString());
                    puertoSerial.Open();
                    // enviar señal a regadio para encender.
                    txtEstadoRegadio.Text = "Activado";
                    txtEstadoRegadio.BackColor = Color.YellowGreen;
                    txtEstadoRegadio.ForeColor = Color.White;
                }
                else
                {
                    txtEstadoRegadio.Text = "Desactivado";
                    txtEstadoRegadio.BackColor = Color.Yellow;
                }
            }
            catch (Exception exc)
            {
                
                throw(exc);
            }
            puertoSerial.Close();
        }
        private void cargarHumedad()
        {
            try
            {
                if (puertoSerial.IsOpen || puertoSerial != null)
                {
                    puertoSerial.Close();
                }
                puertoSerial.PortName = ddlListaPuertos.SelectedItem.Text.ToString();
                puertoSerial.BaudRate = int.Parse(ddlBaudRate.SelectedItem.Text.ToString());
                puertoSerial.Open();
                txtHumedad.Text = puertoSerial.ReadLine().ToString();
            }
            catch (Exception ex)
            {
                
                throw(ex);
            }
            puertoSerial.Close();
        }

        private void insertarHumedad()
        {
            Conectar cnn = new Conectar();
            MySqlCommand cmd = new MySqlCommand();
            hoy = DateTime.Now;
            string f = hoy.ToString("dd-MM-yyyy");
            string hora = hoy.Hour.ToString() + ":" + hoy.Minute.ToString() + ":" + hoy.Second.ToString();
            string query = "insert into sensorHumedad(humedad,fecha,hora) values ('"+txtHumedad.Text.ToString()+"','"+f+"','"+hora+"')";
            try
            {
                cnn.iniciarConexion();
                cmd.Connection = cnn.Conexion();
                cmd.CommandText = query;
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                
                throw;
            }
            cnn.terminarConexion();
        }

        protected void btnConectar_Click(object sender, EventArgs e)
        {
            if (btnConectar.Text == "Conectar")
            {
           
                Timer1.Enabled = true;
                btnConectar.Text = "Desconectar";
                btnConectar.ForeColor = Color.White;
                btnConectar.BackColor = Color.Red;
                btnConectar.BorderColor = Color.Black;
                lblEstado.Text = "Conectado";
                lblEstado.ForeColor = Color.Green;
                ddlListaPuertos.Enabled = false;
                ddlBaudRate.Enabled = false;

            }
            else
            {
                Timer1.Enabled = false;
                btnConectar.Text = "Conectar";
                cerrarPuerto();
                txtHumedad.Text = "No disponible!";
                lblEstado.Text = "Desconectado";
                lblEstado.ForeColor = Color.Red;
                ddlListaPuertos.Enabled = true;
                ddlBaudRate.Enabled = true;
                btn();
                txtEstadoRegadio.BackColor = Color.Yellow;
                txtEstadoRegadio.Text = "Desactivado";
            }
        }

        protected void ddlListaPuertos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlListaPuertos.Text = this.ddlListaPuertos.SelectedItem.Text.ToString();
        }

        protected void ddlBaudRate_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBaudRate.Text = this.ddlBaudRate.SelectedItem.Text.ToString();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            cargarHumedad();
            insertarHumedad();
            iniciarRegadio();
        }

        protected void btnEliminarRegistros_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Se eliminaran todos los registros ¿desea continuar?", "Confirmar Eliminacion", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                
            }
            else
            {
                if(dialogResult == DialogResult.No)
                {

                }
            }
                
            
        }

        protected void btnMostraRegistros_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.open('/humedad/registros/WebFormRegistrosHumedad.aspx','popup','width=500,height=500') </script>");
        }
    }
}