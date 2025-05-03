object nave {
    const pasajeros = #{neo,morfeo,trinity}

    method cantidadDePasajeros(){
        return pasajeros.size()
    }

    method pasajeroConMayorVitalidad() = 
        pasajeros.max({
            pasajero => pasajero.vitalidad()
        })

    method pasajeroConMenorVitalidad() = 
        pasajeros.min({
            pasajero => pasajero.vitalidad()
        })
    
    method estaEquilibradaEnVitalidad(){
          return 
            self.pasajeroConMayorVitalidad().vitalidad() < self.pasajeroConMenorVitalidad() * 2
    }

    method elElegidoEstaEnLaNave(){
        return pasajeros.any({
            pasajero => pasajero.esElElegido()
        })
    }

    method chocar(){
        pasajeros.forEach({
            pasajeros => pasajeros.saltar()
        })
        pasajeros.clear()
    }

    method acelerar(){
        const pasajerosNoElegidos = pasajeros.filter({
            pasajero => !pasajero.esElElegido()
        })
        pasajerosNoElegidos.forEach({
            pasajeroNoElegido => pasajeroNoElegido.saltar()
        })
    }
}

object neo {
    var energia = 100
    
    method esElElegido() = true

    method saltar(){
        energia -= (energia / 2)
    }

    method energia() = energia

    method vitalidad(){
        return energia * 0.10
    }
}

object morfeo {
    var vitalidad = 8
    var estaDescansado = true
    
    method esElElegido() = false

    method vitalidad() = vitalidad

    method saltar(){
        estaDescansado = !estaDescansado
        vitalidad = (vitalidad - 1).max(0) // para que vitalidad no de numeros negativos se usa max(0)
    }
}

object trinity{
    method vitalidad() = 0
    method saltar(){

    }
    method esElElegido() = false
}