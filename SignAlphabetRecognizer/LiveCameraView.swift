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
                ErrorView(error: model.error)
            }
            VStack {
                ZStack {
                    Button("Classify!") {if model.frame != nil {classificationViewModel.classifyImage(tmpImage: UIImage(cgImage: model.frame!))}}
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
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
}

//struct LiveCameraView_Previews: PreviewProvider {
//    static var previews: some View {
//        LiveCameraView()
//    }
//}
