//
//  FailView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 13/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.
//

import SwiftUI

struct FailView: View {
    var body: some View {
        VStack{
            Text("Peccato, torna la prossima volta per riprovarci!")
                .multilineTextAlignment(.center)
                .frame(height: 100.0)
            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
            NavigationLink(destination: ContentView()){
                Text("TORNA ALLA HOME")
                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                .font(.custom("Avenir", size: 15))
                .fontWeight(.bold)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct FailView_Previews: PreviewProvider {
    static var previews: some View {
        FailView()
    }
}
