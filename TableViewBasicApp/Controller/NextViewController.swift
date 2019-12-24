//
//  NextViewController.swift
//  TableViewBasicApp
//
//  Created by Yudai Asano on 2019/12/24.
//  Copyright © 2019 Yudai Asano. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var todoLabel: UILabel!
    var todoString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoLabel.text = todoString
    }
}
