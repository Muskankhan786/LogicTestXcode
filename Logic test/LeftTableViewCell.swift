//
//  leftTableViewCell.swift
//  Logic test
//
//  Created by Muskan on 13/02/23.
//

import UIKit

class LeftTableViewCell: UITableViewCell {
    
    var numbers = 0
    var maxValue = 10
    var minValue = 0
    
    @IBOutlet weak var leftTableViewLbl: UILabel!
    @IBOutlet weak var leftValueLbl: UILabel!

    
    @IBAction func leftPlusButton(_ sender: Any) {
        if numbers < maxValue {
             self.numbers += 1
             leftValueLbl.text = String(numbers)
         }
         else  {
             print(numbers)
         }
    }
    
    @IBAction func leftMinusBtn(_ sender: Any) {
        if numbers > minValue {
            numbers -= 1
            leftValueLbl.text = String(numbers)
        }
        else {
            print(numbers)
        }
    }
    
}
