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
	var equipos = #{} //conjunto de equipos
	
	method evaluarClub() {
	
	}
	
	method jugadorEsEstrella(jugador)
}

class Tradicional inherits Club {
	var valorMinPase = 0
	
	method configurarValorMinPase(nuevoValor) {
		valorMinPase = nuevoValor
	}
	
	override method jugadorEsEstrella(jugador) {
		var cantActividades = actividades
		return jugador.valorPase() > valorMinPase or cantActividades.count({actividad => actividad.contains(jugador)}) >= 3
	}
}

class Comunitario inherits Club {
	
	override method jugadorEsEstrella(jugador) {
		var cantActividades = actividades
		return cantActividades.count({actividad => actividad.contains(jugador)}) >= 3
	}
}

class Profesional inherits Club {
	var valorMinPase = 0
	
	method configurarValorMinPase(nuevoValor) {
		valorMinPase = nuevoValor
	}
	
	override method jugadorEsEstrella(jugador) {
		return jugador.valorPase() > valorMinPase
	}
}

//------Equipos y jugadores------

class Equipo {
	var plantel = #{} //conjunto de jugadores, INCLUYE AL CAP
	var capitan = jugadorX
	
}


class Jugador inherits Socio {
	var valorPase = 0
	var partidosJugados = 0
	var perteneceA = clubX
	
	method valorPase() {
		return valorPase
	}
	
	override method esEstrella() {
		return partidosJugados >= 50 or clubX.jugadorEsEstrella(self)
	}
}

//------Actividades sociales y socios------

class ActividadSocial {
	var socioOrganizador = socioX
	var participantes = #{} //conjunto de socios participantes
}

class Socio { //pertenece a un solo club
	var aniosDeSocio = 0
	
	method esEstrella() {
		return aniosDeSocio > 20
	}
}

