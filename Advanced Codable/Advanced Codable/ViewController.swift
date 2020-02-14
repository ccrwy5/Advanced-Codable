//
//  ViewController.swift
//  Advanced Codable
//
//  Created by Chris Rehagen on 2/10/20.
//  Copyright © 2020 Chris Rehagen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayTextView: UITextView!
    
    
    struct ResponseData: Decodable {
        var person: [Person]
    }
    struct Person : Decodable {
        var name: String
        var age: String
        var employed: String
    }
    
    struct ResponseData2: Decodable {
        var color: [Color]
    }
    
    struct Color: Decodable {
        var colorName: String
        var category: String
        var type: String
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPerson(filename: "person")
        loadColor(filename: "colors")
    }
    
    
    func loadPerson(filename fileName: String) -> [Person]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            var displayData = ""

            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                
                for person in jsonData.person{
                    displayData += "Person:\n"
                    displayData += "\(person.name)\n"
                    displayData += "Age: \(person.age)\n"
                    displayData += "Employed: \(person.employed)\n\n"
                }
                
                displayTextView.text = displayData
                
                
                //return jsonData.person
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func loadColor(filename fileName: String) -> [Color]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data2 = try Data(contentsOf: url)
                let decoder2 = JSONDecoder()
                let jsonData2 = try decoder2.decode(ResponseData2.self, from: data2)
                print(jsonData2.color[0].category)
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    
}



