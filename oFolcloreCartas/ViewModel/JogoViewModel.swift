//
//
//import SwiftUI
//import Combine
//
//class JogoViewModel: ObservableObject {
//    @Published var jogador1: Jogador = Jogador()
//    @Published var jogador2: Jogador = Jogador()
//    
//    func compararCartas(cartaJogador1: Carta?, cartaJogador2: Carta?) -> String {
//        guard let cartaJogador1 = cartaJogador1, let cartaJogador2 = cartaJogador2 else {
//            return "Nenhuma carta selecionada"
//        }
//        
//        if cartaJogador1.tipo == cartaJogador2.tipo {
//            return "Empate"
//        } else if cartaJogador1.tipo == "Ataque" && cartaJogador2.tipo == "Defesa" {
//            return "Jogador 1 usou ataque e venceu contra a defesa do Jogador 2"
//        } else if cartaJogador1.tipo == "Defesa" && cartaJogador2.tipo == "Recarga" {
//            return "Jogador 1 usou defesa e bloqueou a recarga do Jogador 2"
//        } else if cartaJogador1.tipo == "Recarga" && cartaJogador2.tipo == "Ataque" {
//            return "Jogador 1 usou recarga e se preparou para o ataque do Jogador 2"
//        } else {
//            return "Jogador 2 venceu"
//        }
//    }
//
//
//}
