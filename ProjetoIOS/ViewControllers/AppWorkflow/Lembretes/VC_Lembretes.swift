//
//  VC_Lembretes.swift
//  ProjetoIOS
//
//  Created by BTG on 07/12/21.
//

import UIKit
import Firebase

class VC_Lembretes: ViewControllerExtended, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    //
    //  Firebase related stuff
    //
    
    let DB_R: DatabaseReference! = Database.database().reference().child(Auth.auth().currentUser!.uid)
    var DB_Retrived: [DB_DataModel] = []
    
    
    internal func DB_RetrieveStoredData(){
        
        
        DB_R.observe(DataEventType.value, with: { [self](snapshot) in
            
            
            if snapshot.childrenCount > 0 {
                self.DB_Retrived.removeAll()
                
                for data in snapshot.children.allObjects as! [DataSnapshot] {
                    let data_object = data.value as? [String: AnyObject]
                    
                    let data_title = data_object?["title"]
                    let data_date = data_object?["date"]
                    let data_content = data_object?["content"]
                    
                    let final = DB_DataModel(
                        inTitle: data_title as? String ?? "",
                        inDate: data_date as? String ?? "",
                        inContent: data_content as? String ?? ""
                        )
                    
                    
                    self.DB_Retrived.append(final)
                }
                
                TableView.reloadData()

                
                
            }
                
        })
        
    }

    
    
    
    
    
    
    // Start: Outlets
    
    
    @IBOutlet weak var TableView: UITableView!
    
    
    
    // End: Outlets
    
    
    
    
    
    
    
    
    // Start: Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        
        
        DB_RetrieveStoredData()
        
        TableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        DB_RetrieveStoredData()
        
        TableView.reloadData()
    }
    
    // End: Lifecycle


    
    
    
    
    
    
    // Start: TableView
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DB_Retrived.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            
            let final: DB_DataModel
            final = DB_Retrived[indexPath.row]
            cell.Title.text = final.title
            cell.Description.text = final.content
            cell.Date.text = final.date
            return cell
            
        } else { return UITableViewCell()}
        
        
    
    }
    
    
    
    // End: TableView
    
    
    
    

}
