//
//  NovoEmailViewController.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 15/11/21.
//

import UIKit
import Firebase

class NovoEmailViewController: UIViewController {

    @IBOutlet weak var txtEmailAtual: UITextField!
    @IBOutlet weak var txtEmailNovo: UITextField!
    
    //var BD = UserDefaults.standard
    //let key = "WakeUP"
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func btnAtualizar(_ sender: Any) {
        
        
        
    }
    
}
