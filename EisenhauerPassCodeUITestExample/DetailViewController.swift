//
//  DetailViewController.swift
//  EisenhauerPassCodeUITestExample
//
//  Created by James Eisenhauer on 5/7/19.
//  Copyright © 2019 James Eisenhauer. All rights reserved.
//

import LocalAuthentication
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        
        if let label = detailDescriptionLabel {
            label.text = "Success!"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // request authentication
        LAContext().evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "test") { success, error in
            if success {
                print("success!!")
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }
}

