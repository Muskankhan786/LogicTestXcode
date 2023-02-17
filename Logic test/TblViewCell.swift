//
//  rightTableViewCell.swift
//  Logic test
//
//  Created by Muskan on 13/02/23.
//

import UIKit

class TblViewCell: UITableViewCell {
    
    var numbers = 0
    var maxValue = 10
    var minValue = 0
   
    
   
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblValue: UILabel!
    
    
    @IBAction func btnPlus(_ sender: Any) {
        if numbers < maxValue {
            self.numbers += 1
            lblValue.text = String(numbers)
        } else  {
            print(numbers)
            
        }
    }
    @IBAction func btnMinus(_ sender: Any) {
        if numbers > minValue {
            self.numbers -= 1
            lblValue.text = String(numbers)
        } else  {
            print(numbers)
            
        }
        
    }
}
    
//
//
//
//
//if numbers < maxValue {
//    self.numbers += 1
//    lblSecond.text = String(numbers)
//} else  {
//    print(numbers)
