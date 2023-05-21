import SwiftUI

struct CartaAbaixoView: View {
    
    @State private var posicaoCarta: CGPoint = CGPoint(x: UIScreen.main.bounds.width * 0.10, y: UIScreen.main.bounds.height * 0.15)
    @Binding var cartaSelecionada: Carta?
    
    var carta: Carta
    
    var body: some View {
        Image(carta.tipo)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .position(posicaoCarta)
            .gesture(
                TapGesture()
                    .onEnded { value in
                        withAnimation {
                            if posicaoCarta != CGPoint(x: UIScreen.main.bounds.width * 0.10, y: UIScreen.main.bounds.height * 0.15) {
                                posicaoCarta = CGPoint(x: UIScreen.main.bounds.width * 0.10, y: UIScreen.main.bounds.height * 0.15)
                                cartaSelecionada = nil
                            } else {
                                posicaoCarta = CGPoint(x: UIScreen.main.bounds.width * 0.10, y: UIScreen.main.bounds.height * 0.0001)
                                cartaSelecionada = carta
                            }
                            
                            print("\(cartaSelecionada)")
                        }
                    }
            )
    }
}
