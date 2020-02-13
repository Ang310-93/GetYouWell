//
//  ChallengeStartedView.swift
//  GetYouWellProject WatchKit Extension
//
//  Created by barbieriangelo on 12/02/2020.
//  Copyright © 2020 barbieriangelo. All rights reserved.


import SwiftUI
import HealthKit

struct ChallengeStartedView: View {
    private var healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    
    @State var valori : [Int] = []
    @State private var value = 0
    @State var media = 0
    @State private var currentPage = 0
    @State var minutiRimantenti = 0
    @State var secondiRim = 0
    @State var pause = false
    @State var stop = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //    @State var isPlaying = false
    
    var body: some View {
        VStack{
            PagerManager(pageCount: 2, currentIndex: $currentPage) {
                VStack(alignment: .leading){
                    HStack{
                        Text("\(minutiRimantenti) : \(secondiRim)")
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                            .fontWeight(.black)
                            .font(.custom("Avenir", size: 30))
                            .onReceive(timer) { _ in
                                if !self.pause{
                                    if self.minutiRimantenti < 15{
                                        if self.secondiRim == 59 {
                                            self.minutiRimantenti = self.minutiRimantenti + 1
                                            self.secondiRim = 0
                                        }else{
                                            self.secondiRim = self.secondiRim + 1
                                        }
                                        
                                    }
                                }
                        }
                        Text("min")
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                            .font(.custom("Avenir", size: 15))
                            .font(.headline)
                            .fontWeight(.light)
                            .foregroundColor(Color.red)
                            .padding(.bottom, -10)
                        
                    }
                    HStack{
                        Text("\(value)")
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                            .font(.custom("Avenir", size: 30))
                            .font(.headline)
                            .fontWeight(.black)
                        
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                    }.padding(.top, -20)
                    
                    
                    HStack{
                        
                        Text("\(media)")
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                            .font(.custom("Avenir", size: 30))
                            .font(.headline)
                            .fontWeight(.black)
                        Image(systemName: "waveform.path.ecg")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                        
                    }.padding(.top, -20)
                    Spacer()
                }.padding(.top, 20)
                VStack(spacing: 0){
                    
                    Button(action: {
                        if self.pause{
                            self.pause = false
                        }else {
                            self.pause = true
                        }
                    }) {
                        Image(systemName: pause ? "play": "pause")
                    }.frame(width: 145)
                        .padding()
                        .padding(.leading, 5)
                    
                    HStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(Color(.sRGB, red: 150/255, green: 0/255, blue: 0/255))
                                .overlay(
                                    Image(systemName: "stop"))
                        }.frame(width: 60, height: 60)
                            .padding()
                        
                        NavigationLink(destination: EndChallengeView(media: 6, tempo: [7,9])){
                            Circle()
                                .frame(width: 70, height: 70)
                                .foregroundColor(Color(.sRGB, red: 243/255, green: 145/255, blue: 0/255))
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white))
                        }.frame(width: 60, height: 60)
                        
                    }
                }.padding(.leading, -10)
                
            }
            Spacer()
            //Page Control
            HStack{
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(currentPage==1 ? Color.gray:Color.white)
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(currentPage==1 ? Color.white:Color.gray)
            }
            Spacer()
        }
            
        .padding(.top, 33.0)
            //        .frame(height: 210.0)
            .frame(height: 232.0)
            .onAppear(perform: start)
        
    }
    
    func start() {
        autorizeHealthKit()
        startHeartRateQuery(quantityTypeIdentifier: .heartRate)
        
    }
    
    func autorizeHealthKit() {
        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!, HKObjectType.quantityType(forIdentifier: .stepCount)!]
        
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
    }
    
    private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
        
        // 1
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        // 2
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            query, samples, deletedObjects, queryAnchor, error in
            
            // 3
            guard let samples = samples as? [HKQuantitySample] else {
                return
            }
            
            self.process(samples, type: quantityTypeIdentifier)
            
        }
        
        // 4
        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
        
        query.updateHandler = updateHandler
        
        // 5
        
        healthStore.execute(query)
    }
    
    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        var lastHeartRate = 0.0
        for sample in samples {
            print(samples.count)
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
                if samples.count == 1{
                    self.value = Int(lastHeartRate)
                    self.valori.append(Int(lastHeartRate))
                    calcolaMedia(val: valori)
                }
            }
            
        }
    }
    func calcolaMedia(val: [Int]){
        media = 0
        if valori.isEmpty{return}
        for i in val{
            media = media + i
        }
        media = media / val.count
        //        print(media)
    }
    
}

struct PagerManager<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content
    
    //Set the initial values for the variables
    init(pageCount: Int, currentIndex: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }
    
    @GestureState private var translation: CGFloat = 0
    
    //Set the animation
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geometry.size.width)
            .offset(x: self.translation)
                
                
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), 0), self.pageCount - 1)
                }
            )
        }
    }
}

struct ChallengeStartedView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeStartedView()
    }
}
