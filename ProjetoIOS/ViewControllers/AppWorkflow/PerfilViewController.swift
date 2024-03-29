//
//  PerfilViewController.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 15/11/21.
//

import UIKit
import Firebase

class PerfilViewController: ViewControllerExtended {

    //var BD = UserDefaults.standard
    //let key = "WakeUP"
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func transicao(){
        
        let login = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.ViewController) as? ViewController
        view.window?.rootViewController = login
        view.window?.makeKeyAndVisible()
        
    }
    
    internal func TryLogout(){
        
        do {
            try Auth.auth().signOut()
            transicao()
            GenerateAlertBox(in_title: "Logout bem sucedido", in_message: "Aperte (OK) para continuar ", in_ButtonText: "OK")
        } catch let error{
            GenerateAlertBox(in_title: "Error", in_message: error.localizedDescription, in_ButtonText: "OK")
        }
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func btnLogout(_ sender: Any) {
        
        do {
            // try Auth.auth().signOut()
            //let data = try! JSONEncoder().encode("")
            //BD.set(data, forKey: self.key)
            
            TryLogout()
            
        } catch {
            alert(title: "Erro", message: "Erro ao tentar sair")
        }
        
    }
    
}
