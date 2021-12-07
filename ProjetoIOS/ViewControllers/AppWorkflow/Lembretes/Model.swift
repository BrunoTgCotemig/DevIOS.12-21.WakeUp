//
//  Model.swift
//  ProjetoIOS
//
//  Created by BTG on 07/12/21.
//

import Foundation


struct DB_DataModel{
    
    var title:String
    var date: String
    var content: String
    
    
    init(inTile:String, inDate:String, inContent:String){    title=inTile; date=inDate; content=inContent;     }
    
}
