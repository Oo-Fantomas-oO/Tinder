//
//  ViewController.swift
//  Tinder
//
//  Created by Fantomas on 08.09.2022.
//

import UIKit

class HomeController: UIViewController {
    
    let topStackView    = TopNavigationStackView()
    let cardsDeckView   = UIView()
    let bottomStackView = HomeBottomControlsStackView()

    let cardViewModels: [CardViewModel] = {
        let producers = [
            User(name: "Kelly", age: 23, profession: "Music DJ",
                 imageNames: [LadyImages.Kelly.kelly1, LadyImages.Kelly.kelly2, LadyImages.Kelly.kelly3]),
            Advertiser(title: "Slide Out Menu", brandName: "Gold Loaf", posterPhotoName: LadyImages.slideOUut),
            User(name: "Jane", age: 18, profession: "Teacher",
                 imageNames: [LadyImages.Jane.jane1, LadyImages.Jane.jane2, LadyImages.Jane.jane3])
        ] as! [ProducedCardViewModel]
        
        let viewModel = producers.map({ return $0.toCardViewModel()})
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupDummyCards()
    }
    
    fileprivate func setupDummyCards() {
        cardViewModels.forEach { cardVM in
            let cardView = CardView(frame: .zero)
            cardView.cardViewModel = cardVM
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }

    // MARK: - Fileprivate
    
    fileprivate func setupLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, bottomStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        overallStackView.bringSubviewToFront(cardsDeckView)
    }

}

