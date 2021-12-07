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
    
    
    init(inTitle:String, inDate:String, inContent:String){    title=inTitle; date=inDate; content=inContent;     }
    
}
