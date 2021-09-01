//
//  EventoViewController.swift
//  Eventos IFC
//
//  Created by Sidnei de Souza Junior on 08/10/19.
//  Copyright © 2019 Lab PDHS. All rights reserved.
//

import UIKit
import MapKit

class EventoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var scrollView: UIScrollView!
    //info evento inicial
    var imageEvent = UIImageView()
    var titleEvent = UILabel()
    var imageDate = UIImageView()
    var titleDateStartFinish = UILabel()
    var imagePlace = UIImageView()
    var titlePlace = UILabel()
    var imageAdress = UIImageView()
    var titleAdress = UILabel()
    var lineProgView = UIView()
    //programacao geral
    var programTableViewLabel = UILabel()
    var buttonDayOne = UIButton()
    var buttonDayTwo = UIButton()
    var buttonDayThree = UIButton()
    var viewLineDayOne = UIView()
    var viewLineDayTwo = UIView()
    var viewLineDayThree = UIView()
    var tableViewCreate = UITableView()
    var lineProgFinishView = UIView()
    //mapa
    var adressCompleteLabel = UILabel()
    var mapa = MKMapView()
    var titleAndSubTitleEvent = UILabel()
    var descriptionEvent = UILabel()
    var siteLinkButton = UIButton()
    var aboutProductorEvent = UILabel()
    var contactLabel = UILabel()
    var registerButton = UIButton()
    
    var contentSizeHeight: CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Evento"
        
        // MARK: - Configurando o TableView
        tableViewCreate = UITableView(frame: CGRect(x: 16, y: programTableViewLabel.frame.maxY + 16, width: self.view.frame.size.width - 32, height: self.view.frame.size.height))
        tableViewCreate.delegate = self
        tableViewCreate.dataSource = self
        tableViewCreate.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        
        // MARK: - Definindo o tamanho do ScrollView
        scrollView.frame.size.width = self.view.frame.size.width
        scrollView.frame.size.height = self.view.frame.size.height
        
        
        
        // MARK: - Definindo a Imagem e titulo do Evento
        imageEvent = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height/3))
        imageEvent.image = UIImage(named: "Golfinho")
        
        titleEvent = UILabel(frame: CGRect(x: 16, y: imageEvent.frame.maxY + 16, width: self.view.frame.size.width - 32, height: 40))
        titleEvent.text = "Titulo do Evento"
        titleEvent.font = UIFont(name: "Futura", size: 25)
        titleEvent.textAlignment = .center
        titleEvent.textColor = UIColor.black
        titleEvent.numberOfLines = 2
        titleEvent.adjustsFontSizeToFitWidth = true
        
        
        // MARK: - Definindo a imagem e date do evento
        imageDate = UIImageView(frame: CGRect(x: 16, y: titleEvent.frame.maxY + 24, width: 40, height: 40))
        imageDate.image = UIImage(named: "iconDate")
        
        titleDateStartFinish = UILabel(frame: CGRect(x: imageDate.frame.maxX + 8, y: imageDate.frame.minY, width: self.view.frame.size.width - imageDate.frame.maxX - 24, height: 40))
        titleDateStartFinish.text = "Data de Inicio e Fim"
        titleDateStartFinish.font = UIFont(name: "Futura", size: 16)
        titleDateStartFinish.textAlignment = .left
        titleDateStartFinish.textColor = UIColor.black
        titleDateStartFinish.numberOfLines = 2
        titleDateStartFinish.adjustsFontSizeToFitWidth = true
        
        
        // MARK: - Definiando a imagem e lugar do evento
        imagePlace = UIImageView(frame: CGRect(x: 16, y: imageDate.frame.maxY + 8, width: 40, height: 40))
        imagePlace.image = UIImage(named: "iconPlace")
        
        titlePlace = UILabel(frame: CGRect(x: imagePlace.frame.maxX + 8, y: imagePlace.frame.minY, width: self.view.frame.size.width - imagePlace.frame.maxX - 24, height: 40))
        titlePlace.text = "São Bento do Sul"
        titlePlace.font = UIFont(name: "Futura", size: 16)
        titlePlace.textAlignment = .left
        titlePlace.textColor = UIColor.black
        titlePlace.numberOfLines = 2
        titlePlace.adjustsFontSizeToFitWidth = true
        
        
        // MARK: - Definiando a imagem e endereco do evento
        imageAdress = UIImageView(frame: CGRect(x: 16, y: imagePlace.frame.maxY + 8, width: 40, height: 40))
        imageAdress.image = UIImage(named: "iconAdress")
        
        titleAdress = UILabel(frame: CGRect(x: imageAdress.frame.maxX + 8, y: imageAdress.frame.minY, width: self.view.frame.size.width - imageAdress.frame.maxX - 24, height: 40))
        titleAdress.text = "R. Paulo Chapiewsky, 931"
        titleAdress.font = UIFont(name: "Futura", size: 16)
        titleAdress.textAlignment = .left
        titleAdress.textColor = UIColor.black
        titleAdress.adjustsFontSizeToFitWidth = true
        
        //Apenas uma linha de separacao
        lineProgView = UIView(frame: CGRect(x: 24, y: titleAdress.frame.maxY + 24, width: self.view.frame.size.width - 48, height: 1))
        lineProgView.backgroundColor = UIColor.gray
        
        
        // MARK: - Adicionando a Programacao Geral do Evento
        programTableViewLabel = UILabel(frame: CGRect(x: 32, y: lineProgView.frame.maxY + 24, width: self.view.frame.size.width - 64, height: 40))
        programTableViewLabel.text = "Programção Geral"
        programTableViewLabel.font = UIFont(name: "Futura", size: 22)
        programTableViewLabel.textAlignment = .center
        programTableViewLabel.textColor = UIColor.black
        programTableViewLabel.numberOfLines = 2
        programTableViewLabel.adjustsFontSizeToFitWidth = true
        
        
        //buttons para selecionar o dia do evento
        //button e view 1
        buttonDayOne = UIButton(frame: CGRect(x: 16, y: programTableViewLabel.frame.maxY + 8, width: (self.view.frame.size.width - 32)/3, height: 40))
        buttonDayOne.setTitle("DAy One", for: .normal)
        buttonDayOne.setTitleColor(UIColor.white, for: .normal)
        buttonDayOne.backgroundColor = UIColor(red: 0/225, green: 100/255, blue: 0/225, alpha: 1.0)
        buttonDayOne.titleLabel?.font = UIFont(name: "Futura", size: 16)
        
        viewLineDayOne = UIView(frame: CGRect(x: 16, y: buttonDayOne.frame.maxY, width: buttonDayOne.frame.size.width, height: 3))
        viewLineDayOne.backgroundColor = UIColor.yellow
        
        
        //button e view 2
        buttonDayTwo = UIButton(frame: CGRect(x: buttonDayOne.frame.maxX, y: programTableViewLabel.frame.maxY + 8, width: (self.view.frame.size.width - 32)/3, height: 40))
        buttonDayTwo.setTitle("DAy Two", for: .normal)
        buttonDayTwo.setTitleColor(UIColor.white, for: .normal)
        buttonDayTwo.backgroundColor = UIColor(red: 0/225, green: 100/255, blue: 0/225, alpha: 1.0)
        buttonDayTwo.titleLabel?.font = UIFont(name: "Futura", size: 16)
        
        viewLineDayTwo = UIView(frame: CGRect(x: buttonDayOne.frame.maxX, y: buttonDayTwo.frame.maxY, width: buttonDayTwo.frame.size.width, height: 3))
        viewLineDayTwo.backgroundColor = UIColor.yellow
        
        
        //button e view 3
        buttonDayThree = UIButton(frame: CGRect(x: buttonDayTwo.frame.maxX, y: programTableViewLabel.frame.maxY + 8, width: (self.view.frame.size.width - 32)/3, height: 40))
        buttonDayThree.setTitle("DAy Three", for: .normal)
        buttonDayThree.setTitleColor(UIColor.white, for: .normal)
        buttonDayThree.backgroundColor = UIColor(red: 0/225, green: 100/255, blue: 0/225, alpha: 1.0)
        buttonDayThree.titleLabel?.font = UIFont(name: "Futura", size: 16)
        
        viewLineDayThree = UIView(frame: CGRect(x: buttonDayTwo.frame.maxX, y: buttonDayThree.frame.maxY, width: buttonDayThree.frame.size.width, height: 3))
        viewLineDayThree.backgroundColor = UIColor.yellow
        
        //Atualizando a posicao e o tamanho do tableView
        tableViewCreate.frame =  CGRect(x: 16, y: buttonDayOne.frame.maxY + 16, width: self.view.frame.size.width - 32, height: self.view.frame.size.height/2)
        
        //Apenas uma linha de separacao
        lineProgFinishView = UIView(frame: CGRect(x: 24, y: tableViewCreate.frame.maxY + 24, width: self.view.frame.size.width - 48, height: 1))
        lineProgFinishView.backgroundColor = UIColor.gray
        
        
        // MARK: - Configurando o Mapa
        adressCompleteLabel = UILabel(frame: CGRect(x: 16, y: lineProgFinishView.frame.maxY + 16, width: self.view.frame.size.width - 32, height: 40))
        adressCompleteLabel.text = "R. Paulo Chapiewsky, 931 - Centenario, São Bento do Sul - SC, 89283-064"
        adressCompleteLabel.font = UIFont(name: "Futura", size: 16)
        adressCompleteLabel.textAlignment = .center
        adressCompleteLabel.textColor = UIColor.black
        adressCompleteLabel.numberOfLines = 2
        adressCompleteLabel.adjustsFontSizeToFitWidth = true
        
        //Adicioando o mapa na tela e configurando a localizacao
        mapa = MKMapView(frame: CGRect(x: 0, y: adressCompleteLabel.frame.maxY + 8, width: self.view.frame.size.width, height: self.view.frame.size.height/3))
        // The latitude and longitude of the city of London is assigned to location constant using the CLLocationCoordinate2d struct
        let location = CLLocationCoordinate2D(latitude: -26.2501175, longitude: -49.3515484)
        
        // The span value is made relative small, so a big portion of London is visible. The MKCoordinateRegion method defines the visible region, it is set with the setRegion method.
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location, span: span)
        mapa.setRegion(region, animated: true)
            
        // An annotation is created at the current coordinates with the MKPointAnnotation class. The annotation is added to the Map View with the addAnnotation method.
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "IFC - SBS"
        annotation.subtitle = "São Bento do Sul"
        mapa.addAnnotation(annotation)
        
        // MARK: - Descricao do evento, sobre produtor, site e contato
        //Titulo e Subtitulo do evento
        titleAndSubTitleEvent = UILabel(frame: CGRect(x: 16, y: mapa.frame.maxY + 16, width: self.view.frame.size.width - 32, height: 50))
        titleAndSubTitleEvent.text = "Titulo do Evento \n asdsada"
        titleAndSubTitleEvent.font = UIFont(name: "Futura", size: 26)
        titleAndSubTitleEvent.textAlignment = .center
        titleAndSubTitleEvent.textColor = UIColor.black
        titleAndSubTitleEvent.numberOfLines = 2
        titleAndSubTitleEvent.adjustsFontSizeToFitWidth = true
        
        //descricao do evento
        descriptionEvent = UILabel(frame: CGRect(x: 16, y: titleAndSubTitleEvent.frame.maxY + 16, width: self.view.frame.size.width - 32, height: 80))
        descriptionEvent.text = "Descricao do evento hahaha"
        descriptionEvent.font = UIFont(name: "Futura", size: 16)
        descriptionEvent.textAlignment = .left
        descriptionEvent.textColor = UIColor.black
        descriptionEvent.numberOfLines = 6
        descriptionEvent.adjustsFontSizeToFitWidth = true
        
        //link do site do evento
        siteLinkButton = UIButton(frame: CGRect(x: 16, y: descriptionEvent.frame.maxY + 8, width: (self.view.frame.size.width - 32), height: 40))
        siteLinkButton.setTitle("http://saobentodosul.ifc.edu.br", for: .normal)
        siteLinkButton.titleLabel?.font = UIFont(name: "Futura", size: 16)
        siteLinkButton.setTitleColor(UIColor.blue, for: .normal)
        
        //sobre o evento
        aboutProductorEvent = UILabel(frame: CGRect(x: 16, y: siteLinkButton.frame.maxY + 16, width: self.view.frame.size.width - 32, height: 40))
        aboutProductorEvent.text = "Sobre o produtor do evento"
        aboutProductorEvent.font = UIFont(name: "Futura", size: 16)
        aboutProductorEvent.textAlignment = .left
        aboutProductorEvent.textColor = UIColor.black
        aboutProductorEvent.numberOfLines = 2
        aboutProductorEvent.adjustsFontSizeToFitWidth = true
        
        //contato pro evento
        contactLabel = UILabel(frame: CGRect(x: 16, y: aboutProductorEvent.frame.maxY + 16, width: self.view.frame.size.width - 32, height: 40))
        contactLabel.text = "Contato"
        contactLabel.font = UIFont(name: "Futura", size: 16)
        contactLabel.textAlignment = .left
        contactLabel.textColor = UIColor.black
        contactLabel.numberOfLines = 2
        contactLabel.adjustsFontSizeToFitWidth = true
        
        // MARK: - Button de se Inscrever-se
        registerButton = UIButton(frame: CGRect(x: 32, y: contactLabel.frame.maxY + 32, width: (self.view.frame.size.width - 64), height: 40))
        registerButton.setTitle("INSCREVA-SE", for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "Futura", size: 18)
        registerButton.setTitleColor(UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0), for: .normal)
        registerButton.layer.borderWidth = 3.0
        registerButton.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        registerButton.layer.cornerRadius = registerButton.frame.height/6
        registerButton.layer.masksToBounds = true
        registerButton.addTarget(self, action: #selector(viewQrCode), for: .touchUpInside)
        
        
        // MARK: - Adicionando todos os itens dentro do Scroll View
        scrollView.addSubview(imageEvent)
        scrollView.addSubview(titleEvent)
        scrollView.addSubview(imageDate)
        scrollView.addSubview(titleDateStartFinish)
        scrollView.addSubview(imagePlace)
        scrollView.addSubview(titlePlace)
        scrollView.addSubview(imageAdress)
        scrollView.addSubview(titleAdress)
        scrollView.addSubview(lineProgView)
        scrollView.addSubview(programTableViewLabel)
        scrollView.addSubview(buttonDayOne)
        scrollView.addSubview(viewLineDayOne)
        scrollView.addSubview(buttonDayTwo)
        scrollView.addSubview(viewLineDayTwo)
        scrollView.addSubview(buttonDayThree)
        scrollView.addSubview(viewLineDayThree)
        scrollView.addSubview(tableViewCreate)
        scrollView.addSubview(lineProgFinishView)
        scrollView.addSubview(adressCompleteLabel)
        scrollView.addSubview(mapa)
        scrollView.addSubview(titleAndSubTitleEvent)
        scrollView.addSubview(descriptionEvent)
        scrollView.addSubview(siteLinkButton)
        scrollView.addSubview(aboutProductorEvent)
        scrollView.addSubview(contactLabel)
        scrollView.addSubview(registerButton)
        
        
        
        // MARK: - Reajustando o tamanho do Scroll View depois de ter adicionado todos os itens na tela
        contentSizeHeight = registerButton.frame.maxY + 16
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: contentSizeHeight)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "asdsa"
        return cell
    }
    
    @objc func viewQrCode() {
        performSegue(withIdentifier: "segueEventToQRCode", sender: self)
    }
    
}
