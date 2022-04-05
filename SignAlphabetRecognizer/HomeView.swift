//
//  HomeView.swift
//  SignAlphabetRecognizer
//
//  Created by Alessio Iodice on 04/04/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
        VStack {
            HStack {
//                Spacer()
            Text("ASL recognizer")
                .font(.largeTitle)
                .padding()
                Spacer()
//                Image(systemName: "info.circle.fill")
//                    .padding()
//                    .foregroundColor(.gray)
//                    .frame(width: 30, height: 30)
            }
            Text("A simple app that analyses and recognises the alphabet in american sign language using machine learning")
                .font(.headline)
                .padding()
                .multilineTextAlignment(.leading)
                .background(
                RoundedRectangle(cornerRadius: 10)
                    .opacity(0.2)
                    .foregroundColor(.mint)
                )
            Spacer()
            Text("Choose an input method")
                .foregroundColor(.gray)
                .padding(.top)
            HStack {
                NavigationLink(destination: LiveCameraView(), label: {
                    
                    
                    Image(systemName: "video.fill")
                        .resizable()
                        .frame(width: 100, height: 75)
                        .foregroundColor(.mint)
                        .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/5)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                        )
                        .padding(.horizontal)


                } )
                
                NavigationLink(destination: ImagePickerView(), label: {
                    
                    
                    Image(systemName: "camera.on.rectangle.fill")
                        .resizable()
                        .frame(width: 100, height: 75)
                        .foregroundColor(.mint)
                        .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/5)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gray)
                                .opacity(0.2)
                        )
                        .padding(.horizontal)


                } )

//                Image(systemName: "")
//                    .resizable()
//                    .frame(width: 100, height: 75)
//                    .foregroundColor(.blue)
//                    .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/5)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .foregroundColor(.gray)
//                            .opacity(0.2)
//                    )
//                    .padding(.horizontal)
            }
            Spacer()
            Link(destination: URL(string:"https://github.com/Yoddikko/ASL-Recognizer")!) {

            Image("github-logo")
                .resizable()
                .frame(width: 100, height: 100)
                .background(
                RoundedRectangle(cornerRadius: 15)
                    .opacity(0.3)
                    .foregroundColor(.white)
                    .frame(width: 120, height: 120)
                )
            }
        }
    }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
