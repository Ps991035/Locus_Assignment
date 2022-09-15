//
//  ViewModel.swift
//  Locus_Assignment
//
//  Created by PRITESH SINGH on 14/09/22.
//

import Foundation


class ViewModel{
    
    var itemsModel = [Model]()
    
    func fetchItemData(){
        
        if let url = Bundle.main.url(forResource: "Data", withExtension: "json"){
            
            do{
                
                let data = try Data(contentsOf: url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dict = object as? [[AnyHashable:Any]]{
                    setItemData(dict)
                }
                
            }
            catch {
                debugPrint("Unable To get Data")
            }
            
        }
    }
    
    func setItemData(_ object: [[AnyHashable:Any]]){
        
        for dict in object {
            
            let type = dict["type"] as? String
            let id = dict["id"] as? String
            let title = dict["title"] as? String
            let dataMap = dict["dataMap"] as? [AnyHashable:Any]
            let options = dataMap?["options"] as? [String]
            
            itemsModel.append(Model(type: type, id: id, title: title, options: options))
        }
    }
    
    func getItemData() -> [Model]{
        return itemsModel
    }
    
    
}
