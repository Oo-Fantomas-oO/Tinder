//
//  CardViewModel.swift
//  Tinder
//
//  Created by Fantomas on 29.09.2022.
//

import UIKit

protocol ProducedCardViewModel {
    func toCardViewModel() -> CardViewModel 
}

class CardViewModel {
    let imageNames: [String]
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
    
    fileprivate var imageIndex = 0 {
        didSet {
            let imageName = imageNames[imageIndex]
            let image = UIImage(named: imageName)
            imageIndexObserver?(imageIndex, image)
        }
    }
    
    init(imageNames: [String], attributedString: NSAttributedString, textAlignment: NSTextAlignment) {
        self.imageNames         = imageNames
        self.attributedString   = attributedString
        self.textAlignment      = textAlignment
    }
    
    // Reactive Programming
    var imageIndexObserver:  ((Int, UIImage?) -> ())?
    
    func advanceToNextPhoto() {
        imageIndex = min(imageIndex + 1, imageNames.count - 1)
    }
    
    func goToPreviousPhoto() {
        imageIndex = max(0, imageIndex - 1)
    }
}
