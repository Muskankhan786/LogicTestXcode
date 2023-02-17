//
//  Model.swift
//  Logic test
//
//  Created by Muskan on 16/02/23.
//

import Foundation
class Model {
    
    var leftTableArr = ["A","B","C","D","E","F","G","H","I","J"]
    var rightTableArr = ["F","G","H","I","J"]
    var multipleSelection = [String]()
    
}

class DataModel {
    let title : String?
    let value : Int?
    
    init(title: String?, value: Int?) {
        self.title = title
        self.value = value
    }
}
