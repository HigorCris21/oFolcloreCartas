//
//  CardGameModel.swift
//  oFolcloreCartas
//
//  Created by Higor  Lo Castro on 20/05/23.
//

import Foundation
import UIKit


struct Jogador: Identifiable {
    var id = UUID()
    var cartas: [Carta]
    var mana = [Int].self
    
    init() {
        self.cartas = Baralho().baralho.prefix(3).map { $0 }
    }
}

var jogadores: [Jogador] = [Jogador(), Jogador()]


struct Carta: Identifiable {
    var id = UUID()
    var imagem: UIImage?
    var acao: String
    
}

struct Baralho {
    var baralho = [Carta]()
    
    init() {
        self.baralho = baralhoData.shuffled()
    }
}


var baralhoData = [
    Carta(imagem: UIImage(named: "Ataque"), acao: "Ataque"),
    Carta(imagem: UIImage(named: "Defesa"), acao: "Defesa"),
    Carta(imagem: UIImage(named: "Recarga"), acao: "Recarga"),
    Carta(imagem: UIImage(named: "Ataque"), acao: "Ataque"),
    Carta(imagem: UIImage(named: "Defesa"), acao: "Defesa"),
    Carta(imagem: UIImage(named: "Recarga"), acao: "Recarga"),
    Carta(imagem: UIImage(named: "Ataque"), acao: "Ataque"),
    Carta(imagem: UIImage(named: "Defesa"), acao: "Defesa"),
    Carta(imagem: UIImage(named: "Recarga"), acao: "Recarga"),
    Carta(imagem: UIImage(named: "Ataque"), acao: "Ataque"),
    Carta(imagem: UIImage(named: "Defesa"), acao: "Defesa"),
    Carta(imagem: UIImage(named: "Recarga"), acao: "Recarga"),
    Carta(imagem: UIImage(named: "Ataque"), acao: "Ataque"),
    Carta(imagem: UIImage(named: "Recarga"), acao: "Recarga"),
    Carta(imagem: UIImage(named: "Ataque"), acao: "Ataque"),
    Carta(imagem: UIImage(named: "Recarga"), acao: "Recarga")
]






