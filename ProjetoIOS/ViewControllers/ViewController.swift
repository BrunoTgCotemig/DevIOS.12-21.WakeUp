//
//  ViewController.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 11/11/21.
//

import UIKit
import Firebase

struct Usuario: Codable {
    var email: String
    var senha: String
}

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
    var BD = UserDefaults.standard
    let key = "WakeUP"
    var user: [Usuario] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let data = BD.value(forKey: key) as? Data{
            let usuario = try! JSONDecoder().decode([Usuario].self, from: data)
            user.append(contentsOf: usuario)
            
            if (user[0].email != ""){
                Auth.auth().signIn(withEmail: user[0].email, password: user[0].senha) { (resultado, error)  in
                    if error != nil{
                        self.alert(title: "Erro ao logar automaticamente", message: error!.localizedDescription)
                    } else {
                        self.transicao()
                    }
                }
            }
        }
        
    }
    
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
    
    @IBAction func btnEntrar(_ sender: Any) {
        if (txtEmail.text == "" || txtSenha.text == "") {
            
            alert(title: "Erro", message: "Preencha todos campos")
            
        } else {
            
            Auth.auth().signIn(withEmail: txtEmail.text!, password: txtSenha.text!) { (resultado, error) in
                if error != nil{
                    self.alert(title: "Erro", message: error!.localizedDescription)
                }else{
                    let UserInfo = Auth.auth().currentUser
                    let user = try! JSONEncoder().encode(UserInfo!.uid)
                    self.BD.set(user, forKey: self.key)
                    self.transicao()
                }
            }
            
        }
    }
    
}

