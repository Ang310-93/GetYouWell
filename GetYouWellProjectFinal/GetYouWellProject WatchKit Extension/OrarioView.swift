//
//  OrarioView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 06/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI
import UserNotifications

struct OrarioView_Previews: PreviewProvider {
    static var previews: some View {
        OrarioView()
    }
}


struct OrarioView: View {
    var managedObjectContext = (WKExtension.shared().delegate as! ExtensionDelegate).persistentContainer.viewContext
    
    var body: some View {
        SubOrarioView().environment(\.managedObjectContext, managedObjectContext)
    }
}
struct SubOrarioView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Orario.entity(),sortDescriptors: [NSSortDescriptor(keyPath: \Orario.mattina, ascending: true)]) var orario : FetchedResults<Orario>
    @FetchRequest(entity: Settimana.entity(),sortDescriptors: [NSSortDescriptor(keyPath: \Settimana.lunedi, ascending: true)]) var giorni : FetchedResults<Settimana>
    
     @State var alert = false


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
                      .padding(.leading, -7)

                    Text("Scegli una fascia oraria:")
                        .font(.custom("Avenir", size: 15))
                        .padding()
                        .padding(.top, -10)
                      .padding(.leading, -7)
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

                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
                    (status, _) in
                    if status{
                        let contentM = UNMutableNotificationContent()
                        contentM.title = "SFIDA DEL GIORNO\n"
                        contentM.body = "\nLa tua sfida\ngiornaliera è pronta,\ninizia ora!"

                        let contentP = UNMutableNotificationContent()
                        contentP.title = "SFIDA DEL GIORNO\n"
                        contentP.body = "\nLa tua sfida\ngiornaliera è pronta,\ninizia ora!"

                        let contentS = UNMutableNotificationContent()
                        contentS.title = "SFIDA DEL GIORNO\n"
                        contentS.body = "\nLa tua sfida\ngiornaliera è pronta,\ninizia ora!"

                        let date = Date()
                        let format = DateFormatter()
                        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
                        let formattedDate = format.string(from: date)
                        let calendar = Calendar.current
//                        calendar.component(.day, from: date)
                        print(formattedDate)
                        print(calendar.component(.weekdayOrdinal, from: date))
                        var dateComponentsMattina = DateComponents()
                        dateComponentsMattina.hour = 10
                        dateComponentsMattina.minute = 50
                        var dateComponentsPome = DateComponents()
                        dateComponentsPome.hour = 14
                        dateComponentsPome.minute = 30

                        var dateComponentsSera = DateComponents()
                        dateComponentsSera.hour = 17
                        dateComponentsSera.minute = 30


                        if self.orario.first?.mattina ?? false{
                            if self.giorni.first?.lunedi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 1{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsMattina, repeats: true)
                                    let request = UNNotificationRequest(identifier: "noti", content: contentM, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }

                            if self.giorni.first?.martedi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 2{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsMattina, repeats: true)
                                    let request = UNNotificationRequest(identifier: "noti", content: contentM, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.mercoledi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 3{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsMattina, repeats: true)
                                    let request = UNNotificationRequest(identifier: "noti", content: contentM, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.giovedi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 4{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsMattina, repeats: true)
                                    let request = UNNotificationRequest(identifier: "noti", content: contentM, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.venerdi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 5{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsMattina, repeats: true)
                                    let request = UNNotificationRequest(identifier: "noti", content: contentM, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.sabato ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 6{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsMattina, repeats: true)
                                    let request = UNNotificationRequest(identifier: "noti", content: contentM, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.domenica ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 0{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsMattina, repeats: true)
                                    let request = UNNotificationRequest(identifier: "noti", content: contentM, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                        }

                        if self.orario.first?.pomeriggio ?? false{
                            if self.giorni.first?.lunedi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 1{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsPome, repeats: true)
                                    let request = UNNotificationRequest(identifier: "notiP", content: contentP, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                                if self.giorni.first?.martedi ?? false{
                                    if calendar.component(.weekdayOrdinal, from: date) == 2{
                                        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsPome, repeats: true)
                                        let request = UNNotificationRequest(identifier: "notiP", content: contentP, trigger: trigger)
                                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                    }
                            }
                                    if self.giorni.first?.mercoledi ?? false{
                                        if calendar.component(.weekdayOrdinal, from: date) == 3{
                                            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsPome, repeats: true)
                                            let request = UNNotificationRequest(identifier: "notiP", content: contentP, trigger: trigger)
                                            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                        }
                            }
                                        if self.giorni.first?.giovedi ?? false{
                                            if calendar.component(.weekdayOrdinal, from: date) == 4{
                                                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsPome, repeats: true)
                                                let request = UNNotificationRequest(identifier: "notiP", content: contentP, trigger: trigger)
                                                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                            }
                            }
                                            if self.giorni.first?.venerdi ?? false{
                                                if calendar.component(.weekdayOrdinal, from: date) == 5{
                                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsPome, repeats: true)
                                                    let request = UNNotificationRequest(identifier: "notiP", content: contentP, trigger: trigger)
                                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                                }
                            }
                                                if self.giorni.first?.sabato ?? false{
                                                    if calendar.component(.weekdayOrdinal, from: date) == 6{
                                                        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsPome, repeats: true)
                                                        let request = UNNotificationRequest(identifier: "notiP", content: contentP, trigger: trigger)
                                                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                                    }
                            }
                                                    if self.giorni.first?.domenica ?? false{
                                                        if calendar.component(.weekdayOrdinal, from: date) == 0{
                                                            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsPome, repeats: true)
                                                            let request = UNNotificationRequest(identifier: "notiP", content: contentP, trigger: trigger)
                                                            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                                        }
                                                    }
                                                }
                        if self.orario.first?.sera ?? false{
                            if self.giorni.first?.lunedi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 1{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsSera, repeats: true)
                                    let request = UNNotificationRequest(identifier: "notiS", content: contentS, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }

                            if self.giorni.first?.martedi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 2{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsSera, repeats: true)
                                    let request = UNNotificationRequest(identifier: "notiS", content: contentS, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.mercoledi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 3{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsSera, repeats: true)
                                    let request = UNNotificationRequest(identifier: "notiS", content: contentS, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.giovedi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 4{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsSera, repeats: true)
                                    let request = UNNotificationRequest(identifier: "notiS", content: contentS, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.venerdi ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 5{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsSera, repeats: true)
                                    let request = UNNotificationRequest(identifier: "notiS", content: contentS, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.sabato ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 6{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsSera, repeats: true)
                                    let request = UNNotificationRequest(identifier: "notiS", content: contentS, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                            if self.giorni.first?.domenica ?? false{
                                if calendar.component(.weekdayOrdinal, from: date) == 0{
                                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsSera, repeats: true)
                                    let request = UNNotificationRequest(identifier: "notiS", content: contentS, trigger: trigger)
                                    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                }
                            }
                        }
                    }
//                        self.alert.toggle()
                    }

                }) {
                    Text("Salva" .uppercased())
                        .foregroundColor(Color(.sRGB, red: 34/255, green: 34/255, blue: 35/255))
                        .font(.custom("Avenir", size: 17))
                        .fontWeight(.black)
                } .background(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                    .cornerRadius(7)
                    .padding(.top, 10)
                .alert(isPresented: $alert) {
                    return Alert(title: Text("Per Favore Attiva le notifiche"))
                }
            }
        .padding()
        }
    }
}
//
////  <--FINO A QUI
//
//
// LA PRIMA VOLTA CHE AVVII L'APP UTILIZZA QUESTO CODICE INVECE DELL'ALTRO PER CREARE UN FILE IN COREDATA, DEVI COMMENTARE TUTTO IL CODICE CHE TI INDICO E DECOMMENTARE QUELLO CHE SEGUE. CLICCA SUI TASTI "SALVA" UNA SOLA VOLTA, NON SBAGLIARE! UNA VOLTA FINITO CHIUDI E RIMETTI IL CODICE COME STAVA.
//        VStack{
////
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
