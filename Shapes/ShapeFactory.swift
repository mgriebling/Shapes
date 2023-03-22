//
//  ShapeFactory.swift
//  TestShapes
//
//  Created by Mike Griebling on 22.03.2023.
//

import SwiftUI

struct TextShape: Shape {
    var string: String
    var font = UIFont.systemFont(ofSize: 20, weight: .light)

    func path(in rect: CGRect) -> Path {
        let path = Path(string.cgPath(withFont: font))
        
        // fit path into the given rectangle
        // let bounds = path.boundingRect
        let multiplier = 1.5 // min(rect.width/bounds.width, rect.height/bounds.height)
        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
        return path.applying(transform)
    }
}
