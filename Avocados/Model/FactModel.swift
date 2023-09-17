//
//  FactModel.swift
//  Avocados
//
//  Created by Zeki Baklan on 17.09.2023.
//

import Foundation
//    MARK: - FACT MODEL

struct Fact : Identifiable {
    var id = UUID()
    var image : String
    var content : String
     
}
