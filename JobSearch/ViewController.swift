//
//  ViewController.swift
//  JobSearch
//
//  Created by V, Kalaivani V. (623-Extern) on 27/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        // Do any additional setup after loading the view.
    }

    func fetchData() {
         NetworkManager().getWeather(onCompletion: { result, error in
            print("Result \(result)")
        })
    }

}

