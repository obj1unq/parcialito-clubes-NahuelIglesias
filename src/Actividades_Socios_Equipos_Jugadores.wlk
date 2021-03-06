import municipioYClubes.*

//------Actividades------

class Equipo { //tambien actividad deportiva
	var plantel = #{} //conjunto de jugadores, INCLUYE AL CAP
	var capitan = jugadorX
	var sanciones = 0
	var campeonatosObtenidos = 0

	method integrantes() {
		return plantel
	}
	method lider() {
		return capitan
	}
	
	method esSancionada() {
		sanciones += 1
	}
	method sanciones() {
		return sanciones
	}
	
	method evaluarActividad() {
		return (5*campeonatosObtenidos) + (2*plantel) + (if (capitan.esEstrella()){5} else {0}) - (20*sanciones)
	}
	method jugadoresEstrella() {
		return plantel.filter({jugador => jugador.esEstrella()})
	}
	
	method esExperimetado() {
		return plantel.all({jugador => jugador.partidosJugados() >= 10})
	}
	
	method remover(jugador) {
		plantel = plantel.remove(jugador)
	}
	method comprar(jugador) {
		plantel = plantel.add(jugador)
	}
}

class EquipoFutbol inherits Equipo {

	override method evaluarActividad() {
		return super() + (5*self.jugadoresEstrella().size()) - (10*sanciones)
	}
}

class ActividadSocial {
	var socioOrganizador = socioX
	var participantes = #{} //conjunto de socios participantes
	var estaSuspendida = false
	var valorActividad = 50
	
	method integrantes() {
		return participantes
	}
	method lider() {
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
	
	method evaluarActividad() {
		return if (!estaSuspendida) {
			valorActividad
		}
		else {0}
	}
	
	method esEstrellada() {
		return participantes.filter({socio => socio.esEstrella()}).size() >=5
	}
	
	method remover(socio) {
		participantes = participantes.remove(socio)
	}
}

//------Socios------


class Socio { //pertenece a un solo club
	var aniosDeSocio = 0
	var suClub = clubX
	
	method esEstrella() {
		return aniosDeSocio > 20
	}
	
	method esDestacado() {
		return suClub.actividades().any({actividad => actividad.lider() == self})
	}
	
	method seRetira(actividad) {
		actividad.remover(self)
	}
}

class Jugador inherits Socio {
	var valorPase = 0
	var partidosJugados = 0
	
	method valorPase() {
		return valorPase
	}
	method partidosJugados() {
		return partidosJugados
	}
	
	override method esEstrella() {
		return partidosJugados >= 50 or suClub.jugadorEsEstrella(self)
	}
	
	method esTransferidoA(equipoNuevo) { //como llevarlo al otro club??
		if (!self.esDestacado()) {
			suClub.remueveA(self)
			equipoNuevo.comprar(self)
			partidosJugados = 0
		}
	}
}