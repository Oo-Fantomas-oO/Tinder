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

struct CardViewModel {
    let imageNames: [String]
    let attributedString: NSAttributedString
    let textAlignment: NSTextAlignment
}
