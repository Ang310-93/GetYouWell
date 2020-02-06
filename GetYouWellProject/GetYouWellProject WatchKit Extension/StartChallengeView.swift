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
        VStack{
            Text("Scegli tra diversi tipi di sfida!")
            
            NavigationLink(destination: SfidaPercorsoView()){
                Text("Sfida percorso")
            }
            NavigationLink(destination: SfidaFisicaView()){
                           Text("Sfida fisica")
                       }
    }
}
}

struct StartChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        StartChallengeView()
    }
}
