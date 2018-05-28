import Actividades_Socios_Equipos_Jugadores.*

object municipio {
	var clubes = #{} //conjunto de clubes
	
	method evaluarClubes() {
		
	}
}

//------Clubes------

class Club {
	var actividades = #{} //conjunto de actividades sociales y equipos
	var socios = #{} //conjunto de socios
	var gastoMensual = 0
	
	method puntos() {
		return puntos
	}
	method actividades() {
		return actividades
	}
	method socios() {
		return socios
	}
	
	
	method jugadorEsEstrella(jugador)
	method relacionEntrePaseJugadorYPaseMinimo(jugador) {
		return jugador.valorPase() > valorMinPase
	}
	method cantActividadesDondeParticipa(jugador) {
		return actividades.count({actividad => actividad.integrantes().contains(jugador)}) 
	}
	
	method esSancionado() {
		if (socios.size() >= 500) {
			actividades.forEach({actividad => actividad.esSancionada()})
		}
	}
	
	method evaluacionBruta() {
		var evaluacionActividades = actividades
		evaluacionActividades.map({actividad => actividad.evaluarActividad()})
		return evaluacionActividades.sum()
	}
	method evaluarClub() {
		return self.evaluacionBruta() / socios.size()
	}
}

class Tradicional inherits Club {
	var property valorMinPase = 0
	
	method configurarValorMinPase(nuevoValor) {
		valorMinPase = nuevoValor
	}
	
	override method jugadorEsEstrella(jugador) {
		return self.relacionEntrePaseJugadorYPaseMinimo(jugador) or self.cantActividadesDondeParticipa(jugador) >= 3
	}
	
	override method evaluacionBruta() {
		return super() - gastoMensual
	}
}

class Comunitario inherits Club {
	
	override method jugadorEsEstrella(jugador) {
		return self.cantActividadesDondeParticipa(jugador) >= 3
	}
}

class Profesional inherits Club {
	var property valorMinPase = 0
	
	method configurarValorMinPase(nuevoValor) {
		valorMinPase = nuevoValor
	}
	
	override method jugadorEsEstrella(jugador) {
		return self.relacionEntrePaseJugadorYPaseMinimo(jugador)
	}
	
	override method evaluacionBruta() {
		return (super()*2) - (gastoMensual*5)
	}
}