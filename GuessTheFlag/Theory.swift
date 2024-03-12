//
//  Theory.swift
//  GuessTheFlag
//
//  Created by Carlos Román Alcaide on 9/3/24.
//

import SwiftUI

struct Theory: View {
    
    //5th batch: alerts
    
    //Es importante tener en cuenta cuándo vamos a mostrar una alerta en SwiftUI. No le decimos a la alerta "aparece YA", sino que creamos la vistas, creamos la alerta y después determinamos en qué condiciones la alerta se mostrará. Esa es la diferencia entre programación imperativa y programación declarativa.
    
    // Esto significa que no asignamos la alerta a una variable. A cambio, creamos un estado que determina si se mostrará la alerta (renderización condicional). En cuanto ese estado sea "true", la alerta se mostrará
    
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show alert") {
            showingAlert = true
        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("Ok") { }
//        }
        //El botón aquí no necesita código pq cualquier botón dentro de una alerta la hace desaparecer automáticamente. Se pueden añadir más botones si queremos.
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this")
            //De esta manera le añadimos un poco más de texto a la alerta
        }
    }
}

#Preview {
    Theory()
}


//4th batch: botones e imágenes
//var body: some View {
    // La estructura básica de un botón es Título + función que se ejecuta al pulsarlo.
//        Button("Delete selection") {
//            print("Now deleting")
//        }
    
    //  Dentro de las llaves podemos poner una función que ejecute código más complejo (comento el código y saco la función del body pq a Swift no le hace gracia).
    
//        func executeDelete() {
//            print("Now deletingaaa...")
//        }
//        Button("Delete selection", action: executeDelete)
    
    //Como este botón elimina cosas, hay un marcador especial que hará que iOS lo estilice de manera correcta de acuerdo a su función.
//        Button("Delete selection", role: .destructive, action: executeDelete)
    //Ahora cambia a color rojo el texto.
    
    
    //Los botones también tienen estilos que nos permiten modificar su apariencia.
//        VStack {
//            Button("Button 1") {}
//                .buttonStyle(.bordered)
//
//            Button("Button 2", role: .destructive) {}
//                .buttonStyle(.bordered)
//
//            Button("Button 3") {}
//                .buttonStyle(.borderedProminent)
//            Apple recomienda no abusar de "Prominent"
//                .tint(.indigo)
//
//            Button("Button 4", role: .destructive) {}
//                .buttonStyle(.borderedProminent)
//        }
    
    //También podemos hacer un botón 100% personalizado:
//        Button {
//            print("Button was tapped")
//        } label: {
//            Text("Tap me!")
//                .padding()
//                .foregroundStyle(.white)
//                .background(.red)
//                .cornerRadius(20)
//        }
    
    // Apple también tiene formas de renderizar imágenes en la App. Son 3 formas principales. La primera:
//        Image("singapore")
    
    // También podemos hacer que la imagen sea decorativa para que Apple no la lea en voz alta con voice over. La segunda:
//        Image(decorative: "singapore")
    
    // Y están los símbolos SF de Apple, que son iconos a lo font awesome (pero gratis, gracias):
//        Image(systemName: "cloud")
//            .background(.yellow)
//            .foregroundStyle(.blue)
//            .font(.largeTitle)
    
    //Una imagen puede servir como botón.
    
//        Button {
//            print("Button was tapped")
//        } label: {
//            Image(systemName: "pencil.circle")
//                .font(.largeTitle)
//        }
    
    //Para tener un botón en el que haya imagen + texto, hay 2 opciones:
    
//        Button("Edit", systemImage: "pencil") {
//            print("Button was tapped")
//        }
    //Aquí lo ponemos dentro del inicializador del botón y prescindimos del closure Label:
    
    //Aunque esto también sirve cuando el botón es custom:
//        Button {
//            print("Button was tapped")
//        } label: {
//            Label("Edit", systemImage: "pencil")
//                .padding()
//                .foregroundStyle(.white)
//                .background(.red)
//        }
    //Este sistema es el preferido por Swift, ya que Label es una vista dedicada a esta función precisamente.
//}



//3rd batch: gradients
//var body: some View {
    //Para crear un gradient de color, hay que aportar 3 datos: un array de colores para mostrar, información de tamaño y dirección, y el tipo de gradiente que queremos usar. Hay 4 tipos: linear (de un punto a otro), radial (del centro irradia a los extremos), angular (tiene una forma cónica), [sin nombre] --> se crea poniendo ".gradient" después de usar un color.
//        LinearGradient(colors: [.white, .black],
//                       startPoint: .top,
//                       endPoint: .bottom)
    
    // También podemos marcar stops para determinar hasta qué punto un color estará y cuándo parará (con por centajes)
//        LinearGradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55)
//        ], startPoint: .top, endPoint: .bottom)
    
    //Como Swift sabe que esto es un gradient de stops, podemos simplificar la escritura:
//        LinearGradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55)
//        ], startPoint: .top, endPoint: .bottom)
//
//        RadialGradient(colors: [.blue, .black],
//                       center: .center,
//                       startRadius: 20, endRadius: 200)
//
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
//
//        Text("Your Content")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundStyle(.white)
//            .background(.cyan.gradient)
    
//}


//2nd batch: Colors
//var body: some View {
    //SwiftUI tiene maneras muy sencillas, pero eficientes, de añadir color al fondo de pantalla.
//    ZStack {
        //Como ZStack se adapta automáticamente al tamaño del contenido, no podemos añadir un modificador .background(.red) en el texto o bien en el ZStack y esperar que pinte de rojo toda la pantalla. Para hacerlo, tiene que haber una vista dedicada exclusivamente a eso:
