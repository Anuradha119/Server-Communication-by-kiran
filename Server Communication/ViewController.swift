//
//  ViewController.swift
//  Server Communication
//
//  Created by KODAM AVINASH on 12/12/19.
//  Copyright © 2019 KODAM AVINASH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let moviesData = GetData()
    var image : UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moviesData.getData()
        
        let serverData = moviesData.getData()
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        
        let imageUrl = serverData[0]["posters"] as! [String]
        let posterUrl =
            "https://www.brninfotech.com/tws/" + imageUrl[0]
        button.setImage(getPoster(url: posterUrl  ), for: UIControlState.normal)
        view.addSubview(button)
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getPoster(url : String) -> UIImage {
        
        let posterUrl = URL(string: url)
        
        let task = URLSession.shared.dataTask(with: posterUrl!) { (data, res, err) in
            self.image = UIImage(data: data!)!

        }
        task.resume()
        
        while (image == nil){}
        return image!
    }


}

