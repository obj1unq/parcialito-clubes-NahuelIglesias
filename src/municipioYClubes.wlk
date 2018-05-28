import Actividades_Socios_Equipos_Jugadores.*

object municipio {
	var clubes = #{} //conjunto de clubes
	
	method evaluarClubes() {
		
	}
}

//------Clubes------

class Club {
	var puntos = 0
	var actividades = #{} //conjunto de actividades sociales y equipos
	var socios = #{} //conjunto de socios
	
	method puntos() {
		return puntos
	}
	method actividades() {
		return actividades
	}
	method socios() {
		return socios
	}
	
	method evaluarClub() {
	
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
}

class Tradicional inherits Club {
	var property valorMinPase = 0
	
	method configurarValorMinPase(nuevoValor) {
		valorMinPase = nuevoValor
	}
	
	override method jugadorEsEstrella(jugador) {
		return self.relacionEntrePaseJugadorYPaseMinimo(jugador) or self.cantActividadesDondeParticipa(jugador) >= 3
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
}