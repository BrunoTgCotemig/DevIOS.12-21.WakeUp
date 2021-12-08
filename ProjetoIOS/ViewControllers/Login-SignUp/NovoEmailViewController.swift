//
//  NovoEmailViewController.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 15/11/21.
//

import UIKit
import Firebase

class NovoEmailViewController: ViewControllerExtended {

    @IBOutlet weak var txtEmailAtual: UITextField!
    @IBOutlet weak var txtEmailNovo: UITextField!
    
    //var BD = UserDefaults.standard
    //let key = "WakeUP"
    
    
    @IBAction func btnAtualizar(_ sender: Any) {
        
        GenerateAlertBox(in_title: "'Sucesso!'", in_message: "Um email foi enviado com instruções para a alteração cadastral", in_ButtonText: "OK")
        
        
        
    }
    
}
