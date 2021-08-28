//
//  ContentView.swift
//  NathanTIL
//
//  Created by Nathan on 2021/08/28.
//

import SwiftUI

struct ThingsStore {
    var things: [String] = []
}

struct ContentView: View {
    @State private var showAddThings = false
    @State private var myThings = ThingsStore()
    @State private var showAlert = false
    //let tempThings = ["YOLO", "FOMO"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if myThings.things.isEmpty {
                    Button("Add acronyms you learn") {
                        showAlert = true
                    }
                        .foregroundColor(.gray)
                        //.kerning(2)
                }
//                Button("Tap to show alert") {
//                    showAlert = true
//                }
                ForEach(myThings.things, id: \.self) { thing in
                    Text(thing)
                        .environment(\.textCase, .uppercase)
                }
                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"),
                      message: Text("Add acronyms you learn"))
            }
            .sheet(isPresented: $showAddThings) {
                AddThingsView(myThings: $myThings)
            }
            .navigationTitle("TIL")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddThings.toggle() }) {
                        Image(systemName: "plus.circle")
                            .font(.title)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            //.environment(\.textCase, .uppercase)
    }
}
