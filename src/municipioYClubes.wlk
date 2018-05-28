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
		return (jugador.valorPase() > valorMinPase) or (actividades.count({actividad => actividad.integrantes().contains(jugador)}))
	}
}

class Comunitario inherits Club {
	
	override method jugadorEsEstrella(jugador) {
		return actividades.count({actividad => actividad.integrantes().contains(jugador)}) >= 3
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