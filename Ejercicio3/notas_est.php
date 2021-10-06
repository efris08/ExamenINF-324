<?php
include "parts/cabecera.inc.php";
include "parts/conexion.inc.php";

$inc = include("parts/conexion.inc.php");
session_start();

if(!isset($_SESSION['id_rol'])){
	header('location: login.php');
}else{
	if($_SESSION['id_rol'] != 1){
		header('location: login.php');
	}
}
$usuario=$_SESSION['usuario'];

if ($inc) {

	/*$consulta2 = "SELECT nombre FROM persona P INNER JOIN usuarios U ON P.ci=U.ci WHERE U.usuario='$usuario'";
    $result_name = mysql_fetch_array($resultado);  
    $nombre = $result_name['nombre']; 
    echo $nombre;*/

    $consulta = "SELECT*FROM NOTAS inner join usuarios ON notas.ci=usuarios.ci inner join persona ON notas.ci=persona.ci 
    INNER JOIN materia ON materia.sigla = notas.sigla
    WHERE '$usuario'=usuario";
    $resultado = mysqli_query($conexion,$consulta);
    $est = mysqli_query($conexion,$consulta);



    if ($resultado) {
    	while ($row = $est->fetch_array()) 
    	{
    		$ci = $row['ci'];
    		$nombre = $row['nombre'];
    	}
    	?>
    	<div class="est" align="center">
    		<h3 class="est">Estudiante:   <?php echo $nombre;?><br>
    		C.I.:  <?php echo $ci;?>
    	</h3>
    </div>
    <div>
    	<div class="notas" align="center">

    		<table border=1>
    			<thead>
    			<tr>
    				<td>Sigla</td>
    				<td>Materia</td>
    				<td>Nota 1</td>
    				<td>Nota 2</td>
    				<td>Nota 3</td>
    				<td>Nota_final</td>				
    			</tr>
    			</thead>
    			<?php
    			while ($row = $resultado->fetch_array()) {
    				$sigla = $row['sigla'];
    				$materia = $row['descripcion'];
    				$nota1 = $row['nota1'];
    				$nota2 = $row['nota2'];
    				$nota3 = $row['nota3'];
    				$nota_final = $row['nota_final'];

    				echo"<tr>";
    				echo"<td>$sigla</td>";
    				echo"<td>$materia</td>";
    				echo"<td>$nota1</td>";
    				echo"<td>$nota2</td>";
    				echo"<td>$nota3</td>";
    				echo"<td>$nota_final</td>";				
    				echo"</tr>";
    			}
    			?>

    		</table>
    	</div>
    </div> 
    <?php
}
}

?>
<form method="post" action="login.php?close=1" name="signin-form">
	<button type="submit" name="close" value="close">Cerrar Sesion</button>
</form>

<?php include "parts/pie.inc.php";
?>
