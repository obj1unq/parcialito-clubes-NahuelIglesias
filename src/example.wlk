object municipio {
	var clubes = #{} //conjunto de clubes
	
	method evaluarClubes() {
		
	}
}

//------Clubes------

class Club {
	var puntos = 0
	var actividades = #{} //conjunto de actividades
	var socios = #{} //conjunto de socios
	
	method evaluarClub() {
	
	}
}

class Tradicional inherits Club {
	
}

class Comunitario inherits Club {
	
}

class Profesional inherits Club {
	
}

//------Equipos y jugadores------

class Equipo {
	var plantel = #{} //conjunto de jugadores, INCLUYE AL CAP
	var capitan = jugadorX
	
}


class Jugador inherits Socio {
	var valorPase = 0
	var partidosJugados = 0
}

//------Actividades sociales y socios------

class Actividad {
	var socioOrganizador = socioX
	var participantes = #{} //conjunto de socios
}

class Socio { //pertenece a un solo club
	var aniosDeSocio = 0
}

