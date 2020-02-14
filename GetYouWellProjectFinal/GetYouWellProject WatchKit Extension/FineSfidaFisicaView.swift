//
//  FineSfidaFisicaView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 13/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//
import SwiftUI
struct FineSfidaFisicaView_Previews: PreviewProvider {
    static var previews: some View {
        FineSfidaFisicaView()
    }
}


struct FineSfidaFisicaView: View {
    var managedObjectContext = (WKExtension.shared().delegate as! ExtensionDelegate).persistentContainer.viewContext
  
    var body: some View {
        SubFineSfidaFisicaView().environment(\.managedObjectContext, managedObjectContext)
    }
}

struct SubFineSfidaFisicaView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Utente.entity(),sortDescriptors: [NSSortDescriptor(keyPath: \Utente.punteggio, ascending: true)]) var utente : FetchedResults<Utente>
   
   
    var body: some View {
        VStack{
            
         Text("Complimenti! Hai guadagnato 20 punti con questa sfida!")
        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
        .fontWeight(.black)
        .font(.custom("Avenir", size: 18))
        
            NavigationLink(destination: ContentView()){
                Text("TORNA ALLA HOME")
                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                .fontWeight(.black)
            }
        
        
        }.navigationBarBackButtonHidden(true)
        .onAppear(perform: addPunti)
        
    }
    func addPunti(){
        utente.first?.punteggio = utente.first!.punteggio + 20
        do{
            try managedObjectContext.save()
        }catch{
            print("Error")
        }
    }
}
