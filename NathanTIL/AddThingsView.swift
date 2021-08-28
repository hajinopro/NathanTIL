//
//  AddThingsView.swift
//  NathanTIL
//
//  Created by Nathan on 2021/08/28.
//

import SwiftUI

struct AddThingsView: View {
    @Binding var myThings: ThingsStore
    @State private var thing = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Thing I learned", text: $thing)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .disableAutocorrection(true)
            Button("Done") {
                presentationMode.wrappedValue.dismiss()
                //myThings.things.append("FOMO")
                if !thing.isEmpty {
                    myThings.things.append(thing)
                }
            }
            Spacer()
        }
    }
}

struct AddThingsView_Previews: PreviewProvider {
    static var previews: some View {
        AddThingsView(myThings: .constant(ThingsStore()))
    }
}
