//
//  ContentView.swift
//  TestShapes
//
//  Created by Mike Griebling on 22.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world! ℃¼³π±∑√ƛ×∛")
            TextShape(string: "Hello, symbols: ℃¼³π±∑√ƛ×∛", font: .systemFont(ofSize: 12))
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
