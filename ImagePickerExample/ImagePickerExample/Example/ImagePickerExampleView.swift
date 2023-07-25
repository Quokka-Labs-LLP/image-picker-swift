//
//  ImagePickerExampleView.swift
//  ImagePickerExample
//
//  Created by Manish Solanki on 13/07/23.
//

import SwiftUI
import PhotosUI

struct ImagePickerExampleView: View {
    @State var showPicker: Bool = false
    
    var body: some View {
        VStack {
            Button("Pick", action: {
                showPicker.toggle()
            })
            .sheet(isPresented: $showPicker) {
                MainImagePickerView()
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
