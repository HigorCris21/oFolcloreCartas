//
//  CardGameModel.swift
//  oFolcloreCartas
//
//  Created by Higor  Lo Castro on 20/05/23.
//

import Foundation
import SwiftUI


struct Jogador: Identifiable {
    var id = UUID()
    var cartas: [Carta]
    var mana: Int = 1
    var vida: Int = 3
    
    
    //Distribui as cartas e verifica se existe as  3 cartas são somente Ataque ou somente Recarga
    init() {
        self.cartas = Baralho().baralho.prefix(3).map { $0 }
        
        let possuiApenasAtaques = cartas.allSatisfy { $0.tipo == "Ataque" }
        let possuiApenasRecargas = cartas.allSatisfy { $0.tipo == "Recarga" }
        
        if possuiApenasAtaques || possuiApenasRecargas {
            self.cartas = Baralho().baralho.prefix(3).map { $0 }
        }
    }
}


var jogadores: [Jogador] = [Jogador(), Jogador()]


struct Carta: Identifiable {
    var id = UUID()
    var imagem: Image?
    var tipo: String
    
}

struct Baralho {
    var baralho = [Carta]()
    
    init() {
        self.baralho = baralhoData.shuffled()
    }
}


var baralhoData = [
    Carta(imagem: Image("Ataque"), tipo: "Ataque"),
    Carta(imagem: Image("Defesa"), tipo: "Defesa"),
    Carta(imagem: Image("Recarga"), tipo: "Recarga"),
    Carta(imagem: Image("Ataque"), tipo: "Ataque"),
    Carta(imagem: Image("Defesa"), tipo: "Defesa"),
    Carta(imagem: Image("Recarga"), tipo: "Recarga"),
    Carta(imagem: Image("Ataque"), tipo: "Ataque"),
    Carta(imagem: Image("Defesa"), tipo: "Defesa"),
    Carta(imagem: Image("Recarga"), tipo: "Recarga"),
    Carta(imagem: Image("Ataque"), tipo: "Ataque"),
    Carta(imagem: Image("Defesa"), tipo: "Defesa"),
    Carta(imagem: Image("Recarga"), tipo: "Recarga"),
    Carta(imagem: Image("Ataque"), tipo: "Ataque"),
    Carta(imagem: Image("Recarga"), tipo: "Recarga"),
    Carta(imagem: Image("Ataque"), tipo: "Ataque"),
    Carta(imagem: Image("Recarga"), tipo: "Recarga")
]






