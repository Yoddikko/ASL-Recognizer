//
//  ClassificationViewModel.swift
//  SignAlphabetRecognizer
//
//  Created by Alessio Iodice on 04/04/22.
//

import Foundation
import UIKit
import CoreML
import Vision
import SwiftUI


class ClassificationViewModel: ObservableObject {
    
    @StateObject private var model = ContentViewModel()
    
    
    @Published var classificationLabel: String = ""
    @Published var name: String = ""
    let mlmodel = SignAlphabet()
    
    @State private var image: UIImage? = UIImage(named: "prova")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    private var handPoseRequest = VNDetectHumanHandPoseRequest()

    func classifyImage(tmpImage: UIImage) {
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
            let handPosePrediction = try mlmodel.prediction(poses: keypointsMultiArray)
            let confidence = handPosePrediction.labelProbabilities[handPosePrediction.label]!
            prediction = handPosePrediction.label
            var shortConfidence = confidence.format(f: ".3")
            classificationLabel = "\(shortConfidence)"
            name = "\(prediction)"
            print(prediction)
            print(confidence)
        } catch {
            print("Error")
        }
    }
}


