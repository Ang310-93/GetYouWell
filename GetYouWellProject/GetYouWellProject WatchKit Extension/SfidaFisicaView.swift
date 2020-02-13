//
//  SfidaFisicaView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 06/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI

struct SfidaFisicaView: View {
    @State var esercizi = ["Hai 30 secondi per effettuare 10 piegamenti sulle braccia, premi il pulsante play quando sei pronto!", "Facciamo una serie di 10 addominali, hai 30 secondi! Premi il pulsante play quando sei pronto!", "Che ne dici di fare un po' di streaching? Toccati le punte dei piedi, premi play quando sei pronto!"]
    @State var esercizio = ""
    @State var secondi = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var start = false
    var body: some View {
        ScrollView{
            VStack{
                    Text(esercizio)
                        .font(.custom("Avenir", size: 15))
                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
            
            Button(action: {
                if self.start {
                    self.start = false
                }else {
                    self.start = true
                }
            }) {
                if self.start {
            Text("\(secondi)")
                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                .fontWeight(.black)
                .font(.custom("Avenir", size: 30))
                .onReceive(timer) { _ in
                    if self.secondi > 0 {
                        self.secondi = self.secondi - 1
                    }
                    }
                }else{
                    Image(systemName: "play")
                    .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                }
            }
                NavigationLink(destination: FineSfidaFisicaView()){
                    Image(systemName: "checkmark")
                    .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                }
                    
            }.onAppear(perform: selectEs)
        }
        
    }
        func selectEs(){
            esercizio = esercizi.randomElement()!
        }
    }
    
    struct SfidaFisicaView_Previews: PreviewProvider {
        static var previews: some View {
            SfidaFisicaView()
        }
}

//}

