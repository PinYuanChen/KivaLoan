//
//  Loan.swift
//  KivaLoan
//
//  Created by 陳品元 on 2020/4/7.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Foundation

//struct Loan {
//
//   var name: String = ""
//   var country: String = ""
//   var use: String = ""
//   var amount: Int = 0
//}


struct Loan: Codable {
 
    var name: String = ""
    var town: String = ""
    var use: String = ""
    var amount: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case name
        case town = "location"
        case use
        case amount = "loan_amount"
    }
    
    enum LocationKeys: String, CodingKey {
        case town
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        
        let location = try values.nestedContainer(keyedBy: LocationKeys.self, forKey: .town)
        town = try location.decode(String.self, forKey: .town)
        
        use = try values.decode(String.self, forKey: .use)
        amount = try values.decode(Int.self, forKey: .amount)
        
    }
    
}

struct LoanDataStore: Codable {
    var loans: [Loan]
}

