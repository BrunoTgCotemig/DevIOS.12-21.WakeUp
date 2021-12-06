//
//  SenhaViewController.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 11/11/21.
//

import UIKit
import Firebase

class SenhaVC: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func Enviar(_ sender: Any) {
        
        if (txtEmail.text == "") {
            
            alert(title: "Erro", message: "Coloque seu email")
            
        } else {
            
            Auth.auth().sendPasswordReset(withEmail: txtEmail.text!) { (error) in
                if error != nil{
                    self.alert(title: "Erro", message: error!.localizedDescription)
                }else{
                    self.alert(title: "Sucesso", message: "Um email de recuperao foi enviado")
                }
            }
            
        }
        
    }
    
}


