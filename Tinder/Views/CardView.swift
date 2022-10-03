//
//  CardView.swift
//  Tinder
//
//  Created by Fantomas on 14.09.2022.
//

import UIKit

class CardView: UIView {
    
    var cardViewModel: CardViewModel! {
        didSet{
            imageView.image                 = UIImage(named: cardViewModel.imageName)
            informationLabel.attributedText = cardViewModel.attributedString
            informationLabel.textAlignment  = cardViewModel.textAlignment
        }
    }

    fileprivate let imageView           = UIImageView(image: UIImage(named: LadyImages.ladyOne))
    fileprivate let informationLabel    = UILabel()
    
    //Configurations
    fileprivate let threshold: CGFloat = 100
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius  = 10
        clipsToBounds       = true
        
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.fillSuperview()
        
        addSubview(informationLabel)
        informationLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,
                                padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        informationLabel.text = "TEXT"
        informationLabel.textColor = .white
        informationLabel.font = UIFont.systemFont(ofSize: 34, weight: .heavy)
        informationLabel.numberOfLines = 0
        
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        addGestureRecognizer(panGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc fileprivate func handlePan(gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .began:
            superview?.subviews.forEach({ subview in
                subview.layer.removeAllAnimations()
            })
        case .changed:
            handleChanged(gesture)
        case .ended:
            handleEnded(gesture)
        default:
            ()
        }
    }
    
    fileprivate func handleChanged(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: nil)
        let degrees: CGFloat = translation.x / 20
        let angel = degrees * .pi / 180
        let rotationalTransformation = CGAffineTransform(rotationAngle: angel)
        self.transform = rotationalTransformation.translatedBy(x: translation.x,
                                                               y: translation.y)
    }
    
    fileprivate func handleEnded(_ gesture: UIPanGestureRecognizer) {
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut) {
            if shouldDismissCard {
                self.frame = CGRect(x: 600 * translationDirection, y: 0, width: self.frame.width, height: self.frame.height)
            } else {
                self.transform = .identity
            }
        } completion: { (_) in
            self.transform = .identity
            if shouldDismissCard {
                self.removeFromSuperview()              
            }
//            self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width,
//                                height: self.superview!.frame.height)
        }
    }
}

