//
//  AltContentView.swift
//  GuessTheFlag
//
//  Created by Carlos Román Alcaide on 16/3/24.
//

import SwiftUI

// Cuando añadimos assets (imágenes) a la carpeta assets del proyecto, podemos gestionar resolución doble o triple añadiendo @2x o @3x al nombre del archivo

struct AltContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    //Para poder tener banderas diferentes cada vez que se recargue la vista, vamos a usar el método ".shuffled()", que ayuda a reordenar al azar los elementos de un array
    @State private var correctAnswer = Int.random(in: 0...2)
    //El array de países va a servir para llamar a las banderas y mostrarlas en la vista. correctAnswer, obviamente, servirá para elegir una respuesta correcta al azar.
    
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var rounds = 1
    @State private var shouldReset = false
    
//    var shouldWeReset: String {
//        if rounds == 8 {
//            shouldReset = true
//        }
//        
//        return "Alright"
//    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        //la font "subheadline" y "largeTitle" son de tipo dinámico, así que pueden cambiar de tamaño dependiendo de la configuración del teléfono
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        // Creamos una manera de mostrar llamar al país del que queremos obtener la respuesta correcta
                    }
                    
                    ForEach(0..<3) { number in
                        //Con esto vamos a añadir 3 botones, uno por cada number. Y empezamos a alinearlo de cara al futuro con los 3 primeros elementos del array "countries"
                        //Para poder comprobar que hemos elegido la opción correcta, vamos a crear un método (una función) a la que llamaremos cada vez que el usuario pulse el botón.
                        //Para eso, el método tiene que aceptar como parámetro el valor del "number" de este loop forEach y comprobar si este se corresponde con la respuesta correcta
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Round: \(rounds)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
        .alert("Restart the game?", isPresented: $shouldReset) {
            Button("Restart!", action: resetGame)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, that's the flag of \(countries[number])"
            score -= 1
        }
        
        showingScore = true
    }
    //Este es el método que nos ayuda a determinar si una respuesta (al hacer tap en cualquiera de las banderas botón) es correcta o no
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        rounds += 1
        if rounds == 8 {
            shouldReset = true
        }
    }
    //Esta es una función que recarga el juego al randomizar de nuevo el array "countries" y volver a pedirle a "correctAnswer" que su valor sea el de un número al azar entre 0 y 2. Como está modificando esas dos variables, está reescribiendo su valor, es necesario hacerlas @State private var también
    
    func resetGame() {
        score = 0
        rounds = 1
    }
    
}

#Preview {
    AltContentView()
}
