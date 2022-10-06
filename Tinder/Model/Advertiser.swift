//
//  Advertiser.swift
//  Tinder
//
//  Created by Fantomas on 02.10.2022.
//

import UIKit

struct Advertiser: ProducedCardViewModel {  
    let title: String
    let brandName: String
    let posterPhotoName: String
    
    func toCardViewModel() -> CardViewModel {
        let attributedString = NSMutableAttributedString(string: title, attributes: [.font : UIFont.systemFont(ofSize: 34, weight: .heavy)])
        
        attributedString.append(NSAttributedString(string: "\n" + brandName,
                                                   attributes: [.font : UIFont.systemFont(ofSize: 24, weight: .bold)]))
        
        return CardViewModel(imageNames: [posterPhotoName],
                             attributedString: attributedString, textAlignment: .center)
    }
}
