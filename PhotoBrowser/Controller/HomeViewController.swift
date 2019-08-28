//
//  HomeViewController.swift
//  PhotoBrowser
//
//  Created by ashley canty on 8/27/19.
//  Copyright © 2019 ashley canty. All rights reserved.
//

import UIKit
import Mortar


class HomeViewController: UIViewController {

    let startButton = UIButton(type: .system)
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        addGradient()
        setUpImageLogo()
        setUpStartButton()
        setUpAutoLayout()
    }
    
    func setUpImageLogo() {
        imageView.image = UIImage(named: "browserLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        view.addSubview(imageView)
    }
    
    func setUpStartButton() {
        view.addSubview(startButton)
        startButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        startButton.clipsToBounds = true
        startButton.layer.cornerRadius = 4
        startButton.backgroundColor = .white
        startButton.setTitle("Tap to start", for: .normal)
        startButton.titleLabel?.textColor = Color.PurpleMed
        startButton.tintColor = Color.PurpleMed
        startButton.titleLabel?.font = UIFont.init(name: Font.HelveticaNueueMedium.rawValue, size: 20)
        startButton.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
    }
    
    func setUpAutoLayout() {
        var group = [
            imageView.m_centerX |=| view,
            imageView.m_top |=| (view.frame.height * 1/8),
            startButton.m_bottom |=| view.m_bottom - 60,
            startButton.m_height |=| 60,
            startButton.m_width |=| (view.frame.width * 4/5),
            startButton.m_centerX |=| view.m_centerX
        ]
        
        if DeviceSize.iPhoneScreenSizes() == .iPad {
            group.append(contentsOf: [imageView.m_width |=| 400, imageView.m_height |=| 400])
        } else {
            group.append(contentsOf: [imageView.m_width |=| 300,imageView.m_height |=| 300])
        }
        
        group.activate()
    }
    
    @objc func startButtonDidTap() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
