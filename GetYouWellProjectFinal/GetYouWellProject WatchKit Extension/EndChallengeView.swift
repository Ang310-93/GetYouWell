//
//  EndChallengeView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 13/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI
struct EndChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        EndChallengeView(media: 4, tempo: [13,59])
    }
}


struct EndChallengeView: View {
    var managedObjectContext = (WKExtension.shared().delegate as! ExtensionDelegate).persistentContainer.viewContext
    var media : Int
    var tempo : [Int]
    var body: some View {
        SubEndChallengeView(media: media, tempo: tempo).environment(\.managedObjectContext, managedObjectContext)
    }
}

struct SubEndChallengeView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Utente.entity(),sortDescriptors: [NSSortDescriptor(keyPath: \Utente.punteggio, ascending: true)]) var utente : FetchedResults<Utente>
    @State var media : Int
    @State var tempo : [Int]
    @State var punti = ""
   
    var body: some View {
        ScrollView{  VStack(alignment: .leading, spacing: 5){
            Text("Media battiti:\n\(media)")
            .fontWeight(.bold)
            .font(.custom("Avenir", size: 15))
            Text("Tempo impiegato:\n\(self.tempo[0]) minuti e \(self.tempo[1]) secondi")
            .fontWeight(.bold)
            .font(.custom("Avenir", size: 15))
            Text(punti)
                .fontWeight(.bold)
            .font(.custom("Avenir", size: 15))
            
            NavigationLink(destination: ContentView()){
                Text("Torna alla home" .uppercased())
                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                .fontWeight(.bold)
                }
            }.font(.custom("Avenir", size: 12))
        .padding()
            .frame(width: 160.0)
            .onAppear(perform: aggiungi)
        }.navigationBarBackButtonHidden(true)
        
    }
    func aggiungi(){
        if tempo[0] > 15 && tempo[1] != 0 && tempo[0] != 15{
             utente.first?.punteggio = utente.first!.punteggio + 50
            punti = "Purtroppo hai guadagnato solo 50 punti!"
        } else {
            utente.first?.punteggio = utente.first!.punteggio + 100
            punti = "Complimenti hai guadagnato 100 punti!"
        }
        print("\(utente.first!.punteggio)")
//        let user = Utente(context: managedObjectContext)
//        user.punteggio = 0
        do{
            try managedObjectContext.save()
        }catch{
            print("Error")
        }
    }
}

    
