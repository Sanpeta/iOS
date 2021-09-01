//
//  EventosViewController.swift
//  Eventos IFC
//
//  Created by Sidnei de Souza Junior on 08/10/19.
//  Copyright © 2019 Lab PDHS. All rights reserved.
//

import UIKit

class EventosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayEventos: NSArray = []
    var dictionaryEventos: NSDictionary!
    var numeroDeEventos = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Eventos"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EventosCell.self, forCellReuseIdentifier: "cell")
        buscarJSON()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numeroDeEventos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventosCell
        let dict = arrayEventos.object(at: Int(indexPath.row)) as! NSDictionary
        cell.title.text = dict.value(forKey: "nm_evento") as? String
        cell.date.text = dict.value(forKey: "dt_inicio") as? String
        cell.place.text = dict.value(forKey: "ds_local") as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "eventosParaEventoVC", sender: self)
    }
    
    func buscarJSON(){
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
                        
//                        DispatchQueue.main.sync {
                        self.arrayEventos = respostaJSON
//                        }
                        
                        
                    } catch {
                        print("Error")
                    }
                    
                }
                
            }
            
        }
        task.resume()
    }
    
}
