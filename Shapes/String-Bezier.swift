//
//  String.swift
//
//
//  Created by Mohammad Ali Jafarian on 10/6/17.
//  Modified by Mike Griebling on 22 Mar 2023 to support MacOS
//

#if os(iOS)
import UIKit
#else
import Cocoa
typealias UIFont = NSFont
typealias UIBezierPath = NSBezierPath
#endif

extension String {
    func bezierPath(withFont font: UIFont) -> UIBezierPath {
        // create UIBezierPath
        let bezier = UIBezierPath(cgPath: cgPath(withFont: font))
        return bezier
    }
    
    func cgPath(withFont font: UIFont) -> CGPath {
        // create a container CGMutablePath for letter paths
        let letters = CGMutablePath()
        // create a NSAttributedString from self
        let attrString = NSAttributedString(string: self, attributes: [NSAttributedString.Key.font: font])
        let line = CTLineCreateWithAttributedString(attrString)
        // get CTRuns from line
        guard let runs = CTLineGetGlyphRuns(line) as? [CTRun] else { return letters }
        for run in runs {
            // create CTFont with UIFont
            guard let attributes = CTRunGetAttributes(run) as? Dictionary<String, AnyObject> else { continue }  //CTFontCreateWithName(font.fontName as CFString, font.pointSize, nil)
            let ctFont = attributes[kCTFontAttributeName as String] as! CTFont
            // number of gylph available
            let glyphCount = CTRunGetGlyphCount(run)
            for i in 0..<glyphCount {
                // take one glyph from run
                let range = CFRangeMake(i, 1)
                // create array to hold glyphs, this should have array with one item
                var glyph = CGGlyph()
                // create position holder
                var position = CGPoint()
                // get glyph
                CTRunGetGlyphs(run, range, &glyph)
                // glyph postion
                CTRunGetPositions(run, range, &position)
                // append glyph path to letters
                if let letter = CTFontCreatePathForGlyph(ctFont, glyph, nil) {
                    letters.addPath(letter, transform: CGAffineTransform(translationX: position.x, y: position.y))
                }
            }
        }
        // following lines normalize path. this path is created with textMatrix so it should first be normalized to nomral matrix
        let lettersRotated = CGMutablePath()
        lettersRotated.addPath(letters, transform: CGAffineTransform(scaleX: 1, y: -1))
        let lettersMoved = CGMutablePath()
        lettersMoved.addPath(lettersRotated, transform: CGAffineTransform(translationX: 0, y: lettersRotated.boundingBoxOfPath.size.height))
        return lettersMoved
    }
}
