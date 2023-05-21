import SwiftUI

struct MainView: View {
    @State private var jogador1: Jogador = Jogador()
    @State private var jogador2: Jogador = Jogador()
    
    @State private var cartaSelecionadaJogador1: Carta?
    @State private var cartaSelecionadaJogador2: Carta?
    
    @StateObject private var jogoViewModel = JogoViewModel()
    
    var body: some View {
        VStack {
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(jogadores[0].cartas) { carta in
                    CartaAcimaView(cartaSelecionada: $cartaSelecionadaJogador1, carta: carta)
                        .position(x: UIScreen.main.bounds.width * 0.10, y: UIScreen.main.bounds.height * 0.15)
                }
            }
            
            HStack {
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("VIDA - \(jogador1.vida)")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    Text("MANA - \(jogador1.mana)")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
            Spacer()
            
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(jogadores[1].cartas) { carta in
                    CartaAbaixoView(cartaSelecionada: $cartaSelecionadaJogador2, carta: carta)
                        .position(x: UIScreen.main.bounds.width * 0.10, y: UIScreen.main.bounds.height * 0.15)
                }
            }
            
            HStack {
                Spacer()
                VStack (alignment: .leading) {
                    Text("VIDA - \(jogador1.vida)")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("MANA- \(jogador2.mana)")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    
                }
            }
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
        
        
        

        
    }
    
    
    let gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



