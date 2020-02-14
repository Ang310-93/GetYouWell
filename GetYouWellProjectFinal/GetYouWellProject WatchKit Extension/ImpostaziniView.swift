//
//  ImpostaziniView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by degiuliofelicemaria on 07/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI

struct ImpostaziniView: View {
    var body: some View {
        ScrollView{
           
                VStack(alignment: .leading){
                    Text("GET YOU WELL")
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.bold)
                        .padding(.top, 0)
                    
                    Text("Inizia ora la tua serie di sfide settimanali!")
                        .font(.custom("Avenir", size: 15))
                        .padding(.top, 7)
                    
                }
                
                            NavigationLink(destination: SettingDayView()){
                    Text("Imposta giorni" .uppercased())
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.bold)
            }.padding()
        
                NavigationLink(destination: OrarioView()){
                    Text("Imposta ore" .uppercased())
                        .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.bold)
            }.padding()
                .padding(.top, -17)
                
                
        }
        }
    
}

struct ImpostaziniView_Previews: PreviewProvider {
    static var previews: some View {
        ImpostaziniView()
    }
}
