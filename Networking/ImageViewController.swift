//
//  ViewController.swift
//  Networking
//
//  Created by Artem Bazhanov on 15.11.2020.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var getImageButton: UIButton!
    
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activitiIndicator.isHidden = true
        activitiIndicator.hidesWhenStopped = true
        
    }

    
    
    
    
    
    
    @IBAction func getImagePressed(_ sender: Any) {
        
        label.isHidden = true
        getImageButton.isEnabled = false
        activitiIndicator.isHidden = false
        activitiIndicator.startAnimating()
        
        guard let url = URL(string: "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg") else {return}
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if let date = data, let image = UIImage(data: date) {
                DispatchQueue.main.async {
                    self.activitiIndicator.stopAnimating()
                    self.imageView.image = image
                }
            }
        }.resume()
        
    }
    

}

