//
//  ContentView.swift
//  SUImagePickerView
//
//  Created by Karthick Selvaraj on 02/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//
import SwiftUI
import Vision


struct ImagePickerView: View {
    @State private var classificationLabel: String = ""
    @State private var name: String = ""
    let model = SignAlphabet()
    
    
    @State private var image: UIImage? = UIImage(named: "prova")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    private var handPoseRequest = VNDetectHumanHandPoseRequest()
    
    var body: some View {
        VStack {
            VStack {
                Button("Select a picutre") {self.shouldPresentActionScheet = true}
                    .padding()
                    .sheet(isPresented: $shouldPresentImagePicker) {
                        SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                    }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                        ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to choose a picture"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = true
                        }), ActionSheet.Button.default(Text("Photo Library"), action: {
                            self.shouldPresentImagePicker = true
                            self.shouldPresentCamera = false
                        }), ActionSheet.Button.cancel()])
                    }
                
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                Spacer()
                Button("Classify me") { classifyImage(tmpImage: image!) }
                HStack {
                    Text("\(name)")
                    Text("\(classificationLabel)")
                }
                Spacer()
            }
        }
    }
    private func classifyImage(tmpImage: UIImage) {
        let image = tmpImage
        let resizedImage = image.resizeImageTo(size: CGSize(width: 224, height: 224))
        let buffer = resizedImage?.convertToBuffer()
        if buffer == nil {
            print("Buffer is empty")
            return
        }
        //How many hands to detect
        handPoseRequest.maximumHandCount = 1
        guard let imageData = image.jpegData(compressionQuality: 0) else {
            return
        }
        let handler = VNImageRequestHandler(data: imageData, options: [:])
        do {
            // Perform VNDetectHumanHandPoseRequest
            try handler.perform([handPoseRequest])
            // Continue only when a hand was detected in the frame.
            // Since we set the maximumHandCount property of the request to 1, there will be at most one observation.
            var prediction: String = ""
            let observation = handPoseRequest.results?.first
            if observation == nil {name = "The slected picture is not valid"
                classificationLabel = ""
                
            }
            guard let keypointsMultiArray = try? observation?.keypointsMultiArray() else {
                name = "The slected picture is not valid"
                classificationLabel =  ""
                return }
            let handPosePrediction = try model.prediction(poses: keypointsMultiArray)
            let confidence = handPosePrediction.labelProbabilities[handPosePrediction.label]!
            prediction = handPosePrediction.label
            classificationLabel = "\(confidence)"
            name = "\(prediction)"
            print(confidence)
        } catch {
            print("Error")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
