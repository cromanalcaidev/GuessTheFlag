//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Carlos Román Alcaide on 9/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    //Usamos el método .shuffled() para randomizar el array de países
    @State private var correctAnswer = Int.random(in: 0...2)
    //Originalmente eran variables sin @state private, pero al modificarlas con las dos funciones de más abajo, tenemos que poder mutarlas.
    //Usamos el método Int.random(in: n...n2) para seleccionar el número correcto al azar
    
    @State private var showingScore = false
    // esta variable nos servirá para hacer render condicional de la alerta cuando queramos.
    @State private var scoreTitle = ""
    
    //El método que vamos a crear va a aceptar como argumento el número de la bandera que pulsemos, compararlo con la variable "correctAnswer" y hacer que las dos últimas variables sean relevantes a la hora de mostrar una alerta.
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tag the flag of")
                        .foregroundStyle(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { number in
                    // Con esto, añadimos 3 botones, cada uno una bandera
                    Button {
                        flagTapped(number)
                        //Llamamos 3 veces a la función, una por cada botón. Usamos como argumento el number del forEach y lo comparamos
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) {
        //Este método acepta un valor "number" como argumento. Este argumento, cuando llamemos a la función en los botones de más arriba, se corresponderá con cada uno de los 3 "number" del bucle ForEach
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "False"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        // ya estamos randomizando el array, pero con esto lo volvemos a llamar, randomizando los elementos de nuevo
        correctAnswer = Int.random(in: 0...2)
        // volvemos a decir al programa que randomice la respuesta correcta on demand
        
        //Este código va a darnos error a menos que hagamos countries y correct answer @State Private var
    }
}

#Preview {
    ContentView()
}
