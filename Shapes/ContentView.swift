//
//  ContentView.swift
//  TestShapes
//
//  Created by Mike Griebling on 22.03.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Text Symbols:  ℃¼³π±∑√ƛ×∛↑+−∡÷⊕⌫⅞⅟₂∫∰")
                .font(.system(size: 24, weight: .light))
            TextShape(string: "Graphic Symbols: ℃¼³π±∑√ƛ×∛↑+−∡÷⊕⌫⅞⅟₂∫∰",
                      font: .systemFont(ofSize: 24, weight: .regular))
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
