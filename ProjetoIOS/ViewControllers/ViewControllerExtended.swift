//
//  ViewControllerExtended.swift
//  ProjetoIOS
//
//  Created by BTG on 07/12/21.
//

import UIKit
import Firebase



extension String {
    
    
    func match(_ regex: String) -> [[String]]
    {
        let nsString = self as NSString
        return (try? NSRegularExpression(pattern: regex, options: []))?.matches(in: self, options: [], range: NSMakeRange(0, nsString.length)).map { match in
            (0..<match.numberOfRanges).map { match.range(at: $0).location == NSNotFound ? "" : nsString.substring(with: match.range(at: $0)) }
        } ?? []
    }
}


class ViewControllerExtended: UIViewController {

    
    

    internal func Regex_FindFirst( input:String, regex: String)-> String{
        
        let i = input.match(regex)
        
        do{
            
            let dummy:String = i[0][0]
            return dummy
            
        }catch{ return "invalid operation" }
        

        
    }
    
    
    
    
    
    
    
    internal func GenerateAlertBox(in_title: String, in_message: String, in_ButtonText: String){
        
        let alert = UIAlertController(title: in_title , message: in_message, preferredStyle: UIAlertController.Style.alert)
        
        
        alert.addAction( UIAlertAction( title: in_ButtonText, style: .cancel, handler: { (_) in }   ))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    // How to use it: GenerateAlertBox_PlusAction(in_title: "a", in_message: "b", in_ButtonText: "c", in_Action: {self.Global_ChengeScreens_toMain()})
    
    internal func GenerateAlertBox_PlusAction(
        in_title: String,
        in_message: String,
        in_ButtonText: String,
        in_Action: @escaping () -> Void
    
    ){
        
        let alert = UIAlertController(title: in_title , message: in_message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction( UIAlertAction( title: in_ButtonText, style: .cancel, handler: { (_) in in_Action() }   ))
        
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    

}
