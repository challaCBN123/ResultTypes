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
    let id: Int
    let name : String
    let username : String
    let email : String
    let phone : String
    let website: String
    let address : [address]
    let company : [company]
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

