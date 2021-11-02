//
//  ViewController.swift
//  JobSearch
//
//  Created by V, Kalaivani V. (623-Extern) on 27/10/21.
//

import UIKit

class ViewController: UIViewController {

    let jobML = JobSearchMiddleLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }

    func fetchData() {
        
        jobML.getJob(parameters: ["name": "kal"])
    }

}

