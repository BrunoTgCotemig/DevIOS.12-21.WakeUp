//
//  File.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 15/11/21.
//

import UIKit
import Firebase

class NovaSenhaViewController: UIViewController {

    @IBOutlet weak var txtSenhaAtual: UITextField!
    @IBOutlet weak var txtSenhaNova: UITextField!
    @IBOutlet weak var txtConfirmarSenhaNova: UITextField!
    
    //var BD = UserDefaults.standard
    //let key = "WakeUP"
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    @IBAction func btnAtualizar(_ sender: Any) {
        
        if txtSenhaAtual.text == "" || txtSenhaNova.text == "" || txtConfirmarSenhaNova.text == "" {
            alert(title: "Erro", message: "Preencha todos os campos")
            
            
        } else if txtSenhaNova.text != txtConfirmarSenhaNova.text {
            alert(title: "Erro", message: "As novas senhas estao diferentes")
            
            
        } else {
            
            
            Auth.auth().currentUser?.updatePassword(to: txtSenhaNova.text!) { (error) in
                if error != nil {
                    self.alert(title: "Erro", message: error!.localizedDescription)
                } else {
                    self.alert(title: "Sucesso", message: "Sua senha foi alterada!")
                }
            }
            
        }
        
    }
    
}
