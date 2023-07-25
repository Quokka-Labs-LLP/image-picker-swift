//
//  MainImagePickerView.swift
//  ImagePickerExample
//
//  Created by Manish Solanki on 21/07/23.
//

import SwiftUI
import PhotosUI


/// ** Responsiblities
/// - Show Button to open camera.
/// - Show Selected images in scrollable way below the camera button (If selected images option is selected).
/// - Show all images in scrollable format below the camera button (if All Photos Option is selected).
/// - If user have not provided permission for photos access, Show button to request photos access.
struct MainImagePickerView: View {
    @State var showPicker: Bool = false
    
    var body: some View {
        ScrollView(content: {
            HStack(content: {
                Button("Open Camera") {
                    print("open camera")
                }
                .buttonStyle(.bordered)
                .frame(width: UIScreen.main.bounds.width / 2, height: 44, alignment: .center)
                
                Button("Open Photos") {
                    let readWriteStatus = PHPhotoLibrary.authorizationStatus(for: .readWrite)
                    
                    switch readWriteStatus {
                    case .notDetermined:
                        requestAccess()
                    case .restricted:
                        // Divert to settings app.
                        requestAccess()
                    case .denied:
                        // divert to settings app.
                        requestAccess()
                    case .authorized:
                        showPicker = true
                    case .limited:
                        printAuthError()
                    @unknown default:
                        fatalError()
                    }
                    
                    
                }
                .buttonStyle(.bordered)
                .frame(width: UIScreen.main.bounds.width / 2, height: 44, alignment: .center)
                .sheet(isPresented: $showPicker) {
                    QLPhotosPicker()
                }
            })
        })
    }
    
    func printAuthError() {
        print("Auth error")
    }
    
    func requestAccess() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            switch status {
            case .notDetermined:
                printAuthError()
            case .restricted:
                printAuthError()
            case .denied:
                printAuthError()
            case .authorized:
                print("Success")
            case .limited:
                print("Success")
            @unknown default:
                fatalError()
            }
        }
    }
}

struct MainImagePickerView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainImagePickerView()
    }
}
