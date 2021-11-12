//
//  ViewController.swift
//  ProjetoIOS
//
//  Created by COTEMIG on 11/11/21.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var SecondeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SecondeView.Gradient(cor1: Cores.roxo, cor2:Cores.azul)
    }


}

