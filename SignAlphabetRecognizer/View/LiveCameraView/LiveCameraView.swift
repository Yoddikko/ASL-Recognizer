//
//  LiveCameraView.swift
//  SignAlphabetRecognizer
//
//  Created by Alessio Iodice on 04/04/22.
//

import SwiftUI

struct LiveCameraView: View {
    @StateObject private var model = ContentViewModel()
    
    @EnvironmentObject var classificationViewModel: ClassificationViewModel
    
    var truevar = true
    var body: some View {
        
        VStack {
            ZStack {
                FrameView(image: model.frame)
                    .ignoresSafeArea()
                ErrorView(error: model.error)
            }
            VStack {
                ZStack {
                    Button(classificationViewModel.onLoop == false ? "Start live classifying!" : "Stop live classifying!") {if model.frame != nil {classificationViewModel.classifyImage(tmpImage: UIImage(cgImage: model.frame!))
                        classificationViewModel.onLoop.toggle()
                        classificationViewModel.callFunc()
                        classificationViewModel.text = ""
                    }
                        
                    }
                    .onAppear{
                        classificationViewModel.classificationLabel = ""
                        classificationViewModel.name = ""
                    }
                    .onDisappear{
                        classificationViewModel.onLoop = false
                    }
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.2)
                        .frame(width: 200, height: 30)
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
                        
                        if classificationViewModel.name.count > 10 && classificationViewModel.onLoop  {
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
                if classificationViewModel.onLoop {
                    VStack {
                        Text("Output: \(classificationViewModel.text)")
                        
                    }
                }
                
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}

//struct LiveCameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCameraView()
//    }
//}