//            Color.red
        //Esto sí llena la pantalla de rojo, pero con modificadores podemos editarlo
//                .frame(width: 200, height: 200)
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
        //Si usamos Color.primary, lo que hará será pintarnos un color visible en modo noche y viceversa. Si usamos Color.secondary, será lo mismo, pero ligeramente transparente.
        
        //También podemos definir el RGB de un color así:
//            Color(red: 1, green: 0.8, blue: 0)
        //Por defecto, Color no llena la pantalla, siempre deja un pequeño espacio blanco arriba y otro abajo (el resto, lo qeu sí llena el color se llama "Safe Area")
//                .ignoresSafeArea()
        //Este modificador se lo pasa por el forro y permite llenar TODA la pantalla
        
        //El modificador background puede aceptar también materiales, que dan la sensación de profundidad
//        VStack(spacing: 0) {
//            Color.red
//            Color.blue
//        }
//        Text("YourContent")
//            .foregroundStyle(.secondary)
//            .padding(50)
//            .background(.ultraThinMaterial)
        //Este es el material y da la sensación de ser un cristal semitransparente, es decir de 3d
//    }
//    .ignoresSafeArea()
//}


//1nd batch (bis): Stacks (V, H y Z)
//var body: some View {
    //SwiftUI tiene maneras muy sencillas, pero eficientes, de añadir color al fondo de pantalla.
//    ZStack {
        //Como ZStack se adapta automáticamente al tamaño del contenido, no podemos añadir un modificador .background(.red) en el texto o bien en el ZStack y esperar que pinte de rojo toda la pantalla. Para hacerlo, tiene que haber una vista dedicada exclusivamente a eso:
//            Color.red
        //Esto sí llena la pantalla de rojo, pero con modificadores podemos editarlo
//                .frame(width: 200, height: 200)
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
        //Si usamos Color.primary, lo que hará será pintarnos un color visible en modo noche y viceversa. Si usamos Color.secondary, será lo mismo, pero ligeramente transparente.
        
        //También podemos definir el RGB de un color así:
//            Color(red: 1, green: 0.8, blue: 0)
        //Por defecto, Color no llena la pantalla, siempre deja un pequeño espacio blanco arriba y otro abajo (el resto, lo qeu sí llena el color se llama "Safe Area")
//                .ignoresSafeArea()
        //Este modificador se lo pasa por el forro y permite llenar TODA la pantalla
        
        //El modificador background puede aceptar también materiales, que dan la sensación de profundidad
//        VStack(spacing: 0) {
//            Color.red
//            Color.blue
//        }
//        Text("YourContent")
//            .foregroundStyle(.secondary)
//            .padding(50)
//            .background(.ultraThinMaterial)
        //Este es el material y da la sensación de ser un cristal semitransparente, es decir de 3d
//    }
//    .ignoresSafeArea()
//}





//1st batch: Stacks

//var body: some View {
    
    //Cuando retornamos un "some view", Swift espera que retornemos algo que se visibilice en la pantalla. Hay 3 que son particularmente importantes: VStack (vertical), HStack (horizontal) y ZStack (profundidad)
//        VStack(alignment: .leading, spacing: 20) {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            Text("This is another text view")
//        }

    //Si no especificáramos un VStack, Swift por defecto alinearía los items de manera vertical. La diferencia es que al especificar que es un VStack, podemos añadir propiedades/modificadores como alignment, spacing... Esto mismo también aplica a HStack
    
    // Los alignments son .leading (a la izqda), .trailing(a la derecha) para adaptarse a idiomas que van de derecha a izquierda (como el árabe), y .center (obviamente)
    
//        HStack(spacing: 20) {
//            Text("Hello, world!")
//            Text("This is another text view")
//        }
    
    // HStack tiende a organizar los elementos en torno al centro de la pantalla. Por eso deja espacio a ambos lados
//        VStack{
//            Spacer()
//            Spacer()
//
//            Text("First")
//            Text("Second")
//            Text("Third")
//
//            Spacer()
        
        //Al añadir un Spacer, empuja hacia arriba todos los elementos para ocupar todo el espacio posible. Si hay más de 1 spacer, se dividen todo el espacio entre ellos
    
//        ZStack(alignment: .top) {
//            Text("Hello, world")
//            Text("This is another text view")
//        }
// Aquí hay un poco de overlapping pq es lo que hace ZStack. No hay spacers, pero sí hay alignment. La forma en la que funciona ZSTack es que va de abajo arriba: la primera línea de código que escribimos está al fondo, la siguiente por encima y así sucesivamente
    
    //Y ahora Paul nos pide un grid de 3x3. No sé si es esto
    
//        HStack {
//            VStack{
//                Text("First")
//                Text("First")
//                Text("First")
//            }
//
//            VStack {
//                Text("Second")
//                Text("Second")
//                Text("Second")
//            }
//
//            VStack {
//                Text("Third")
//                Text("Third")
//                Text("Third")
//            }
//        }
    
    // O esto
//
//        VStack {
//            VStack {
//                HStack{
//                    Text("First")
//                    Text("Second")
//                    Text("Third")
//                }
//            }
//
//            VStack {
//                HStack{
//                    Text("First")
//                    Text("Second")
//                    Text("Third")
//                }
//            }
//
//            VStack {
//                HStack{
//                    Text("First")
//                    Text("Second")
//                    Text("Third")
//                }
//            }
//        }
    
    //Plot twist los dos funconan como Grid 3x3
//}
