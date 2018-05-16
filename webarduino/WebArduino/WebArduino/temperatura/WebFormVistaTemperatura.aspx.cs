using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO.Ports;
using System.Windows.Forms;
using System.Drawing;
using System.Data;
using MySql.Data.MySqlClient;

/////////////////////////

namespace WebArduino.temperatura
{
    public partial class WebFormVistaTemperatura : System.Web.UI.Page
    {
       
        private SerialPort puertoSerial = new SerialPort();
        /*private String[] listaPuertos;*/
        /*int temp = 0;*/
        DateTime hoy;
       

        public void colorBtnNormal()
        {
            conectarSensor.ForeColor = Color.White;
            conectarSensor.BackColor = Color.Green;
            conectarSensor.BorderColor = Color.Black;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (puertoSerial.IsOpen)
            {
                puertoSerial.Close();
            }
            txtTemp.Text = "No disponible!";
           if(!Page.IsPostBack)
           {
               listarPuertos();
               listarBaudRate();
           }
            ////////////////////
            
            /*if (user.obtenerEstadoUsuario() == false)
            {
                Response.Redirect("/WebForm1.aspx", false);
            }
            else
            {*/
            
                /*Chart1.Legends.Clear();
                Chart1.Series[0].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Range;
            /*}*/
            colorBtnNormal();
        }
        public void listarBaudRate()
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
                ddlbaudRate.Items.Clear();
                ddlbaudRate.Items.Add("300");
                ddlbaudRate.Items.Add("1200");
                ddlbaudRate.Items.Add("2400");
                ddlbaudRate.Items.Add("4800");
                ddlbaudRate.Items.Add("9600");
                ddlbaudRate.Items.Add("14400");
                ddlbaudRate.Items.Add("19200");
                ddlbaudRate.Items.Add("28800");
                ddlbaudRate.Items.Add("38400");
                ddlbaudRate.Items.Add("57600");
                ddlbaudRate.Items.Add("115200");

            }
            catch(Exception ex)
            {
                MessageBox.Show("error : " + ex.Message);
            }
        }
        private void listarPuertos()
        {
            
            try 
            {
                puertosDisponibles.Items.Clear();
                puertosDisponibles.Items.Add("COM1");
                puertosDisponibles.Items.Add("COM2");
                puertosDisponibles.Items.Add("COM3");
                puertosDisponibles.Items.Add("COM4");
                puertosDisponibles.Items.Add("COM5");
                puertosDisponibles.Items.Add("COM6");
                

            }
            catch(Exception ex)
            {
                
                MessageBox.Show("error : "+ex.Message);
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

       
        protected void conectarSensor_Click(object sender, EventArgs e)
        {
            if (conectarSensor.Text == "Conectar")
            {
                //Timer1.Enabled = true;
                Timer1.Enabled = true;
                conectarSensor.Text = "Desconectar";
                conectarSensor.ForeColor = Color.White;
                conectarSensor.BackColor = Color.Red;
                conectarSensor.BorderColor = Color.Black;
                lblEstadoSensor.Text = "Conectado";
                lblEstadoSensor.ForeColor = Color.Green;
                puertosDisponibles.Enabled = false;
                ddlbaudRate.Enabled = false;
                
            }
            else
            {
                Timer1.Enabled = false;
                conectarSensor.Text = "Conectar";
                cerrarPuerto();
                txtTemp.Text = "No disponible!";
                lblEstadoSensor.Text = "Desconectado";
                lblEstadoSensor.ForeColor = Color.Red;
                puertosDisponibles.Enabled = true;
                ddlbaudRate.Enabled = true;
            }
            
        }
        public void insertarTemperatura(string t)
        {
            Conectar cnn = new Conectar();
            MySqlCommand cmd = new MySqlCommand();
            hoy = DateTime.Now;
            string f = hoy.ToString("dd-MM-yyyy");
            string hora = hoy.Hour.ToString()+":"+hoy.Minute.ToString()+":"+hoy.Second.ToString();
            string query = "insert into temperatura (temp,fecha,hora) values ('"+t+"','"+f+"','"+hora+"')";
            try
            {
                cnn.iniciarConexion();
                cmd.Connection = cnn.Conexion();
                cmd.CommandText = query;
                cmd.ExecuteNonQuery();
                

            }
            catch (Exception ex)
            {

                Response.Write("<script type='text/javascript'>alert('error al insertar temperatura : "+ex.Message+"')</script>");
            }
            cnn.terminarConexion();
        }
        
        protected void Timer1_Tick1(object sender, EventArgs e)
        {

            try
            {
                if (puertoSerial.IsOpen || puertoSerial != null)
                {
                    puertoSerial.Close();
                }

                    puertoSerial.PortName = puertosDisponibles.SelectedItem.Text.ToString();
                    puertoSerial.BaudRate = int.Parse(ddlbaudRate.SelectedItem.Text.ToString());
                    puertoSerial.Open();
                    txtTemp.Text = puertoSerial.ReadLine();
                    insertarTemperatura(txtTemp.Text.ToString());
                    puertoSerial.Close();
                    cerrarPuerto();
                
            }
            catch (Exception)
            {

                throw;
            } 
        }

        protected void puertosDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        {
            puertosDisponibles.Text = this.puertosDisponibles.SelectedItem.Text.ToString();
            
        }

        protected void ddlbaudRate_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlbaudRate.Text = this.ddlbaudRate.SelectedItem.Text.ToString();
        }
        

        protected void btnMostrarRegistros_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.open('/temperatura/registros/WebFormRegistrosTemperatura.aspx','popup','width=500,height=500') </script>");
        }

        protected void btnEliminarRegistros_Click(object sender, EventArgs e)
        {
            Conectar cnn = new Conectar();
            MySqlCommand cmd = new MySqlCommand();
            try
            {
                cnn.iniciarConexion();
                cmd.Connection = cnn.Conexion();
                cmd.CommandText = "delete from temperatura";
                cmd.ExecuteNonQuery();

            }
            catch(Exception ex)
            {
                throw(ex);
            }
            cnn.terminarConexion();
        }
	

       



        
    }
}