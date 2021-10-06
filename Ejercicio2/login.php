<?php
include "parts/cabecera.inc.php";
include "parts/conexion.inc.php";

     session_start();
      
  if(isset($_GET['close'])){
        session_unset(); 
        // cierra la sesion
        session_destroy(); 
    }
   
   if(isset($_SESSION['id_rol'])){//Para redireccionar a la página correspondiente según el rol(si es que se inicio sesion)
        echo($_SESSION['id_rol']);
        switch($_SESSION['id_rol']){
            case 1:
                header('location: notas_est.php');
            break;

            case 2:
            header('location: notas_doc.php');
            break;

            default:

        }
    }


if(isset($_POST['usuario']) && isset($_POST['password'])){
        $usuario=$_POST['usuario'];
     	$password=$_POST['password'];
    	$_SESSION['usuario']=$usuario;
        $consulta="SELECT*FROM usuarios where usuario='$usuario' and password='$password'";
        $resultado=mysqli_query($conexion,$consulta);
        $filas=mysqli_fetch_array($resultado);

        if($filas == true){
            $rol = $filas[4];
            
            $_SESSION['id_rol'] = $rol;
            switch($rol){
                case 1:
                    header('location:notas_est.php');
                break;

                case 2:
                header('location:notas_doc.php');
                break;

                default:
            }
        }else{
            // no existe el usuario
            echo '<script>alert("¡ Datos incorrectos !")</script>';
              //  header('location: login.php');
        }
        
mysqli_free_result($resultado);
mysqli_close($conexion);
    }



?>
<form method="post" action="#" name="signin-form">
    <div class="form-element">
        
        <input type="text" placeholder="Usuario" name="usuario" pattern="[a-zA-Z0-9]+" required />
    </div>
    <div class="form-element">
       
        <input type="password" name="password" required input placeholder="Ingrese su contraseña" />
    </div>
    <button type="submit" name="login" value="login">INGRESAR</button>
    
</form>
