//
//  ViewController.swift
//  swiftResultType
//
//  Created by Bhargava on 31/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import Alamofire

enum PARAMETER_ENCODING{
    static let URL_ENCODING = "URLEncoding"
    static let JSON_ENCODING = "JSONEncoding"
}
class ViewController: UIViewController {
let baseUrl = "http://jsonplaceholder.typicode.com/users"
    let endKey = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingDataUsingUrl(baseUrl: baseUrl, serviceUrl: "", parameter: [:], encoding: PARAMETER_ENCODING.JSON_ENCODING) { (res) in
            switch res{
            case .success(let datasUrl):datasUrl.forEach({(DataUrl) in
                print(DataUrl.name)
            })
                break
                
            case .failure(let err):
            print(err.localizedDescription)
                break
            }
        }
    }
    
   
 func gettingDataUsingUrl(baseUrl:String,serviceUrl:String,parameter:NSDictionary,encoding:String,CompletionHandler: @escaping(Result<[DataUrl],Error>)->Void){
            if encoding == PARAMETER_ENCODING.JSON_ENCODING{
                AF.request(baseUrl+serviceUrl,method: .get,parameters:(parameter as! Parameters),encoding:JSONEncoding.default).responseJSON { (responseData) in
                    switch responseData.result{
                    case .success(_):
                        CompletionHandler(.success(responseData.value as! [DataUrl]))
                        break
                    case .failure(_):
                        print("error")
                        break
                    }
                    }
                  
                     
            }
        }
        
    

}

