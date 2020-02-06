//
//  OrarioView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 06/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI

struct OrarioView: View {
    var managedObjectContext = (WKExtension.shared().delegate as! ExtensionDelegate).persistentContainer.viewContext
    
    var body: some View {
        SubOrarioView().environment(\.managedObjectContext, managedObjectContext)
    }
}
struct SubOrarioView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Orario.entity(),sortDescriptors: [NSSortDescriptor(keyPath: \Orario.mattina, ascending: true)]) var orario : FetchedResults<Orario>

    var body: some View {
 
// COMMENTA DA QUI --->
        
        ScrollView{
            VStack{
                Button(action: {
                    if self.orario.first?.mattina ?? false{
                        self.orario.first?.mattina = false
                    }else{
                        self.orario.first?.mattina = true
                    }
                }) {
                    if self.orario.first?.mattina ?? false{
                        Text("Mattina")
                            .foregroundColor(.orange)
                    }else{
                        Text("Mattina")
                    }
                }
                Button(action: {
                    if self.orario.first?.pomeriggio ?? false{
                        self.orario.first?.pomeriggio = false
                    }else{
                        self.orario.first?.pomeriggio = true
                    }
                }) {
                    if self.orario.first?.pomeriggio ?? false{
                        Text("Pomeriggio")
                            .foregroundColor(.orange)
                    }else{
                        Text("Pomeriggio")
                    }
                }
                Button(action: {
                    if self.orario.first?.sera ?? false{
                        self.orario.first?.sera = false
                    }else{
                        self.orario.first?.sera = true
                    }
                }) {
                    if self.orario.first?.sera ?? false{
                        Text("Sera")
                            .foregroundColor(.orange)
                    }else{
                        Text("Sera")
                    }
                }
                Button(action: {
                    do{
                        try self.managedObjectContext.save()
                    }catch{
                        print("Errore")
                    }
                }) {
                    Text("Salva")
                        .fontWeight(.bold)
                }
                NavigationLink(destination: ContentView()){
                    Text("Inizia")
                }
            }
        }
    }
}

//  <--FINO A QUI


// LA PRIMA VOLTA CHE AVVII L'APP UTILIZZA QUESTO CODICE INVECE DELL'ALTRO PER CREARE UN FILE IN COREDATA, DEVI COMMENTARE TUTTO IL CODICE CHE TI INDICO E DECOMMENTARE QUELLO CHE SEGUE. CLICCA SUI TASTI "SALVA" UNA SOLA VOLTA, NON SBAGLIARE! UNA VOLTA FINITO CHIUDI E RIMETTI IL CODICE COME STAVA.
//        VStack{
//
//            Button(action: {
//                let temp = Orario(context: self.managedObjectContext)
//                temp.mattina = false
//                temp.pomeriggio = false
//                temp.sera = false
//                do{
//                    try self.managedObjectContext.save()
//                }catch{
//                    print("Errore")
//                }
//            }) {
//                Text("Salva")
//            }
//            NavigationLink(destination: ContentView()){
//                Text("Avanti")
//            }
//        }
//    }
//}
