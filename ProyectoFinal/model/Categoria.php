<?php 

class Categoria
{
    private $id;
    private $nombre;
    private $descripcion;
    private $fecCreacion;
    private $fecActualizacion;

    public function __construct()
    {

    }

    public function __get($id)
    {
        return $this->id;
    }
}

?>