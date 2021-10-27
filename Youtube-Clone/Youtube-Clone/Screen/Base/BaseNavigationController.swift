//
//  BaseNavigationController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/27.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    private lazy var logoItem = UIBarButtonItem().then {
        let imageView = UIImageView(image: Const.Image.premium_logo)
        imageView.frame = CGRect(x: 0, y: 0, width: 96, height: 20)
        $0.customView = imageView
    }
    
    private lazy var profileItem = UIBarButtonItem().then {
        let imageView = UIImageView(image: UIImage(named: "wesoptiOSPartProfile")!)
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        $0.customView = imageView
    }
    private lazy var searchItem = UIBarButtonItem().then {
        $0.customView = makeBarButtonItem(image: Const.Image.search, tag: 1)
    }
    private lazy var notificationItem = UIBarButtonItem().then {
        $0.customView = makeBarButtonItem(image: Const.Image.notification, tag: 2)
    }
    private lazy var sharingItem = UIBarButtonItem().then {
        $0.customView = makeBarButtonItem(image: Const.Image.sharing, tag: 3)
    }
    
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        initNavigationItem(navigationItem: rootViewController.navigationItem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarAppearance()
    }
    
    private func setNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        
        self.navigationBar.tintColor = Const.Color.black
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func initNavigationItem(navigationItem: UINavigationItem?) {
        let spacing = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacing.width = 12
        navigationItem?.rightBarButtonItems = [profileItem, spacing, searchItem, spacing, notificationItem, spacing, sharingItem]
        navigationItem?.leftBarButtonItem = logoItem
    }
    
    private func makeBarButtonItem(image: UIImage, tag: Int) -> UIButton {
        let button = UIButton(type: .custom)
        button.tag = tag
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.addTarget(self, action: #selector(buttonDidTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc
    private func buttonDidTapped(_ sender: UIButton) {
        print("click")
    }

}
