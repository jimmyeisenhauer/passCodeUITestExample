//
//  DetailViewController.swift
//  EisenhauerPassCodeUITestExample
//
//  Created by James Eisenhauer on 5/7/19.
//  Copyright © 2019 James Eisenhauer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never

        view.backgroundColor = .black
        
        let label: UILabel = {
            
            let label = UILabel()
            label.text = "🏁 Secure Area!!! 🏴‍☠️"
            label.textColor = .white
            label.font = label.font.withSize(35)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }
}

