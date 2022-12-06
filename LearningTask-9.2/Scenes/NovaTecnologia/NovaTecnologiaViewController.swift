//
//  NovaTecnologiaViewController.swift
//  LearningTask-9.2
//
//  Created by rafael.rollo on 25/07/2022.
//

import UIKit

protocol NovaTecnologiaViewControllerDelegate: AnyObject {
    func NovaTecnologiaViewController(_ viewController: NovaTecnologiaViewController, adicionouTecnologia tecnologia: String)
}

class NovaTecnologiaViewController: UIViewController {
    
    typealias MensagemDeValidacao = String

    @IBOutlet weak var tecnologiaTextField: UITextField!
    var delegate: NovaTecnologiaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func botaoAdicionarPressionado(_ sender: UIButton) {
        switch formularioEhValido() {
            
        case (false, let mensagem):
            exibeAlerta(titulo: "Erro", mensagem: mensagem)
            
        default:
            adicionaTecnologia()
        }
    }
    
    func formularioEhValido() -> (Bool, MensagemDeValidacao?) {
        if let tecnologia = tecnologiaTextField.text, tecnologia.isEmpty {
            return (false, "Informe a tecnologia para o autor.")
        }
        
        return (true, nil)
    }
    
    func adicionaTecnologia() {
        let tecnologia = tecnologiaTextField.text!
        
        guard let delegate = delegate else { return }
        delegate.NovaTecnologiaViewController(self, adicionouTecnologia: tecnologia)
        
        self.dismiss(animated: true)
    }
    
}
