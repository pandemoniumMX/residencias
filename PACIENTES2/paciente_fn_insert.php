<?php

include'../conexion.php';
//include 'fuctions.php';
//header('Content-type: admin_ctrl_empleados.php; charset=UTF-8');
$response = array();


  $pac_nom = $_POST ['pac_nombre'];
  $pac_apa = $_POST ['pac_apaterno']; 
  $pac_ama = $_POST ['pac_amaterno'];
  $pac_fec = $_POST ['pac_fecha_nacimiento'];
  $pac_tel = $_POST ['pac_telefono'];
  $pac_est = $_POST ['estatus'];
  
//inserccion
  $validacion = "SELECT pac_telefono FROM pacientes WHERE pac_telefono = '$pac_tel';";
    $resul = $conn->query($validacion);   
   
    if (mysqli_num_rows($resul)==0) {     
     

    $sql2 = "INSERT INTO pacientes(pac_apaterno,pac_amaterno,pac_nombre,pac_fecha_nacimiento, pac_telefono, estatus)
    VALUES ('$pac_apa','$pac_ama','$pac_nom','$pac_fec','$pac_tel','$pac_est');";
    $res = $conn->query($sql2);

    if (!$res) {
      $response['status']  = 'error';
$response['message'] = $conn->error;
     }
     else{
       $response['status']  = 'success';
$response['message'] = 'Paciente registrado correctamentee ...';
echo "<script> window.location.href='pacientes.php'</script>;";

     }

   }else{
     $response['status']  = 'error';
$response['message'] = 'Ya existe un paciente con ese numero telefonico, intenta uno diferente';
   }
   echo json_encode($response);


?>
