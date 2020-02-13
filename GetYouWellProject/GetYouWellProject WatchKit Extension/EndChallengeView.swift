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
    func aggiungi(){
//        utente.first!.punteggio = utente.first!.punteggio + 100
//        print("\(utente.first!.punteggio)")
//        do{
//            try managedObjectContext.save()
//        }catch{
//            print("Error")
//        }
          let user = Utente(context: managedObjectContext)
        user.punteggio = 0
        do{
            try managedObjectContext.save()
                
            }catch{
            print("Error")
            }
    }
    var body: some View {
        VStack{
            Text("MEDIA BATTITI: \(media)")
            Text("Tempo impiegato:\n\(self.tempo[0]):\(self.tempo[1])")
            Text("Punti guadagnati:\n100")
            NavigationLink(destination: ContentView()){
                Text("Torna alla home")
                }
            }
    }
}

    
