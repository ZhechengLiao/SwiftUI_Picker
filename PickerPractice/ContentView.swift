//
//  ContentView.swift
//  PickerPractice
//
//  Created by 廖哲澄 on 2021/11/16.
//

import SwiftUI

struct ContentView: View {
    @State var selectLocation = "New York"
    @State var selectedOrder = 3
    @State var selectPickup = 1
    
    @State var isAlert = false

    // 完成付款
    let primaryButton = Alert.Button.default(Text("Yes")) {
        print("Yes, I gonna buy these.")
    }

    let secondaryButton = Alert.Button.destructive(Text("No")) {
        print("No, I wanna think more.")
    }
    
    var alert: Alert {
        Alert(title: Text("Notice"),
              message: Text("Sure to order?"),
              primaryButton: primaryButton,
              secondaryButton: secondaryButton)
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Ottimo Ristorante").bold().font(.largeTitle)
            Spacer()
            HStack(spacing: 30) {
                Text("Location:")
                Picker ("Location:", selection: $selectLocation) {
                    Text("New York").tag("New York")
                    Text("Chicargo").tag("Chicargo")
                    Text("Boston").tag("Boston")
                    Text("Iillioni").tag("Iillioni")
                    Text("LA").tag("LA")
                }
            }
            Spacer()
            VStack(spacing: 0) {
                Text("Order:").font(.title2)
                Picker ("Order", selection: $selectedOrder) {
                    Text("Fish").tag(1)
                    Text("Pad Tai").tag(2)
                    Text("Turkey burger").tag(3)
                    Text("Nacos").tag(4)
                    Text("Poutine").tag(5)
                }.pickerStyle(WheelPickerStyle())
            }
            Spacer()
            VStack {
                Text("Pickup Time:").font(.headline)
                Picker ("Pickup time", selection: $selectPickup) {
                    Text("5 pm").tag(1)
                    Text("6 pm").tag(2)
                    Text("7 pm").tag(3)
                    Text("8 pm").tag(4)
                    Text("9 pm").tag(5)
                }.pickerStyle(SegmentedPickerStyle()).padding()
            }
            Spacer()
            
            Button("Done") {
                // TODO
                self.isAlert = true
            }.alert(isPresented: $isAlert, content: {
                alert
            })
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
