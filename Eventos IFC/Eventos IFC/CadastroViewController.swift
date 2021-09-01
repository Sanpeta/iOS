//
//  CadastroViewController.swift
//  Eventos IFC
//
//  Created by Sidnei de Souza Junior on 08/10/19.
//  Copyright © 2019 Lab PDHS. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController{
    @IBOutlet weak var imagemLogoView: UIImageView!
    
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldCPF: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
    @IBOutlet weak var textFieldConfSenha: UITextField!
    @IBOutlet weak var buttonCadastrar: UIButton!
    
    //Coloque a URL da sua API aqui
    let url = "http://web.sbs.ifc.edu.br/~ifceventosapp/site/php/create.php"
    
    //Aqui vão os parâmetros da sua requisição
    var params = [
        "nome":"",
        "cpf":"",
        "email":"",
        "senha":""
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cadastro"
        
        alturaDoNavBar = (navigationController?.navigationBar.frame.height)!
        
        imagemLogoView.frame = CGRect(x: 32, y: alturaDoNavBar + 56, width: self.view.frame.width - 64, height: self.view.frame.size.height/10)
        
        textFieldNome.frame =  CGRect(x: 16, y: imagemLogoView.frame.maxY + 32, width: self.view.frame.size.width - 32, height: 40)
        textFieldNome.font = UIFont(name: "Futura", size: 16)
        textFieldNome.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldNome.keyboardType = UIKeyboardType.decimalPad
        textFieldNome.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldNome.layer.borderWidth = 2.0
        textFieldNome.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        textFieldNome.layer.cornerRadius = textFieldNome.frame.height/6
        textFieldNome.layer.masksToBounds = true
        
        textFieldCPF.frame =  CGRect(x: 16, y: textFieldNome.frame.maxY + 8, width: self.view.frame.size.width - 32, height: 40)
        textFieldCPF.font = UIFont(name: "Futura", size: 16)
        textFieldCPF.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldCPF.keyboardType = UIKeyboardType.decimalPad
        textFieldCPF.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldCPF.layer.borderWidth = 2.0
        textFieldCPF.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        textFieldCPF.layer.cornerRadius = textFieldCPF.frame.height/6
        textFieldCPF.layer.masksToBounds = true
        
        textFieldEmail.frame =  CGRect(x: 16, y: textFieldCPF.frame.maxY + 8,width: self.view.frame.size.width - 32, height: 40)
        textFieldEmail.font = UIFont(name: "Futura", size: 16)
        textFieldEmail.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldEmail.keyboardType = UIKeyboardType.decimalPad
        textFieldEmail.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldEmail.layer.borderWidth = 2.0
        textFieldEmail.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        textFieldEmail.layer.cornerRadius = textFieldEmail.frame.height/6
        textFieldEmail.layer.masksToBounds = true
        
        textFieldSenha.frame =  CGRect(x: 16, y: textFieldEmail.frame.maxY + 8, width: self.view.frame.size.width - 32, height: 40)
        textFieldSenha.font = UIFont(name: "Futura", size: 16)
        textFieldSenha.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldSenha.keyboardType = UIKeyboardType.decimalPad
        textFieldSenha.isSecureTextEntry = true
        textFieldSenha.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldSenha.layer.borderWidth = 2.0
        textFieldSenha.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        textFieldSenha.layer.cornerRadius = textFieldSenha.frame.height/6
        textFieldSenha.layer.masksToBounds = true
        
        textFieldConfSenha.frame =  CGRect(x: 16, y: textFieldSenha.frame.maxY + 8, width: self.view.frame.size.width - 32, height: 40)
        textFieldConfSenha.font = UIFont(name: "Futura", size: 16)
        textFieldConfSenha.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldConfSenha.keyboardType = UIKeyboardType.decimalPad
        textFieldConfSenha.isSecureTextEntry = true
        textFieldConfSenha.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldConfSenha.layer.borderWidth = 2.0
        textFieldConfSenha.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        textFieldConfSenha.layer.cornerRadius = textFieldConfSenha.frame.height/6
        textFieldConfSenha.layer.masksToBounds = true
        
        buttonCadastrar.frame = CGRect(x: (self.view.frame.size.width/2 - 100), y: textFieldConfSenha.frame.maxY + 32, width: 200, height: 40)
        buttonCadastrar.titleLabel?.font = UIFont(name: "Futura", size: 18)
        buttonCadastrar.setTitleColor(UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0), for: .normal)
        buttonCadastrar.layer.borderWidth = 2.0
        buttonCadastrar.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        buttonCadastrar.layer.cornerRadius = buttonCadastrar.frame.height/6
        buttonCadastrar.layer.masksToBounds = true
        buttonCadastrar.addTarget(self, action: #selector(fazerCadastro), for: .touchUpInside)
        
    }
    
    @objc func fazerCadastro() {
        params.updateValue(textFieldNome.text!, forKey: "nome")
        params.updateValue(textFieldCPF.text!, forKey: "cpf")
        params.updateValue(textFieldEmail.text!, forKey: "email")
        params.updateValue(textFieldSenha.text!, forKey: "senha")
        if textFieldNome.text == "" {
            showSimpleAlert(title: "Campo em branco", campo: "Nome")
        } else {
            if textFieldCPF.text == "" {
                showSimpleAlert(title: "Campo em branco", campo: "CPF")
            } else {
                if textFieldEmail.text == "" {
                    showSimpleAlert(title: "Campo em branco", campo: "E-mail")
                } else {
                    if textFieldSenha.text == "" {
                        showSimpleAlert(title: "Campo em branco", campo: "Senha")
                    } else {
                        if textFieldConfSenha.text == "" {
                            showSimpleAlert(title: "Campo em branco", campo: "Confirmar Senha")
                        } else {
                            if textFieldConfSenha.text == textFieldSenha.text {
                                //Chamando a funcão POST
                                postRequest(url: url, params: params){
                                    (result, err)  in
                                    //Aqui você tem seu resultado
                                    if let res:Bool = (result?.values.first as? Bool) {
                                        if(res) {
                                            //Aqui res podera assumir dois valores, true ou false
                                            print("sua requisicao foi realizada com sucesso")
                                        } else {
                                            //Aqui voce pode tratar os erros
                                            print("a requisicao nao funcionou")
                                        }
                                    }
                                }

                            } else {
                                showSimpleAlert(title: "Confirmação da senha", campo: "Senhas não conferem")
                            }
                        }
                    }
                }
            }
            
        }
        
    }
    
    //Não esqueca de importar o Foundation
    func postRequest(url: String, params: [String: String],
                     completion: @escaping ([String: Any]?, Error?) -> Void){
        //URL válida
        guard let URL = URL(string: url) else {
            completion(nil, nil)
            return
        }
        
        //Cria a representacão da requisição
        let request = NSMutableURLRequest(url: URL)
        
        //Converte as chaves em valores pares para os parametros em formato de String
        let postString = params.map { "\($0.0)=\($0.1)" }.joined(separator: "&")
        
        //Atribui à requisiçāo o método POST
        request.httpMethod = "POST"
        
        //Codifica o corpo da mensagem em "data" usando utf8
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        //Cria a tarefa de requisição
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            do {
                
                if let data = data {
                    //A resposta chegou
                    let response = try JSONSerialization.jsonObject(with: data, options: [])
                    completion(response as? [String : Any], nil)
                }
                else {
                    //Não houve resposta
                    completion(nil, nil)
                    self.showSimpleAlert(title: "Sem resposta ao servidor", campo: "Servidor")
                }
            } catch let error as NSError {
                //Houve um erro na comunicao com o servidor
                completion(nil, error)
                self.showSimpleAlert(title: "Sem comunicao com o servidor", campo: "Servidor")
            }
        }
        
        //Aciona a tarefa
        task.resume()
        self.performSegue(withIdentifier: "segueCadastroToEventos", sender: self)
    }
    
    func showSimpleAlert(title: String, campo: String) {
        var alert = UIAlertController()
        if campo == "Servidor" {
            alert = UIAlertController(title: "\(title)", message: "Problema com o \(campo)", preferredStyle: UIAlertController.Style.alert)
        } else {
            alert = UIAlertController(title: "\(title)", message: "Por favor preencha o campo \(campo) para se cadastar.", preferredStyle: UIAlertController.Style.alert)
        }

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
}
    
