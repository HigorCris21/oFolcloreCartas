//
//  oFolcloreCartasApp.swift
//  oFolcloreCartas
//
//  Created by Higor  Lo Castro on 20/05/23.
//

import SwiftUI

@main
struct oFolcloreCartasApp: App {
    
    //Inicializa o aplicativo Horizontal
    init() {
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
    }
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
