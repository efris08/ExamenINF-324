<?php 
include "parts/cabecera.inc.php";


session_start();

if(!isset($_SESSION['id_rol'])){
	header('location: login.php');
}else{
	if($_SESSION['id_rol'] != 2){
		header('location: login.php');
	}
}

$usuario=$_SESSION['usuario'];
$inc = include("parts/conexion.inc.php");
if ($inc) {
	$dptos = "SELECT D.descripcion, AVG(nota_final) AS nota FROM notas N INNER JOIN persona P ON N.ci= P.ci INNER JOIN departamento D ON D.codigo=P.dpto group by D.descripcion";

	$notas = "SELECT D.descripcion, AVG(nota_final) AS nota FROM notas N INNER JOIN persona P ON N.ci= P.ci INNER JOIN departamento D ON D.codigo=P.dpto group by D.descripcion";

	$resultado1 = mysqli_query($conexion,$dptos);
	$resultado2 = mysqli_query($conexion,$notas);
	if ($resultado1) {
		?>
		<div class="notas_p" align="center">
			<h3><p align="center">Promedio de notas por departamentos en Bolivia.</p></h3>
			<table border="1">
				<thead>	<tr>
					<?php 
					while ($row = $resultado1->fetch_array()) {
						$dpto = $row['descripcion'];
						echo"<td>$dpto</td>";
					}
					?>
				</tr>
			</thead>
			<tr>
				<?php 
				while ($row = $resultado2->fetch_array()) {
					$nota = $row['nota'];
					echo"<td>$nota</td>";
				}
				?>
			</tr>
		</table>

	</div>

	<?php
}

}

?>
<form method="post" action="login.php?close=1" name="signin-form">
	<button type="submit" name="close" value="close">Cerrar Sesion</button>
</form>