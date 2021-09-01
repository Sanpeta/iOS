//
//  ViewController.swift
//  Eventos IFC
//
//  Created by Sidnei de Souza Junior on 03/10/19.
//  Copyright © 2019 Lab PDHS. All rights reserved.
//

import UIKit

var alturaDoNavBar = CGFloat()

class ViewController: UIViewController {
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var labelPassword: UILabel!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonEsquciSenha: UIButton!
    @IBOutlet weak var buttonEntrar: UIButton!
    @IBOutlet weak var buttonCadastrar: UIButton!
    @IBOutlet weak var buttonConvidado: UIButton!
    let dispatchGroup = DispatchGroup()
    
    var arrayCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
        
        alturaDoNavBar = (navigationController?.navigationBar.frame.height)!
        
        imageLogo.frame = CGRect(x: 32, y: alturaDoNavBar + 56, width: self.view.frame.width - 64, height: self.view.frame.size.height/10)
        
        labelLogin.frame = CGRect(x: 16, y: imageLogo.frame.maxY + 32, width: self.view.frame.size.width - 32, height: 30)
        labelLogin.font = UIFont(name: "Futura", size: 24)
        labelLogin.textAlignment = .left
        labelLogin.textColor = UIColor.black
        labelLogin.numberOfLines = 1
        labelLogin.adjustsFontSizeToFitWidth = true
        
        labelUsername.frame = CGRect(x: 16, y: labelLogin.frame.maxY + 16, width: self.view.frame.size.width - 32, height: 30)
        labelUsername.font = UIFont(name: "Futura", size: 14)
        labelUsername.textAlignment = .left
        labelUsername.textColor = UIColor.black
        labelUsername.numberOfLines = 1
        labelUsername.adjustsFontSizeToFitWidth = true
        
        textFieldUsername.frame =  CGRect(x: 16, y: labelUsername.frame.maxY, width: self.view.frame.size.width - 32, height: 40)
        textFieldUsername.placeholder = "E-mail"
        textFieldUsername.font = UIFont(name: "Futura", size: 16)
        textFieldUsername.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldUsername.keyboardType = UIKeyboardType.decimalPad
        textFieldUsername.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldUsername.layer.borderWidth = 2.0
        textFieldUsername.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        textFieldUsername.layer.cornerRadius = textFieldUsername.frame.height/6
        textFieldUsername.layer.masksToBounds = true
        
        
        labelPassword.frame = CGRect(x: 16, y: textFieldUsername.frame.maxY + 8, width: self.view.frame.size.width - 32, height: 30)
        labelPassword.font = UIFont(name: "Futura", size: 14)
        labelPassword.textAlignment = .left
        labelPassword.textColor = UIColor.black
        labelPassword.numberOfLines = 1
        labelPassword.adjustsFontSizeToFitWidth = true
        
        textFieldPassword.frame =  CGRect(x: 16, y: labelPassword.frame.maxY, width: self.view.frame.size.width - 32, height: 40)
        textFieldPassword.placeholder = "Senha"
        textFieldPassword.font = UIFont(name: "Futura", size: 16)
        textFieldPassword.borderStyle = UITextField.BorderStyle.roundedRect
        textFieldPassword.keyboardType = UIKeyboardType.decimalPad
        textFieldPassword.isSecureTextEntry = true
        textFieldPassword.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textFieldPassword.layer.borderWidth = 2.0
        textFieldPassword.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        textFieldPassword.layer.cornerRadius = textFieldPassword.frame.height/6
        textFieldPassword.layer.masksToBounds = true
        
        buttonEsquciSenha.frame = CGRect(x: textFieldPassword.frame.maxX - 200, y: textFieldPassword.frame.maxY + 8, width: 200, height: 25)
        buttonEsquciSenha.contentHorizontalAlignment = .right
        buttonEsquciSenha.setTitleColor(UIColor.init(red: 70/255, green: 190/255, blue: 53/255, alpha: 1.0), for: .normal)
        
        buttonEntrar.frame = CGRect(x: (self.view.frame.size.width/2 - 100), y: buttonEsquciSenha.frame.maxY + 32, width: 200, height: 40)
        buttonEntrar.titleLabel?.font = UIFont(name: "Futura", size: 18)
        buttonEntrar.setTitleColor(UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0), for: .normal)
        buttonEntrar.layer.borderWidth = 2.0
        buttonEntrar.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        buttonEntrar.layer.cornerRadius = buttonEntrar.frame.height/6
        buttonEntrar.layer.masksToBounds = true
        buttonEntrar.addTarget(self, action: #selector(ViewController.fazerLogin), for: .touchUpInside)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        buscarJSONEventos()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func fazerLogin() {
                
//        buscarJSON(user: self.textFieldUsername.text!, pass: self.textFieldPassword.text!)
        self.performSegue(withIdentifier: "segueLoginToEventos", sender: self)
        textFieldUsername.text = ""
        textFieldPassword.text = ""
        
    }
    
    func buscarJSON(user: String, pass: String){
        dispatchGroup.enter()
        //        let minhaUrl = NSURL(string: "https://swapi.co/api/people/1/")
        //        let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/evento.php")
        //        let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/campus.php")
        //        let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/programacao.php")
        let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/usuario.php")
        //        let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/participante_evento.php")
        let request = NSMutableURLRequest(url: minhaUrl! as URL)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let httpStatus = response as? HTTPURLResponse
            
            if httpStatus?.statusCode == 200 {
                
                if data?.count != 0 {
                    
                    do {
                        let respostaJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                        
                        for item in respostaJSON {
                            let dict = item as! NSDictionary
                            print(item)
                            if let cpf: String = (dict.value(forKey: "nr_cpf") as? String) {
                                if let password: String = (dict.value(forKey: "ds_senha") as? String) {
                                    if (user.elementsEqual(cpf) && pass.elementsEqual(password)) {
                                        DispatchQueue.main.async {                                            
                                            self.dispatchGroup.leave()
                                        }
                                        break
                                    }
                                }
                            }
                        }
                    } catch {
                        print("Error")
                    }
                    
                    //                    let arr = respostaJSON.object(at: 2) as! NSDictionary
                    //                    print(arr.value(forKey: "nr_cpf") as! String)
                    
                }
                
            }
            
        }
        dispatchGroup.notify(queue: .main) {
            self.performSegue(withIdentifier: "segueLoginToEventos", sender: self)
        }
        task.resume()
    }
    
    func buscarJSONEventos(){
        dispatchGroup.enter()
            //        let minhaUrl = NSURL(string: "https://swapi.co/api/people/1/")
            let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/evento.php")
            //        let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/campus.php")
            //        let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/programacao.php")
            //let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/usuario.php")
            //        let minhaUrl = NSURL(string: "http://web.sbs.ifc.edu.br/~ifceventosapp/site/Api/participante_evento.php")
            let request = NSMutableURLRequest(url: minhaUrl! as URL)
            let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
                
                let httpStatus = response as? HTTPURLResponse
                
                if httpStatus?.statusCode == 200 {
                    
                    if data?.count != 0 {
                        
                        do {
                         
                            let respostaJSON = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSArray
                            DispatchQueue.main.async {
                                self.arrayCount = respostaJSON.count
                                self.dispatchGroup.leave()
                            }
                            
                            
                        } catch {
                            print("Error")
                        }
                        
                    }
                    
                }
                
            }
//        dispatchGroup.notify(queue: .main) {
//            print(self.arrayCount)
//        }
            task.resume()
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueLoginToEventos" {
            // as -- casting
            let destinationVC = segue.destination as! EventosViewController
            destinationVC.numeroDeEventos = arrayCount
        }
    }
}

