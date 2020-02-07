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
        
        //// COMMENTA DA QUI --->
        
        ScrollView{
            HStack{
                VStack(alignment: .leading){
                    Text("GET YOU WELL")
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.bold)
                        .padding()
                        .padding(.top, -10)
                    
                    Text("Scegli una fascia oraria:")
                        .font(.custom("Avenir", size: 15))
                        .padding()
                        .padding(.top, -10)
                }
            }
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
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                            .font(.custom("Avenir", size: 17))
                    }else{
                        Text("Mattina")
                            .font(.custom("Avenir", size: 17))
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
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                            .font(.custom("Avenir", size: 17))
                    }else{
                        Text("Pomeriggio")
                            .font(.custom("Avenir", size: 17))
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
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                            .font(.custom("Avenir", size: 17))
                    }else{
                        Text("Sera")
                            .font(.custom("Avenir", size: 17))
                    }
                }
                Button(action: {
                    do{
                        try self.managedObjectContext.save()
                    }catch{
                        print("Errore")
                    }
                }) {
                    Text("Salva" .uppercased())
                        .foregroundColor(Color(.sRGB, red: 34/255, green: 34/255, blue: 35/255))
                        .font(.custom("Avenir", size: 17))
                        .fontWeight(.black)
                } .background(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                    .cornerRadius(7)
                    .padding(.top, 10)
                
                //                NavigationLink(destination: ContentView()){
                //                    Text("Inizia" .uppercased())
                //                    .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                //                    .font(.custom("Avenir", size: 17))
                //                        .fontWeight(.black)
                //                }
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
