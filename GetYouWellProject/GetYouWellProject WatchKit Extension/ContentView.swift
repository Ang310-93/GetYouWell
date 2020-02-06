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
            VStack{
                NavigationLink(destination: SettingDayView()){
                    Text("Imposta giorni")
                }.padding()
                NavigationLink(destination: StartChallengeView()){
                    Text("Inizia")
                }.padding()
            }
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

