//
//  PuntiView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 13/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI
import CoreData

struct PuntiView_Previews: PreviewProvider {
    static var previews: some View {
        PuntiView()
    }
}


struct PuntiView: View {
    var managedObjectContext = (WKExtension.shared().delegate as! ExtensionDelegate).persistentContainer.viewContext
    var body: some View {
        SubPuntiView().environment(\.managedObjectContext, managedObjectContext)
    }
}

struct SubPuntiView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Utente.entity(),sortDescriptors: [NSSortDescriptor(keyPath: \Utente.punteggio, ascending: true)]) var utente : FetchedResults<Utente>
   @State var livello = ""
    
    var body: some View {
        ScrollView{
                    VStack(spacing: 10){
                        Text("SEI")
                            .font(.custom("Avenir", size: 10))
                            .fontWeight(.bold)
                        Text(livello)
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                            .font(.custom("Avenir", size: 18))
                            .fontWeight(.bold)
                        Text("PUNTI OTTENUTI")
                            .fontWeight(.bold)
                            .font(.custom("Avenir", size: 10))
                        Text("\(utente.first!.punteggio)")
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                            .font(.custom("Avenir", size: 18))
                            .fontWeight(.bold)
        
                    }.padding()
                        .frame(width: 160.0)

                    .onAppear(perform: setLivello)
                }
}
    func setLivello(){
        if utente.first!.punteggio < Int16(500){
                  livello = "Principiante"
    }else if utente.first!.punteggio < Int16(1000){
                  livello = "Sedentario"
    }else if utente.first!.punteggio < Int16(1500){
                  livello = "In salute"
    }else if utente.first!.punteggio < Int16(2500){
                  livello = "Atletico"
    }else if utente.first!.punteggio < Int16(5000){
                  livello = "Culturista"
    }
}
}
