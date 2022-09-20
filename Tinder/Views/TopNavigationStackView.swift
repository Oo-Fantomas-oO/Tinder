//
//  TopNavigationStackView.swift
//  Tinder
//
//  Created by Fantomas on 09.09.2022.
//

import UIKit

class TopNavigationStackView: UIStackView {

    let settingsButton  = UIButton(type: .system)
    let messageButton   = UIButton(type: .system)
    let fireImageView   = UIImageView(image: Images.appIcon)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 80).isActive = true
        fireImageView.contentMode = .scaleAspectFit
        
        settingsButton.setImage(Images.topLeft?.withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(Images.topRight?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        [settingsButton, UIView(), fireImageView, UIView(), messageButton].forEach { (v) in
            addArrangedSubview(v)
        }
        
        distribution = .equalCentering
        
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
