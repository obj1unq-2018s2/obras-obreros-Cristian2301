import obreros.*

class Obra {
	var property ladrillos = 0
	var property metrosDeCanio = 0
	var property metrosDeCable = 0
	var property cinta = 0
	var property fosforos = 0
	var property arandelas = 0
	var property efectivo = 0
	var property metrosCuadradosConstruidos = 0
	var property implementosDeAguaColocados = 0
	var property implementosDeGasColocados = 0
	var property cablesElectricosColocados = 0
	const plantilla = #{}
	
	method habitaciones()
		
	method pisos()
	
	method banios() 
	
	method jornadaLaboral(){
		if(self.obrerosDisponibles().size() > 0){
			self.obrerosDisponibles().forEach {obrero => obrero.consumir(self)}
			self.obrerosDisponibles().forEach {obrero => obrero.avanzarEn(self)}
			self.obrerosDisponibles().forEach {obrero => obrero.jornalesQueSeLeAdeudan(obrero.jornalesQueSeLeAdeudan() + 1)}
		}
		else{
			self.error("no hay obreros disponibles para trabajar")
		}
	}
	
	method agregarObrero(obrero){
		plantilla.add(obrero)
		obrero.obras().add(self)
	}
	
	method quitarObrero(obrero){
		if(not obrero.enLicencia())
			plantilla.remove(obrero)
		else
			self.error("Las leyes laborales estan para respetarse - licencia implica estabilidad laboral")
	}
	
	method obrerosDisponibles(){
		return plantilla.filter({obrero => not obrero.enLicencia()})
	}
	
	method recibirLadrillos(cantidad){
		ladrillos += cantidad
	}
	
	method recibirMetrosDeCanio(metros){
		metrosDeCanio += metros
	}
	
	method recibirMetrosDeCable(metros){
		metrosDeCable += metros
	}
	
	method recibirRollosDeCinta(rollos){
		cinta += rollos
	}
	
	method recibirFosforos(cantidad){
		fosforos += cantidad
	}
	
	method recibirArandelas(cantidad){
		arandelas += cantidad
	}
	
	method estaEnPlantilla(obrero){
		return plantilla.contains(obrero)
	}
	
	method finalizada(){
		return self.cumpleConMetrosCuadrados() and self.cumpleConImplementosDeAgua() and self.cumpleConImplementosDeGas() and 
		self.cumpleConCablesElectricos()
	}
	
	method cumpleConMetrosCuadrados(){
		return metrosCuadradosConstruidos >= 50 * self.habitaciones()
	}
	
	method cumpleConImplementosDeAgua(){
		return implementosDeAguaColocados >= 10 * self.banios()
	}
	
	method cumpleConImplementosDeGas(){
		return implementosDeGasColocados >= 8 * self.banios() + 3 * self.habitaciones()
	}
	
	method cumpleConCablesElectricos(){
		return cablesElectricosColocados >= 50 * self.habitaciones() + 100 * self.pisos()
	}
	
	method importeTotalAdeudado(){
		return plantilla.sum {obrero => obrero.cantACobrar()}
	}
	
	method pagoDeJornalesAdeudados(){
		efectivo -= self.importeTotalAdeudado()
		plantilla.forEach {obrero => obrero.jornalesQueSeLeAdeudan(0)}
	}
	
	method agregar(importe){
		efectivo += importe
	}
}


class Casa inherits Obra {
	var property habitaciones = 3
	var property banios = 1
	
	override method habitaciones() = habitaciones
	override method banios() = banios
	
	override method pisos() = 1
}

class Edificio inherits Obra {
	var property pisos = 4
	const property departamentosPorPiso = 2
	const property habitacionesPorDepto = 2
	const property ascensores = 2 
	
	override method pisos() = pisos
	
	override method	habitaciones() = habitacionesPorDepto
	
	override method banios() = 1
	
	override method cumpleConCablesElectricos(){
		return cablesElectricosColocados >= 50 * self.habitaciones() + 100 * self.pisos() + 300 * ascensores
	}
}

