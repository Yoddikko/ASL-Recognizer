//
//  ContentView.swift
//  SUImagePickerView
//
//  Created by Karthick Selvaraj on 02/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//
import SwiftUI
import Vision
import AVFoundation
import UIKit
import CoreImage


struct ImagePickerView: View {
    
    @EnvironmentObject var classificationViewModel: ClassificationViewModel
    
    var localClassificationLabel = ""
    
    //    @State private var classificationLabel: String = ""
    //    @State private var name: String = ""
    let mlmodel = SignAlphabet()
    
    @State private var image: UIImage? = UIImage(named: "prova")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    private var handPoseRequest = VNDetectHumanHandPoseRequest()
    //    let uiframe =
    var body: some View {
        VStack {
            ZStack {
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
                RoundedRectangle(cornerRadius: 15).foregroundColor(.gray).opacity(0.2).padding().frame(width: 200, height: 70)
            }
            
            Image(uiImage: image!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            ZStack {
                Button("Classify!") { classificationViewModel.classifyImage(tmpImage: image!)
                    print(classificationViewModel.classificationLabel)
                }
                .onAppear{
                    classificationViewModel.classificationLabel = ""
                    classificationViewModel.name = ""
                }
                RoundedRectangle(cornerRadius: 15).foregroundColor(.gray).opacity(0.2).padding().frame(width: 120, height: 70)
                
            }
            HStack {
                ZStack {
                    if classificationViewModel.name != "" && classificationViewModel.name.count < 10 {
                        Text(classificationViewModel.name)
                        RoundedRectangle(cornerRadius: 10)
                            .padding()
                            .foregroundColor(.gray)
                            .opacity(0.2)
                            .frame(width: 100, height: 100)
                        
                    }
                    
                    if classificationViewModel.name.count > 10  {
                        Text(classificationViewModel.name)
                        RoundedRectangle(cornerRadius: 10)
                            .padding()
                            .foregroundColor(.gray)
                            .opacity(0.2)
                            .frame(width: 300, height: 100)
                        
                    }
                    
                }
                
                ZStack {
                    if classificationViewModel.classificationLabel != "" {
                        
                        Text(classificationViewModel.classificationLabel)
                        RoundedRectangle(cornerRadius: 10)
                            .padding()
                            .foregroundColor(.gray)
                            .opacity(0.2)
                            .frame(width: 100, height: 100)
                        
                    }
                }
                
            }
            .padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
