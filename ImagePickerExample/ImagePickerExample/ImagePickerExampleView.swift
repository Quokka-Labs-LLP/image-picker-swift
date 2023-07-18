//
//  ImagePickerExampleView.swift
//  ImagePickerExample
//
//  Created by Manish Solanki on 13/07/23.
//

import SwiftUI
import PhotosPicker

struct ImagePickerExampleView: View {
    @State var showPicker: Bool = false
    
    var body: some View {
        VStack {
            Button("Pick", action: {
                showPicker.toggle()
            })
            .sheet(isPresented: $showPicker) {
                ScrollView(content: {
                    Button("Camera") {
                        print("Open camera")
                    }
                    .buttonStyle(.bordered)
                    
                    Text("Images will appear here")
                        .presentationDetents([.medium, .large])
                        .presentationDragIndicator(.visible)
                }).padding()
            }
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerExampleView()
    }
}
