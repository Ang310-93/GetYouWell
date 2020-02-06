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
            
// COMMENTA DA QUI -->
            
            
            ScrollView{
                VStack(spacing: -10){
                    HStack{
                        Button(action: {
                            if self.giorni.first?.lunedi ?? false{
                                self.giorni.first?.lunedi = false
                            }else{
                                self.giorni.first?.lunedi = true
                            }
                        }) {
                            if self.giorni.first?.lunedi ?? false{
                                Text(self.sett[0])
                                    .foregroundColor(.orange)
                            }else{
                                Text(self.sett[0])
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
                                    .foregroundColor(.orange)
                            }else{
                                Text(self.sett[1])
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
                                    .foregroundColor(.orange)
                            }else{
                                Text(self.sett[2])
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
                                    .foregroundColor(.orange)
                            }else{
                                Text(self.sett[3])
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
                                    .foregroundColor(.orange)
                            }else{
                                Text(self.sett[4])
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
                                    .foregroundColor(.orange)
                            }else{
                                Text(self.sett[5])
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
                                    .foregroundColor(.orange)
                            }else{
                                Text(self.sett[6])
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
                                    .foregroundColor(.orange)
                            }else{
                                Text("Tutti")
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
                            Text("Salva")
                                .fontWeight(.bold)
                        }.padding()
                    NavigationLink(destination: OrarioView()){
                        Text("Continua")
                    }.padding()
                }
            }
        }
    }

//  <--FINO A QUI
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
