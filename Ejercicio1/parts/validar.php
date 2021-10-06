<?php
include "conexion.inc.php";
     $usuario=$_POST['usuario'];
     $password=$_POST['password'];
     session_start();
     $_SESSION['usuario']=$usuario;
  
  if(isset($_GET['cerrar_sesion'])){
        session_unset(); 
echo ("hola");
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
      echo ("isset 2");
   
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
            echo "Nombre de usuario o contraseña incorrecto";
           // echo '<script>alert("Welcome to Geeks for Geeks")</script>';
              //  header('location: login.php');
        }
        

    }


mysqli_free_result($resultado);
mysqli_close($conexion);
