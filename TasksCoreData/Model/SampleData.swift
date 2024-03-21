//
//  SampleData.swift
//  TasksCoreData
//
//  Created by Joshua Rück on 21.03.24.
//

import Foundation

class SampleData {
    let names = ["Leo", "Okan", "Anna", "Lukas", "Josh", "Gordon"]
    let pictures = ["pp_grey", "pp_green", "pp_pink", "pp_blue"]
    
    var randomName: String {
        return names.randomElement()!
    }
    
    var randomPic: String {
        return pictures.randomElement()!
    }
}
