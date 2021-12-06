//
//  CadastroViewController.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 14/11/21.
//

import UIKit
import Firebase


class CadastroVC: UIViewController {
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtConfirmarSenha: UITextField!
    
    private let database = Database.database().reference()
    var BD = UserDefaults.standard
    let key = "WakeUP"
    var data: [Usuario] = []
    
    func alert(title:String, message:String){
        let alertController:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func transicao(){
        
        let TabBar = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.TabBarController) as? TabBarController
        view.window?.rootViewController = TabBar
        view.window?.makeKeyAndVisible()
        
    }
    
    @IBAction func Registrar(_ sender: Any) {
        
        if (txtNome.text == "" || txtEmail.text == "" || txtSenha.text == "" || txtConfirmarSenha.text == ""){
            
            alert(title: "Erro", message: "Preencha todos os campos")
            
        } else if ( txtSenha.text != txtConfirmarSenha.text ) {
            
            alert(title: "Erro", message: "As senhas sao diferentes")
            
        } else {
            
            Auth.auth().createUser(withEmail: txtEmail.text!, password: txtSenha.text!) { (result, error) in
                if error != nil{
                    self.alert(title: "Erro", message: error!.localizedDescription)
                }else{
                    self.database.child(self.txtEmail.text!).setValue(self.txtNome.text!)
                    let data = Usuario(email: self.txtEmail.text!, senha: self.txtSenha.text!)
                    let user = try! JSONEncoder().encode(data)
                    self.BD.set(user, forKey: self.key)
                    self.transicao()
                }
            }
        }
    }
    
}
