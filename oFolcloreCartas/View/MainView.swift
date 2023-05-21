import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(jogadores[0].cartas) { carta in
                    CardView(carta: carta)
                }
            }
            
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(jogadores[1].cartas) { carta in
                    CardView(carta: carta)
                }
            }
        }
    }
    
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
}

struct CardView: View {
   
    @State private var exibirImagem: Bool = true
    var carta: Carta
    
    var body: some View {
        VStack {
            if exibirImagem {
                Image(uiImage: carta.imagem ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            } else {
                Image("Carta")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
        .onTapGesture {
            exibirImagem.toggle()
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
