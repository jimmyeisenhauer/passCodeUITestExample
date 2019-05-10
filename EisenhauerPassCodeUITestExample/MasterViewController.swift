//
//  MasterViewController.swift
//  EisenhauerPassCodeUITestExample
//
//  Created by James Eisenhauer on 5/7/19.
//  Copyright © 2019 James Eisenhauer. All rights reserved.
//

import LocalAuthentication
import UIKit

class MasterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Passcode Test"

        view.backgroundColor = .black
        
        let button: UIButton = {
            let button = UIButton()
            button.setTitle("Enter Secure View", for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 10
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(self.pressButton(_:)), for: .touchUpInside)
            return button
        }()
        
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
            ])
    }

    @objc
    func pressButton(_ sender: UIButton) {
        let context = LAContext()
        context.evaluatePolicy(
            LAPolicy.deviceOwnerAuthentication,
            localizedReason: "Authentication is required for access",
            reply: {(success, error) in
                if success {
                    DispatchQueue.main.async { [unowned self] in
                        let detailVC = DetailViewController()
                        self.navigationController?.pushViewController(detailVC, animated: false)
                    }
                }
        })
    }
}

