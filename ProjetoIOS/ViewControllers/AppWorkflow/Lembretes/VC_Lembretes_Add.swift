//
//  VC_Lembretes_Add.swift
//  ProjetoIOS
//
//  Created by BTG on 07/12/21.
//

import UIKit
import Firebase

class VC_Lembretes_Add: ViewControllerExtended {

    let DB_R: DatabaseReference! = Database.database().reference().child(Auth.auth().currentUser!.uid)
    
    
    
    
    
    
    //
    // Outlets
    //
    

    @IBOutlet weak var xTitle: UITextField!
    @IBOutlet weak var xDate: UIDatePicker!
    @IBOutlet weak var xContent: UITextView!
    
    
    
    @IBAction func AddData(_ sender: Any) {
    
        let i:String = xDate.date.description ?? ""
        let xDataFilterd:String = Regex_FindFirst(input: i, regex: ".+(?=[ ][+])")
        
        
        
        
        GenerateAlertBox(in_title: "a", in_message: xDataFilterd, in_ButtonText: "b")
    
    }
    
    
    
    //
    //   Other functions
    //
    
    
    
    func DB_SendData(xtitle:String, xdate:String, xcontent: String){
        
        
        if(xtitle != "" && xdate != "" && xcontent != ""){
            
            let key = DB_R.childByAutoId().key
            DB_R.child(key!).setValue([    "title":xtitle, "date": xdate, "content": xcontent     ])
            GenerateAlertBox(in_title: "Sucesso!", in_message: "Os dados foram adicionados", in_ButtonText: "OK")
            
            //Clear the text fields after using this funciton
            
        } else{
            
            GenerateAlertBox(in_title: "Erro", in_message: "Por favor, preencha todos os campos.", in_ButtonText: "OK")
        }
        
    }
    
    //var title:String
    //var date: String
    //var content: String
    
    
    
    
    
    
    
    //
    // Lifecycle
    //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    

}
