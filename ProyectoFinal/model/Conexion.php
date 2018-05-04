<?php

class Conexion
{

    private $mysqli;

    public function __construct()
    {
        $this->mysqli = new mysqli("127.0.0.1", "root", "", "gestion_materiales_db", 3306);
    }

    public function __get($mysqli)
    {
        return $this->mysqli;
    }

    /*
    function getConexion()
    {
        $mysqli = new mysqli("127.0.0.1", "root", "", "gestion_materiales_db", 3306);
        if ($mysqli->connect_errno) {
            echo "Fallo al conectar a MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
        }else{
            //echo "conexion exitosa";
            $mysqli->close();
        }
    }*/
}





?>