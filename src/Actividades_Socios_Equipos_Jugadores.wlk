import municipioYClubes.*

//------Actividades------

class Equipo { //tambien actividad deportiva
	var plantel = #{} //conjunto de jugadores, INCLUYE AL CAP
	var capitan = jugadorX
	var sanciones = 0

	method integrantes() {
		return plantel
	}
	method capitan() {
		return capitan
	}
	
	method esSancionada() {
		sanciones += 1
	}
	method sanciones() {
		return sanciones
	}
}

class ActividadSocial {
	var socioOrganizador = socioX
	var participantes = #{} //conjunto de socios participantes
	var estaSuspendida = false
	
	method integrantes() {
		return participantes
	}
	method organizador() {
		return socioOrganizador
	}
	
	method esSancionada() {
		estaSuspendida = true
	}
	method reanudarActividad() {
		estaSuspendida = false
	}
	method estaSuspendida() {
		return estaSuspendida
	}
}

//------Socios------


class Socio { //pertenece a un solo club
	var aniosDeSocio = 0
	
	method esEstrella() {
		return aniosDeSocio > 20
	}
}

class Jugador inherits Socio {
	var valorPase = 0
	var partidosJugados = 0
	var perteneceA = clubX
	
	method valorPase() {
		return valorPase
	}
	
	override method esEstrella() {
		return partidosJugados >= 50 or perteneceA.jugadorEsEstrella(self)
	}
}