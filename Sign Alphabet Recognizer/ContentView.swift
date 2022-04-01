//
//  ContentView.swift
//  Sign Alphabet Recognizer
//
//  Created by Alessio Iodice on 30/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        Text("Hello, world!")
            .padding()
        }
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
