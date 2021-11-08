//
//  CardView.swift
//  JobSearch
//
//

import Foundation
import UIKit

class CardView: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var servingLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    
    @IBOutlet var bgImgView: UIImageView!
    
    
    func setUpCardView() {
        
        self.backgroundColor = .white

        self.layer.cornerRadius = 10.0

        self.layer.shadowColor = UIColor.gray.cgColor

        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)

        self.layer.shadowRadius = 6.0

        self.layer.shadowOpacity = 0.7
    }

}
