//
//  Model.swift
//  Locus_Assignment
//
//  Created by PRITESH SINGH on 14/09/22.
//

import Foundation
import UIKit

struct Model{
    
    var type: String?
    var id: String?
    var title: String?
    var options: [String]?
    var image: UIImage? = nil
}

struct Options{
    
    var title: String?
    var isSelected: Bool = false
    
}
