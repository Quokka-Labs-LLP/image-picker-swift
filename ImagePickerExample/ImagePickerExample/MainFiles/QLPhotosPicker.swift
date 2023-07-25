//
//  QLPhotosPicker.swift
//  ImagePickerExample
//
//  Created by Manish Solanki on 25/07/23.
//

import SwiftUI
import Photos
import PhotosUI

/// ** Responsiblities
/// - Show `PHPickerViewController` to be able to be used in `SwiftUI`.
/// - All data transfer fro picked photos.

struct QLPhotosPicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = PHPickerViewController
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var pickerConfig = PHPickerConfiguration(photoLibrary: .shared())
        pickerConfig.filter = .images
        
        let phPickerInstance = PHPickerViewController(configuration: pickerConfig)
        phPickerInstance.delegate = context.coordinator
        
        return phPickerInstance
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        // Add update methods here.
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
     }
    
    class Coordinator: PHPickerViewControllerDelegate {
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            if results.isEmpty {
                picker.dismiss(animated: true)
            }
            print(results)
        }
    }
}
