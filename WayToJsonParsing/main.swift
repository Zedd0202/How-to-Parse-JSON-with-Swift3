//
//  main.swift
//  WayToJsonParsing
//
//  Created by Zedd on 2017. 8. 1..
//  Copyright © 2017년 Zedd. All rights reserved.
//

import Foundation

///Various ways to parse json
///Made by Zedd


//person.json.
//I've attached the person.json file, test it with the code XD
{
    
    "person":[
    
    {
    
    "name": "Bob",
    
    "age": "16",
    
    "employed": "No"
    
    },
    
    {
    
    "name": "Vinny",
    
    "age": "56",
    
    "employed": "Yes"
    
    }
    
    ]
    
}

//Way 1.

var persons = [String:Any]()
var ageArr = [String]()
var nameArr = [String]()
var employedArr = [String]()

//Absolute path of json file
let FullPath = "/Users/Zedd/Desktop/person.json"



//Import json file contents
if let data = try String(contentsOfFile: FullPath).data(using: .utf8) {
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
    persons = json
    
}

//Parse json
if let person = persons["person"] as? [[String: Any]]{
    for personIndex in person {
        nameArr.append(personIndex["name"] as! String)
        ageArr.append(personIndex["age"] as! String)
        employedArr.append(personIndex["employed"] as! String)
    }
}
print(nameArr)//["Bob", "Vinny"]
print(ageArr)//["16", "56"]
print(employedArr)//["No", "Yes"]






//=======================================================================================================//

//Way 2.

var persons = [String : [[String:String]]]()
var ageArr = [String]()
var nameArr = [String]()
var employedArr = [String]()

//Absolute path of json file
let FullPath = "/Users/Zedd/Desktop/person.json"


//Import json file contents
if let data = try String(contentsOfFile: FullPath).data(using: .utf8) {
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : [[String:String]]]
    persons = json
}
//print(persons)
//["person": [["name": "Bob", "age": "16", "employed": "No"], ["name": "Vinny", "age": "56", "employed": "Yes"]]]
//You can get json more beautiful than the Way 1.

//Parse json
for (key, value) in persons{
    for val in value{
        ageArr.append(val["age"]!)
        nameArr.append(val["name"]!)
        employedArr.append(val["employed"]!)
        
    }
}
print(nameArr)//["Bob", "Vinny"]
print(ageArr)//["16", "56"]
print(employedArr)//["No", "Yes"]

//Parse json another way
let person = persons["person"]
for index in person! {
    ageArr.append(index["age"]!)
    nameArr.append(index["name"]!)
    employedArr.append(index["employed"]!)
}
print(nameArr)//["Bob", "Vinny"]
print(ageArr)//["16", "56"]
print(employedArr)//["No", "Yes"]

//=======================================================================================================//

//Way 3 - Use URL (I recommend the above ways rather than this way)

var persons = [String:Any]()
var ageArr = [String]()
var nameArr = [String]()
var employedArr = [String]()

//Absolute path of json file
let FullPath = "/Users/Zedd/Desktop/person.json"


//Import json file contents use URL.
if let data = try? Data(contentsOf: URL(fileURLWithPath: FullPath)){
    let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
    persons = json
}


//Parse json
if let person = persons["person"] as? [[String: Any]]{
    for personIndex in person {
        nameArr.append(personIndex["name"] as! String)
        ageArr.append(personIndex["age"] as! String)
        employedArr.append(personIndex["employed"] as! String)
    }
}
print(nameArr)//["Bob", "Vinny"]
print(ageArr)//["16", "56"]
print(employedArr)//["No", "Yes"]






