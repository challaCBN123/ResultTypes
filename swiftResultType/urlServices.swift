//
//  urlServices.swift
//  swiftResultType
//
//  Created by Bhargava on 31/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
struct DataUrl:Decodable{
    var id: Int
    var name : String
    var username : String
    var email : String
    var phone : String
    var website: String
    var address : [address]
    var company : [company]
    init(jsonObjects:[String:Any]) {
        self.id = jsonObjects["id"] as? Int ?? 0
        self.name = jsonObjects["name"] as? String ?? ""
        self.username = jsonObjects["username"] as? String ?? ""
        self.email = jsonObjects["email"] as? String ?? ""
        self.phone = jsonObjects["phone"] as? String ?? ""
        self.website = jsonObjects["website"] as? String ?? ""
        self.address = jsonObjects["address"] as! [address]
        self.company = jsonObjects["company"] as! [company]
    }
}
struct address :Decodable{
    let street:String
    let suite:String
    let city:String
    let zipcode:String
    let geo : [geo]
}
struct geo:Decodable{
    let lat:String
    let lng:String
}
struct company: Decodable{
    let name : String
    let catchPhrase : String
    let bs : String
}

class datasURl : Decodable{
    let id: Int?
       let name : String?
       let username : String?
       let email : String?
       let phone : String?
       let website: String?
    let address : [addresses]
    let company : [comapnies]
}
class addresses : Decodable{
    let street:String?
       let suite:String?
       let city:String?
       let zipcode:String?
    let geo : [geos]
}
class geos : Decodable{
    let lat:String?
       let lng:String?
}
class comapnies:Decodable{
    let name : String?
    let catchPhrase : String?
    let bs : String?
}
