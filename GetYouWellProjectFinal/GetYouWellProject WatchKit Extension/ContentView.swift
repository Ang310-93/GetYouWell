//
//  ContentView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 06/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: -10){
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(20)
                NavigationLink(destination: StartChallengeView()){
                    Text("Inizia" .uppercased())
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.bold)
                
                }
                .padding()
                NavigationLink(destination: ImpostaziniView()){
                    Text("Imposta giorni" .uppercased())
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .font(.custom("Avenir", size: 10))
                        .fontWeight(.bold)
                }
                .padding()
                NavigationLink(destination:PuntiView()) {
                    Text("IL TUO PUNTEGGIO")
                        .font(.custom("Avenir", size: 10))
                        .fontWeight(.bold)
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .multilineTextAlignment(.leading)
                }
                .padding()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

