//
//  ContentView.swift
//  SignAlphabetRecognizer
//
//  Created by Alessio Iodice on 30/03/22.
//

import SwiftUI
import CoreML

struct ContentView: View {
    let model = SignAlphabet()
    @State private var classificationLabel: String = ""
    
    var body: some View {
//        Text(classificationLabel)
        ImagePickerView()
    }
//    private func classifyImage() {
//        let currentImageName =
//
//        // 2
//        guard let image = UIImage(named: currentImageName),
//                    let resizedImage = image.resizeImageTo(size: CGSize(width: 224, height: 224)),
//                    let buffer = resizedImage.convertToBuffer() else {
//            return
//        }
//
//        // 3
//    let output = try? model.prediction(image: buffer)
//    }
    
}

struct ContentView_Previews1: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
