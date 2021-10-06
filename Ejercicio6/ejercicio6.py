import pymysql
import os 

class App:

	def __init__(self):
		self.conn = pymysql.connect(
			host='localhost',
			user='root',
			password='1235',
			db='db_callisaya'
			)
		self.cursor = self.conn.cursor()

	def Insertar(self):
		from getpass import getpass
		ci = input("Ingrese su CI: ")
		nombre = input("Ingrese su nombre: ")
		fecha = input("Ingrese su fecha de nacimiento: ")
		dpto = input("Ingrese el código de su departamento: ")
		usuario = input("Ingrese su nombre de usuario: ")
		password = getpass("Ingrese su contraseña: ")
		
		sql = "INSERT INTO persona (ci,nombre,fecha_nac,dpto) VALUES ('{}','{}','{}','{}') ".format(ci,nombre,fecha,dpto)
		sql2 = "INSERT INTO usuarios (ci,usuario,password,id_rol) VALUES ('{}','{}','{}','{}') ".format(ci,usuario,password,1)
		self.cursor.execute(sql)
		self.cursor.execute(sql2)
		print("Correcto\n")
		self.conn.commit()
		

	def Mostrar(self):
		sql="SELECT*FROM persona"
		self.cursor.execute(sql)
		estudiantes = self.cursor.fetchall()
		print ("CI    NOMBRE    FECHA DE NACIMIENTO  DPTO")
		for i in estudiantes:
			print(i[0], ", ",i[1], ", ",i[2], ", ",i[3])
		
		os.system('pause')

			

aplication = App()
aplication.Insertar()
aplication.Mostrar()