<?php

require('../model/Conexion.php');

if(isset($_POST['login']))
{
    $user = trim($_POST['user']);
    $pass = trim($_POST['pass']);
    
    try
    {

        $conexion = new Conexion();

        $mysqli = $conexion->mysqli;
        
        $resultado = $mysqli->query("call usuarios_check('". $user. "','". $pass. "')");

        $fila = $resultado->fetch_assoc();

        $resultado->free();
        $mysqli->close();

        if($fila['resultado'] == 1)
        {
            //USUARIO VALIDADO
            ?>
            <script>
                window.location.href = "../view/home.php";
            </script>
            <?php
        }
        else
        {
            //USUARIO NO VALIDADO
            session_start();
            if(!isset($_SESSION['error']))
            {
                $_SESSION['error'] = 'Revisar Datos de Ingreso.';
            }
            ?>
            <script>
                window.location.href = "../index.php";
            </script>
            <?php

        }

        
        
    }
    catch(Exception $ex)
    {
        echo 'error en login : '. $e->getMessage(); 
    }
}



?>