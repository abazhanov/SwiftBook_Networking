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
        
    
    
    @IBAction func postRequest(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        //создаем словарь с данными, которые будем передавать на сервер
        let userData = ["Course": "Networking", "Lesson": "GET and POST Request"]
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        //ПРеобразуем наш словарь в JSON формат
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else {return}
        // помещаем данные в тело запроса
        request.httpBody = httpBody
        //ВАЖНО! Добавляем параметры отправки запроса. Копирнули это из ответа сервера
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //создаем сеесию для отправки данных на сервер
        let session = URLSession.shared
        session.dataTask(with: request) { (data,response, error) in
            //получаем статус ответа (опционалы)
            guard let response = response, let data = data else {return}
            
            print(response)
            
            //Прежде чем вывести данные на консоль, нужно их преобразовать
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
