//
//  SfidaPercorsoView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 06/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI

struct SfidaPercorsoView: View {
    
    var percorsi = [("Arco di Traiano","arco"),("Piazza Santa Sofia","santa"),("Villa Comunale","villa"),("Duomo","duomo"),("Stadio","stadio")]
    @State var luogo = ("","")
    
    var body: some View {
        ScrollView{
            VStack{
                Text("Il percorso di oggi prevede che tu vada in questo luogo")
//                  .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                  .font(.custom("Avenir", size: 15))
                  
                  .padding()
                  .padding(.top, -10)
                .padding(.leading, -7)
                    
                Text(luogo.0 .uppercased())
                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                .font(.custom("Avenir", size: 15))
                .fontWeight(.bold)
                    .padding()
                Image(luogo.1)
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                    .padding(.top, -25)
                    
                 Text("Riesci a raggiungerlo in 15 minuti? Proviamoci, ne vale la pena!")
                
                                  .font(.custom("Avenir", size: 15))
                                  
                                  .padding()
                
                NavigationLink(destination: ChallengeStartedView()) {
                    Text("START")
                    .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                    .font(.custom("Avenir", size: 15))
                    .fontWeight(.bold)
                    
                }.padding()
            }
            }.navigationBarBackButtonHidden(true)
        .onAppear(perform: selectPlace)
        }
    func selectPlace(){
        self.luogo = percorsi.randomElement() ?? ("","")
    }
        
    }


struct SfidaPercorsoView_Previews: PreviewProvider {
    static var previews: some View {
        SfidaPercorsoView()
    }
}
