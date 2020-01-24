//
//  GetData.swift
//  Server Communication
//
//  Created by KODAM AVINASH on 12/12/19.
//  Copyright © 2019 KODAM AVINASH. All rights reserved.
//

import UIKit

class GetData: NSObject {
    
    var serverData: [[String:Any]]!
    
    func getData() -> [[String:Any]]  {
        
        var urlObj = URLRequest(url: URL(string: "https://www.brninfotech.com/tws/MovieDetails2.php?mediaType=movies")!)
        urlObj.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: urlObj) { (data, response, err) in
            print("The Data is \(data)")
            
            do{
                let convertedData = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]
               // print("Converted Data is \(convertedData)")
                
                self.serverData = convertedData
                
                let actors : [String] = convertedData[0]["posters"] as! [String]
                print("posters are \(actors)")
                
            }catch{
                print("Error")
            }
            
        }
        task.resume()
        
        while(serverData == nil){
            
        }
        
        return serverData
    }

}
