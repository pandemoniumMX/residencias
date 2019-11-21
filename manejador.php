<?php
include'conexion.php';
//if(isset($_POST['submit']))
//{
if ( (isset($_POST['user'])) || (isset($_POST['pass'])) ){
    $var_user = $_POST['user'];
	$var_contra = md5($_POST['pass']);
$consulta = "SELECT id_usuario,id_tipousuario,usu_usuario,usu_nombre,usu_apaterno FROM usuarios WHERE usu_usuario ='$var_user' AND usu_contrasena = '$var_contra'";
$resultado = $conn->query($consulta);
if($resultado->num_rows > 0){
	while($row = $resultado->fetch_assoc()) {
	$var_nombre = $row["usu_nombre"];
	$var_apellidop = $row["usu_apaterno"];
	$log_nom = $var_nombre. " ".$var_apellidop;
	$tipo = $row["id_tipousuario"];
	//Aspirantes
  		$_SESSION['clave'] = $row["id_usuario"];
  	    $_SESSION['usu_nombre']=$var_nombre;
        $_SESSION['id_tipousuario'] = $row["id_tipousuario"];
		echo "<script>window.open('login.html','_self')</script>";
}
//aqui termina el while
	}else{
    echo "<script>alert('Usuario o contraseña invalidos!')</script>";
		echo "<script>window.open('index.php','_self')</script>";
	}
}
//} else{
//}
?>
<head>
     <link rel="stylesheet" media="screen" type="text/css" />
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
     <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
</head>