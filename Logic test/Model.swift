//
//  Model.swift
//  Logic test
//
//  Created by Muskan on 16/02/23.
//

import Foundation

class DataModel {
    
    let title : String?
    var value : Int?
    var isSelected: Bool = false
    
    init(title: String?, value: Int?) {
        self.title = title
        self.value = value ?? 0
    }
    
    var getStringValue : String {
        return "\(value!)"
    }

}
