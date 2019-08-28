//
//  ViewController.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/23/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit
import Mortar
import Koloda
import MarqueeLabel
import NVActivityIndicatorView
import WCLShineButton


class ViewController: UIViewController {
    
    static let imageCache = NSCache<AnyObject, AnyObject>()
    
    // Stores weak references to overlays for customization
    let weakRefArray = NSPointerArray.weakObjects()

    let shadowView: ShadowView = ShadowView()
    let mainView: RoundedView = RoundedView()
    let opaqueWrapper: UIView = UIView.m_create { $0.backgroundColor = .clear }
    let containerView: UIView = UIView.m_create { $0.alpha = 0 }
    let kolodaView: KolodaView = KolodaView.m_create {
        $0.layer.shadowRadius = 8
        $0.layer.shadowOpacity = 0.70
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

    var activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 80, height: 80), type: .ballScaleMultiple, color: Color.PurpleDark, padding: 0)
    var fadingTitle = MarqueeLabel.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30), rate: 24.0, fadeLength: 10.0)
    var likeButton = WCLShineButton()
    var photoURLObjects: [PhotoSource] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        kolodaView.delegate = self
        kolodaView.dataSource = self
        setUpViews()
        fetchData()
        self.title = "Recent Photos"
    }
    
    func setUpViews() {
        
        // addLikeButton() is last because its constraints
        // depend on the pre-existing constraints of OpaqueView
        setUpNavBar()
        addIndicatorView()
        addSubviews()
        addGradient()
        addTitleLabel()
        setUpAutoLayout()
        addLikeButton()
    }
    
    // MARK: -- API Call
    func fetchData() {
        DispatchQueue.global(qos: .background).async {
            NetworkManager.shared.fetchRecentPhotos(completion: { (urlObjects, error, errorMessage) in
                
                
                guard error == nil, errorMessage == nil else {
                    // Must check errorMessage because sometimes the closure will return an error value with a nil errorMessage
                    if errorMessage == nil {
                        self.presentAlert(ErrorMessage.NilData.rawValue)
                        return
                    }
                    self.presentAlert(errorMessage!)
                    return
                }
                self.photoURLObjects = urlObjects
                self.updateUIAfterDataRetrieval()
            })
        }
    }
}








