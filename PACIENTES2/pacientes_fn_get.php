<?php
include'../conexion.php';
$response = array();
if(isset($_POST['id'])){
  $id = $_POST['id'];
/*
  $empresa="SELECT g.GAL_FOTO,g.ID_GALERIA, g.GAL_FOTO FROM galeria g, publicacion p where
  WHERE g.ID_GALERIA = p.galeria_ID_GALERIA and p.ID_PUBLICACION=$id";
 $ejecutar = mysqli_query($conn, $empresa);
 while($fila=mysqli_fetch_array($ejecutar)){
 $id_g          = $fila['ID_GALERIA'];
 $foto          = $fila['GAL_FOTO'];

 }
*/

  $consulta = "SELECT * pacientes where id_paciente=$id;";
  $resultado = $conn->query($consulta);
  if($resultado->num_rows > 0){
   while($row = $resultado->fetch_assoc()) {
 $response['data'] = array (
    "idx"        =>  $row["id_paciente"],
    "pac_apaterno"     =>  $row["pac_apaterno"],
    "pac_amaterno" =>  $row["pac_amaterno"],     
    "pac_nombre"    =>  $row["pac_nombre"], 
    "pac_fecha_nacimiento"=>  $row["pac_fecha_nacimiento"],
    "pac_telefono"      =>  $row["pac_telefono"],
    "estatus"=>  $row["estatus"],
    


  );
   }
   }
  $response['codigo'] = 1;
  $response['msj'] = "El id se recibio ".$id;
}
else{
  $response['codigo'] = 0;
  $response['msj'] = "Error no se recibio el id puto";
}
echo json_encode($response);
 ?>