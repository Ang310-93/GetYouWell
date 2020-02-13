//
//  StartChallengeView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 06/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI

struct StartChallengeView: View {
    var body: some View {
        ScrollView{
            VStack{
                Text("GET YOU WELL")
                    .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                    .font(.custom("Avenir", size: 15))
                    .fontWeight(.bold)
                    .padding(.leading, -55)
                
                
                Text("Scegli tra diversi tipi di sfida!")
                    .font(.custom("Avenir", size: 15))
                    .padding(.top, 7)
                    .padding(.trailing, 10)
                
                
                NavigationLink(destination: SfidaPercorsoView()){
                    Text("Sfida percorso" .uppercased())
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.bold)
                }
                NavigationLink(destination: SfidaFisicaView()){
                    Text("Sfida fisica" .uppercased())
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.bold)
                }
            }
            .padding()
        }
    }
}

struct StartChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        StartChallengeView()
    }
}
