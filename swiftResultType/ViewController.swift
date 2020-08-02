//
//  ViewController.swift
//  swiftResultType
//
//  Created by Bhargava on 31/07/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
struct dataUrl:Decodable{
    var postId: Int
    var id: Int
   var name: String
   var email: String
    var body:String
}
enum PARAMETER_ENCODING{
    static let URL_ENCODING = "URLEncoding"
    static let JSON_ENCODING = "JSONEncoding"
}
class ViewController: UIViewController {
    //let newJob = DataUrl(jsonObjects: <#T##[String : Any]#>)
//let baseUrl = "http://jsonplaceholder.typicode.com/users"
    let baseUrl = "http://jsonplaceholder.typicode.com/comments"
    let endKey = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingDataUsingUrl(baseUrl: baseUrl, serviceUrl: endKey, encoding:PARAMETER_ENCODING.JSON_ENCODING) { (responseData) in
            switch responseData{
                
            case .success(let details):
                details.forEach { (dataUrl) in
                    print(dataUrl.email)
                }
                break
            case .failure(_):
                break
            }
        }
       
    }
    
    
 func gettingDataUsingUrl(baseUrl:String,serviceUrl:String,encoding:String,CompletionHandler: @escaping(Result<[dataUrl],Error>)->Void){
    AF.request(baseUrl,method: .get,encoding: JSONEncoding.default).responseJSON { (dataResponse) in
      
        switch dataResponse.result{
            
        case .success(_):
            guard let data = dataResponse.data else { return }
                do{
                    let jsonData = try JSONDecoder().decode([dataUrl].self, from: data)
                    CompletionHandler(.success(jsonData))
                    //print(jsonData)
                    
                    //CompletionHandler(.success(jsonData))
                    }catch{
                               
                     }
            break
        case .failure(_):
           
            break
        }
        
    }
        }
        
    

}

