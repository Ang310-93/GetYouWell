//
//  SettingDayView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 06/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI

struct SettingDayView: View {
    var managedObjectContext = (WKExtension.shared().delegate as! ExtensionDelegate).persistentContainer.viewContext
    
    var body: some View {
        SubSettingDayView().environment(\.managedObjectContext, managedObjectContext)
    }
}

struct SubSettingDayView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Settimana.entity(),sortDescriptors: [NSSortDescriptor(keyPath: \Settimana.lunedi, ascending: true)]) var giorni : FetchedResults<Settimana>
    @State var sett = ["Lun","Mar","Mer","Gio","Ven","Sab","Dom"]
    var body: some View {
        
        //// COMMENTA DA QUI -->
        
        
        ScrollView{
            
            HStack{
                VStack(alignment: .leading){
                    Text("GET YOU WELL")
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.bold)
                    .padding()
                    .padding(.top, -10)
                    
                    Text("Scegli i giorni:")
                        .font(.custom("Avenir", size: 15))
                    .padding()
                    .padding(.top, -10)
                    
                }
            }
            VStack(spacing: -10){
                HStack{
                    Button(action: {
                        if self.giorni.first?.lunedi ?? false{
                            self.giorni.first?.lunedi = false
                        }else{
                            self.giorni.first?.lunedi = true
                        }
                        
                    })  {
                        if self.giorni.first?.lunedi ?? false{
                            Text(self.sett[0])
                                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                                .font(.custom("Avenir", size: 17))
                            
                        }else{
                            Text(self.sett[0])
                                .font(.custom("Avenir", size: 17))
                        }
                    }
                    
                    Button(action: {
                        if self.giorni.first?.martedi ?? false{
                            self.giorni.first?.martedi = false
                        }else{
                            self.giorni.first?.martedi = true
                        }
                        
                    }) {
                        if self.giorni.first?.martedi ?? false{
                            Text(self.sett[1])
                                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                                .font(.custom("Avenir", size: 17))
                        }else{
                            Text(self.sett[1])
                                .font(.custom("Avenir", size: 17))
                        }
                    }
                    Button(action: {
                        if self.giorni.first?.mercoledi ?? false{
                            self.giorni.first?.mercoledi = false
                        }else{
                            self.giorni.first?.mercoledi = true
                }
                    }) {
                        if self.giorni.first?.mercoledi ?? false{
                            Text(self.sett[2])
                                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                                .font(.custom("Avenir", size: 17))
                        }else{
                            Text(self.sett[2])
                                .font(.custom("Avenir", size: 17))
                        }
                    }
                }
                .padding()
                HStack{
                    Button(action: {
                        if self.giorni.first?.giovedi ?? false{
                            self.giorni.first?.giovedi = false
                        }else{
                            self.giorni.first?.giovedi = true
            }
                    }) {
                        if self.giorni.first?.giovedi ?? false{
                            Text(self.sett[3])
                                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                                .font(.custom("Avenir", size: 17))
                        }else{
                            Text(self.sett[3])
                                .font(.custom("Avenir", size: 17))
                        }
                    }
        
                    Button(action: {
                        if self.giorni.first?.venerdi ?? false{
                            self.giorni.first?.venerdi = false
                        }else{
                            self.giorni.first?.venerdi = true
                        }
                    }) {
                        if self.giorni.first?.venerdi ?? false{
                            Text(self.sett[4])
                                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                                .font(.custom("Avenir", size: 17))
                        }else{
                            Text(self.sett[4])
                                .font(.custom("Avenir", size: 17))
                        }
                    }
                    
                    Button(action: {
                        if self.giorni.first?.sabato ?? false{
                            self.giorni.first?.sabato = false
                        }else{
                            self.giorni.first?.sabato = true
                        }
                    }) {
                        if self.giorni.first?.sabato ?? false{
                            Text(self.sett[5])
                                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                                .font(.custom("Avenir", size: 17))
                        }else{
                            Text(self.sett[5])
                                .font(.custom("Avenir", size: 17))
                        }
                    }
                   
                }.padding()
                HStack{
                    Button(action: {
                        if self.giorni.first?.domenica ?? false{
                            self.giorni.first?.domenica = false
                        }else{
                            self.giorni.first?.domenica = true
                        }
                    }) {
                        if self.giorni.first?.domenica ?? false{
                            Text(self.sett[6])
                                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                                .font(.custom("Avenir", size: 17))
                        }else{
                            Text(self.sett[6])
                                .font(.custom("Avenir", size: 17))
                        }
                    }
            
                    Button(action: {
                        self.giorni.first?.lunedi = true
                        self.giorni.first?.martedi = true
                        self.giorni.first?.mercoledi = true
                        self.giorni.first?.giovedi = true
                        self.giorni.first?.venerdi = true
                        self.giorni.first?.sabato = true
                        self.giorni.first?.domenica = true
                    }) {
                        if self.giorni.first?.lunedi ?? false && self.giorni.first?.martedi ?? false && self.giorni.first?.mercoledi ?? false && self.giorni.first?.giovedi ?? false && self.giorni.first?.venerdi ?? false && self.giorni.first?.sabato ?? false && self.giorni.first?.domenica ?? false{
                            Text("Tutti")
                                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                                .font(.custom("Avenir", size: 17))
                        }else{
                            Text("Tutti")
                                .font(.custom("Avenir", size: 17))
                            
                        }
                    }
                }.padding()
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
                }
                .background (Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
            .cornerRadius(7)
                .padding()
//                NavigationLink(destination: OrarioView()){
//                    Text("Continua" .uppercased())
//                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
//                        .font(.custom("Avenir", size: 17))
//                        .fontWeight(.black)
//                }.padding()
            }
        }
    }
}
//
////  <--FINO A QUI
//
//
// LA PRIMA VOLTA CHE AVVII L'APP UTILIZZA QUESTO CODICE INVECE DELL'ALTRO PER CREARE UN FILE IN COREDATA, DEVI COMMENTARE TUTTO IL CODICE CHE TI INDICO E DECOMMENTARE QUELLO CHE SEGUE. CLICCA SUI TASTI "SALVA" UNA SOLA VOLTA, NON SBAGLIARE! UNA VOLTA FINITO CHIUDI E RIMETTI IL CODICE COME STAVA.
//
//            VStack{
//
//             Button(action: {
//                let temp = Settimana(context: self.managedObjectContext)
//                temp.lunedi = false
//                temp.martedi = false
//                temp.mercoledi = false
//                temp.giovedi = false
//                temp.venerdi = false
//                temp.sabato = false
//                temp.domenica = false
//                do{
//                    try self.managedObjectContext.save()
//                }catch{
//                    print("Errore")
//                }
//            }) {
//                Text("Salva")
//            }
//            NavigationLink(destination: OrarioView()){
//                Text("Avanti")
//            }
//        }
//}
//}
