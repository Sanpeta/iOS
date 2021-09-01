//
//  EventosCellTableViewCell.swift
//  Eventos IFC
//
//  Created by Sidnei de Souza Junior on 08/10/19.
//  Copyright © 2019 Lab PDHS. All rights reserved.
//

import UIKit

class EventosCell: UITableViewCell {
    
    var imageBackground = UIImageView()
    var imageLogoIFEvento = UIImageView()
    var title = UILabel()
    var date = UILabel()
    var place = UILabel()
    var buttonEvent = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //TODO: ADICIONAR A IMAGEM DE BACKGROUND
        imageBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200))
        // FIXME: fazer adicionar a imagem pela URL
        let url = URL(string: "https://httpbin.org/image/png")
        let data = try? Data(contentsOf: url!)
        imageBackground.image = UIImage(data: data!)
//        imageBackground.image = UIImage(named: "Canaban")
        imageBackground.backgroundColor = UIColor.blue
        
        
        // MARK: - Imagem logo IF
        imageLogoIFEvento = UIImageView(frame: CGRect(x: self.frame.minX + 16, y: 140, width: 50, height: 50))
        // FIXME: fazer adicionar a imagem pela URL
        //        imageLogoIFEvento.image = UIImage(named: "LogoMinhaPequenaPequenaSmall")
        imageLogoIFEvento.backgroundColor = UIColor.red
        imageLogoIFEvento.contentMode = .scaleAspectFit
        imageLogoIFEvento.layer.cornerRadius = self.frame.height/10
        imageLogoIFEvento.layer.masksToBounds = true
        
        // MARK: - Ajustando o label Title
        title = UILabel(frame: CGRect(x: imageLogoIFEvento.frame.maxX + 8, y: imageLogoIFEvento.frame.minY, width: UIScreen.main.bounds.size.width - imageLogoIFEvento.frame.maxX - 24, height: 25))
        title.font = UIFont(name: "Futura", size: 14)
        title.backgroundColor = UIColor.black
        title.textColor = UIColor.white
        title.numberOfLines = 2
        title.adjustsFontSizeToFitWidth = true
        
        // MARK: - Ajustando o label Date
        date = UILabel(frame: CGRect(x: imageLogoIFEvento.frame.maxX + 8, y: title.frame.maxY + 8, width: (UIScreen.main.bounds.size.width - imageLogoIFEvento.frame.maxX - 32)/2, height: 17))
        date.font = UIFont(name: "Futura", size: 12)
        date.backgroundColor = UIColor.black
        date.textColor = UIColor.white
        date.adjustsFontSizeToFitWidth = true
        
        // MARK: - Ajustando o label Place
        place = UILabel(frame: CGRect(x: date.frame.maxX + 8, y: title.frame.maxY + 8, width: (UIScreen.main.bounds.size.width - imageLogoIFEvento.frame.maxX - 32)/2, height: 17))
        place.font = UIFont(name: "Futura", size: 12)
        place.backgroundColor = UIColor.black
        place.textColor = UIColor.white
        place.adjustsFontSizeToFitWidth = true
        
        // MARK: - Ajustando o button ver evento
//        buttonEvent = UIButton(frame: CGRect(x: place.frame.maxX + 8, y: title.frame.minY, width: UIScreen.main.bounds.size.width - title.frame.maxX - 32, height: 40))
//        buttonEvent.backgroundColor = UIColor.white
//        buttonEvent.setTitle("VER EVENTO", for: .normal)
//        buttonEvent.titleLabel?.font = UIFont(name: "Futura", size: 10)
//        buttonEvent.setTitleColor(UIColor.black, for: .normal)
//        //        buttonEvent.layer.borderWidth = 1.0
//        buttonEvent.layer.cornerRadius = self.frame.height/2
//        buttonEvent.layer.masksToBounds = true
        
        // MARK: - Adicionando os itens na cell
        self.contentView.addSubview(imageBackground)
        self.contentView.addSubview(title)
        self.contentView.addSubview(imageLogoIFEvento)
        self.contentView.addSubview(date)
        self.contentView.addSubview(place)
        self.contentView.addSubview(buttonEvent)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
