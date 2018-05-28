import Actividades_Socios_Equipos_Jugadores.*

object municipio {
	var clubes = #{} //conjunto de clubes
	
	method evaluarClubes() {
		
	}
}

//------Clubes------

class Club {
	var actividadesSociales = #{} //conjunto actividades sociales
	var equipos = #{} //conjunto equipos (actividades deportivas)
	var socios = #{} //conjunto de socios
	var gastoMensual = 0
	
	method actividades() {
		return equipos + actividadesSociales
	}
	method socios() {
		return socios
	}
	method equipos() {
		return equipos
	}
	method actividadesSociales() {
		return actividadesSociales
	}
	
	
	method jugadorEsEstrella(jugador)
	method relacionEntrePaseJugadorYPaseMinimo(jugador) {
		return jugador.valorPase() > valorMinPase
	}
	method cantActividadesDondeParticipa(jugador) {
		return self.actividades().count({actividad => actividad.integrantes().contains(jugador)}) 
	}
	
	method esSancionado() {
		if (socios.size() >= 500) {
			self.actividades().forEach({actividad => actividad.esSancionada()})
		}
	}
	
	method evaluacionBruta() {
		var evaluacionActividades = self.actividades()
		evaluacionActividades.map({actividad => actividad.evaluarActividad()})
		return evaluacionActividades.sum()
	}
	method evaluarClub() {
		return self.evaluacionBruta() / socios.size()
	}
	
	method sociosDestacados() {
		return socios.filter({socio => socio.esDestacado(self)})
	}
	
	method sociosDestacadosEstrella() {
		return self.sociosDestacados().filter({socio => socio.esEstrella()})
	}
	
	method esPrestigioso() {
		return equipos.any({equipo => equipo.esExperimentado()}) or actividadesSociales.any({actividad => actividad.esEstrellada()})
	}
	
	method remueveA(socioX) {
		socios.remove(socioX)
		equipos.forEach({equipo => equipo.remover(socioX)})
		actividadesSociales.forEach({actividad => actividad.remover(socioX)})
	}
	
	method nuevoSocio(socioX) {
		socios.add(socioX)
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