import obra.*
import uocra.*

class Albanil {
	var property enLicencia = false
	const property obras = #{}
	var property jornalesQueSeLeAdeudan = 0
	
	method consumir(obra){
		obra.ladrillos(obra.ladrillos() - 100)
	}
	
	method avanzarEn(obra){
		obra.metrosCuadradosConstruidos(obra.metrosCuadradosConstruidos() + 3)
	}
	
	method pasoPor(obra){
		return obras.contains(obra)
	}
	
	method cantACobrar(){
		return jornalesQueSeLeAdeudan * uocra.jornalAlbanil()
	}
	
	method entrarEnLicencia(){
		enLicencia = true
	}
	
	method salirDeLicencia(){
		enLicencia = false
	}
	
}


class Gasista {
	var property enLicencia = false
	const property obras = #{}
	var property jornalesQueSeLeAdeudan = 0
	
	method consumir(obra){
		obra.metrosDeCanio(obra.metrosDeCanio() - 3)
		obra.fosforos(obra.fosforos() - 20)
	}
	
	method avanzarEn(obra){
		obra.implementosDeGasColocados(obra.implementosDeGasColocados() + 1)
	}
	
	method pasoPor(obra){
		return obras.contains(obra)
	}

	method cantACobrar(){
		return jornalesQueSeLeAdeudan * uocra.jornalEspecialistaBanioCocina()
	}
	
	method entrarEnLicencia(){
		enLicencia = true
	}
	
	method salirDeLicencia(){
		enLicencia = false
	}

	
}


class Plomero{
	var property enLicencia = false
	const property obras = #{}
	var property jornalesQueSeLeAdeudan = 0
	
	method consumir(obra){
		obra.metrosDeCanio(obra.metrosDeCanio() - 10)
		obra.arandelas(obra.arandelas() - 30)
	}
	
	method avanzarEn(obra){
		obra.implementosDeAguaColocados(obra.implementosDeAguaColocados() + 0.5)
	}
	
	method pasoPor(obra){
		return obras.contains(obra)
	}
	
	method cantACobrar(){
		return jornalesQueSeLeAdeudan * uocra.jornalEspecialistaBanioCocina()
	}
	
	method entrarEnLicencia(){
		enLicencia = true
	}
	
	method salirDeLicencia(){
		enLicencia = false
	}
	
}


class Electricista{
	var property enLicencia = false
	const property obras = #{}
	var property jornalesQueSeLeAdeudan = 0
	
	method consumir(obra){
		obra.metrosDeCable(obra.metrosDeCable() - 4)
		obra.cinta(obra.cinta() - 1)
	}
	
	method avanzarEn(obra){
		obra.cablesElectricosColocados(obra.cablesElectricosColocados() + 4)
	}
	
	method pasoPor(obra){
		return obras.contains(obra)
	}
	
	method cantACobrar(){
		return jornalesQueSeLeAdeudan * uocra.jornalElectricista()
	}
	
	method entrarEnLicencia(){
		enLicencia = true
	}
	
	method salirDeLicencia(){
		enLicencia = false
	}
	
}