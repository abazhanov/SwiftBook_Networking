//
//  ViewController.swift
//  Networking
//
//  Created by Artem Bazhanov on 15.11.2020.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func getRequest(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let response = response,
                let data = data
                else {return}
            print(response)
            print(data)
            
            //сериализируем полученные данные, т.е. приводим к читаемому формату
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json) //Теперь в json лежит массив данных
            } catch {
                print(error)
            }
            
            
        }.resume()
        }
        
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
