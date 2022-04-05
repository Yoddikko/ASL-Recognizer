//
//  SignAlphabetRecognizerApp.swift
//  SignAlphabetRecognizer
//
//  Created by Alessio Iodice on 30/03/22.
//

import SwiftUI

@main
struct SignAlphabetRecognizerApp: App {
    var classificationViewModel = ClassificationViewModel()
    var body: some Scene {
        WindowGroup {
//            ImagePickerView()
            HomeView()
                .accentColor(.mint)
                .environmentObject(classificationViewModel)

        }

    }
}
