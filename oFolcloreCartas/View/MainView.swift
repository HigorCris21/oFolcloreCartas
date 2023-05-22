import SwiftUI

struct MainView: View {
    @State private var jogador1: Jogador = Jogador()
    @State private var jogador2: Jogador = Jogador()
    
    @State private var cartaSelecionadaJogador1: Carta?
    @State private var cartaSelecionadaJogador2: Carta?
    
    var body: some View {
        let gridLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        
        VStack {
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(jogador1.cartas) { carta in
                    CartaAcimaView(cartaSelecionada: $cartaSelecionadaJogador1, carta: carta)
                        .position(x: UIScreen.main.bounds.width * 0.10, y: UIScreen.main.bounds.height * 0.15)
                }
            }
            
            HStack {
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("VIDA: \(jogador1.vida)")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("MANA: \(jogador1.mana)")
                        .font(.title)
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
            Spacer()
            
            LazyVGrid(columns: gridLayout, spacing: 10) {
                ForEach(jogador2.cartas) { carta in
                    CartaAbaixoView(cartaSelecionada: $cartaSelecionadaJogador2, carta: carta)
                        .position(x: UIScreen.main.bounds.width * 0.10, y: UIScreen.main.bounds.height * 0.15)
                }
            }
            
            HStack {
                Spacer()
                VStack (alignment: .leading) {
                    Text("VIDA: \(jogador2.vida)")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("MANA: \(jogador2.mana)")
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
        
        .onChange(of: cartaSelecionadaJogador1) { novaCartaSelecionadaJogador1 in
            if let cartaSelecionadaJogador2 = cartaSelecionadaJogador2 {
                let resultado = compararCartas(cartaJogador1: novaCartaSelecionadaJogador1, cartaJogador2: cartaSelecionadaJogador2)
                print(resultado)
                
                // Resetar as variáveis para permitir nova seleção de cartas
                self.cartaSelecionadaJogador1 = nil
                self.cartaSelecionadaJogador2 = nil
            }
        }
        .onChange(of: cartaSelecionadaJogador2) { novaCartaSelecionadaJogador2 in
            if let cartaSelecionadaJogador1 = cartaSelecionadaJogador1 {
                let resultado = compararCartas(cartaJogador1: cartaSelecionadaJogador1, cartaJogador2: novaCartaSelecionadaJogador2)
                print(resultado)
                
                // Resetar as variáveis para permitir nova seleção de cartas
                self.cartaSelecionadaJogador1 = nil
                self.cartaSelecionadaJogador2 = nil
            }
        }
    }
    
    func compararCartas(cartaJogador1: Carta?, cartaJogador2: Carta?) -> String {
        guard let cartaJogador1 = cartaJogador1, let cartaJogador2 = cartaJogador2 else {
            return "Nenhuma carta selecionada"
        }
        
        switch (cartaJogador1.tipo, cartaJogador2.tipo) {
        case ("Ataque", "Ataque"):
            jogador1.gastaMana()
            jogador2.gastaMana()
            return "Gasta Mana dos dois, Empate, reinicia o turno"
        
        case ("Ataque", "Defesa"):
            jogador1.gastaMana()
            return "Jogador1 gasta mana, Jogador2 Defende o ataque, ninguém marca"
        
        case ("Ataque", "Recarga"):
            jogador1.gastaMana()
            jogador1.ganhaPonto()
            return "Gasta mana Jogador1, ganha ponto quem Jogador1"
        
        case ("Defesa", "Ataque"):
            jogador2.gastaMana()
            return "Gasta Mana Jogador2, Defende o Ataque, ninguém marca"
        
        case ("Defesa", "Defesa"):
            return "Ninguém marca"
        
        case ("Defesa", "Recarga"):
            jogador2.recarregaMana()
            return "Recarrega a mana do jogador2"
        
        case ("Recarga", "Ataque"):
            jogador2.gastaMana()
            jogador2.ganhaPonto()
            return "Jogador2 gasta mana e ganha ponto"
        
        case("Recarga", "Defesa"):
            jogador1.recarregaMana()
            return "Recarrega Mana do jogador1"
        
        case("Recarga", "Recarga"):
            jogador1.recarregaMana()
            jogador2.recarregaMana()
            return "Os dois recarregam a Mana"
        
        default:
            return "Erro"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
