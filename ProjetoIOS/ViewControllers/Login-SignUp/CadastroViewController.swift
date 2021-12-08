//
//  CadastroViewController.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 14/11/21.
//

import UIKit
import Firebase


class CadastroVC: ViewControllerExtended {
    
    
    
    //
    //  Outlets & relebant vars
    //
    
    
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtConfirmarSenha: UITextField!
    
    private let database = Database.database().reference()
    var data: [Usuario] = []
    
    
    
    
    //
    //  Functions & Actions
    //
    
  
    func clearInputFields(){
        
        
        txtNome.text = ""
        txtEmail.text = ""
        txtSenha.text = ""
        txtConfirmarSenha.text = ""
    }
    
    
    
    
    func transicao(){
        
        let TabBar = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.ViewController) as? ViewController
        view.window?.rootViewController = TabBar
        view.window?.makeKeyAndVisible()
        
    }
    
    
    @IBAction func Registrar(_ sender: Any) {
        
        if (txtNome.text == "" || txtEmail.text == "" || txtSenha.text == "" || txtConfirmarSenha.text == ""){
            
            //alert(title: "Alerta", message: "Por fafor, preencha todos os campos")
            GenerateAlertBox(in_title: "Alerta", in_message: "Por favor, preencha todos os campos", in_ButtonText: "OK")
            
            
            
        }
        else if ( txtSenha.text != txtConfirmarSenha.text ) {
            
            //alert(title: "Aleta", message: "Os campos de senha são diferentes: eles devem conter a mesma senha.")
            GenerateAlertBox(in_title: "Alerta", in_message: "Os campos de senha estão diferentes: eles devem conter a mesma senha", in_ButtonText: "OK")
            
            
        }
        else {
            
            let name = txtNome.text ?? ""
            let email = txtEmail.text ?? ""
            let passowrd = txtSenha.text ?? ""
            
            
            
            Auth.auth().createUser(withEmail: email, password: passowrd) { (result, error) in
                if error != nil{
                    //self.alert(title: "Erro", message: error!.localizedDescription)
                    self.GenerateAlertBox(in_title: "Erro", in_message: error!.localizedDescription, in_ButtonText: "OK")
                }else{
                    //self.database.child(email).setValue(name)
                    //let data = Usuario(email: self.txtEmail.text!, senha: self.txtSenha.text!)
                    //let user = try! JSONEncoder().encode(data)
                    //self.BD.set(user, forKey: self.key)
                    //self.transicao()
                    //self.GenerateAlertBox(in_title: "Sucesso!", in_message: "Usuário casatrado", in_ButtonText: "OK")
                    
                    self.GenerateAlertBox_PlusAction(in_title: "Sucesso!", in_message: "Usuário cadastrado", in_ButtonText: "Voltar", in_Action: {self.transicao()})
                    
                    
                    
                }
            }
            
            
            
            
        }   //
    }
    
    
    
    //
    //  Lifecycle
    //
    
    
    override func viewDidLoad() {
        clearInputFields()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        clearInputFields()
    }
    
    
    
    
    
}
