//
//  QRCodeViewController.swift
//  Eventos IFC
//
//  Created by Sidnei de Souza Junior on 10/10/19.
//  Copyright © 2019 Lab PDHS. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {

    var scrollView = UIScrollView()
    var QRCodeImage = UIImageView()
    var lineStartView = UIView()
    var viewWithData = UIView()
    var labelName = UILabel()
    var labelCPF = UILabel()
    var labelCity = UILabel()
    var labelEvent = UILabel()
    var labelCampu = UILabel()
    var labelDate = UILabel()
    var buttonSave = UIButton()
    
    var contentSizeHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MAKE: - Definindo o tamanho do ScrollView
        scrollView.frame.size.width = self.view.frame.size.width
        scrollView.frame.size.height = self.view.frame.size.height
        
        // MAKE: - Fazendo a imagem do QRCODE
        QRCodeImage = UIImageView(frame: CGRect(x: 64, y: 32, width: self.view.frame.size.width - 128, height: self.view.frame.size.height/4))
        QRCodeImage.image = generateQRCode(from: "Lets leart swift")
        
        //Separacao por uma linha
        lineStartView = UIView(frame: CGRect(x: 24, y: QRCodeImage.frame.maxY + 24, width: self.view.frame.size.width - 48, height: 1))
        lineStartView.backgroundColor = UIColor.gray
        
        
        //MAKE: - Gerando o View com os componentes dentro dela
        viewWithData = UIView(frame: CGRect(x: 16, y: lineStartView.frame.maxY + 16, width: self.view.frame.width - 32, height: self.view.frame.height/3))
        viewWithData.layer.borderColor = UIColor.black.cgColor
        viewWithData.layer.cornerRadius = viewWithData.frame.height/20
        viewWithData.layer.borderWidth = 2.0
        viewWithData.layer.masksToBounds = true
        
        //Nome do Aluno
        labelName = UILabel(frame: CGRect(x: 16, y: 8, width: viewWithData.frame.size.width - 32, height: 30))
        labelName.text = "Sidnei de Souza Junior"
        labelName.font = UIFont(name: "Futura", size: 18)
        labelName.textAlignment = .left
        labelName.textColor = UIColor.gray
        labelName.numberOfLines = 1
        labelName.adjustsFontSizeToFitWidth = true
        
        //CPF do Aluno
        labelCPF = UILabel(frame: CGRect(x: 16, y: labelName.frame.maxY + 8, width: viewWithData.frame.size.width - 32, height: 30))
        labelCPF.text = "123.456.789-10"
        labelCPF.font = UIFont(name: "Futura", size: 18)
        labelCPF.textAlignment = .left
        labelCPF.textColor = UIColor.gray
        labelCPF.numberOfLines = 1
        labelCPF.adjustsFontSizeToFitWidth = true
        
        //Cidade do Evento
        labelCity = UILabel(frame: CGRect(x: 16, y: labelCPF.frame.maxY + 8, width: viewWithData.frame.size.width - 32, height: 30))
        labelCity.text = "São Bento do Sul"
        labelCity.font = UIFont(name: "Futura", size: 18)
        labelCity.textAlignment = .left
        labelCity.textColor = UIColor.gray
        labelCity.numberOfLines = 1
        labelCity.adjustsFontSizeToFitWidth = true
        
        //Qual Evento
        labelEvent = UILabel(frame: CGRect(x: 16, y: labelCity.frame.maxY + 8, width: labelCity.frame.size.width - 32, height: 30))
        labelEvent.text = "XII MICTI"
        labelEvent.font = UIFont(name: "Futura", size: 18)
        labelEvent.textAlignment = .left
        labelEvent.textColor = UIColor.gray
        labelEvent.numberOfLines = 1
        labelEvent.adjustsFontSizeToFitWidth = true
        
        //Qual Campus
        labelCampu = UILabel(frame: CGRect(x: 16, y: labelEvent.frame.maxY + 8, width: viewWithData.frame.size.width - 32, height: 30))
        labelCampu.text = "Câmpus São Bento do Sul"
        labelCampu.font = UIFont(name: "Futura", size: 18)
        labelCampu.textAlignment = .left
        labelCampu.textColor = UIColor.gray
        labelCampu.numberOfLines = 1
        labelCampu.adjustsFontSizeToFitWidth = true
        
        //Data do evento
        labelDate = UILabel(frame: CGRect(x: 16, y: labelCampu.frame.maxY + 8, width: viewWithData.frame.size.width - 32, height: 30))
        labelDate.text = "13 a 15 Novembro"
        labelDate.font = UIFont(name: "Futura", size: 18)
        labelDate.textAlignment = .left
        labelDate.textColor = UIColor.gray
        labelDate.numberOfLines = 1
        labelDate.adjustsFontSizeToFitWidth = true
        
        viewWithData.frame.size.height =  CGFloat(labelDate.frame.maxY + 8)
        
        
        //MAKE: - Fazendo o Button de salvar no dispositivo
        buttonSave = UIButton(frame: CGRect(x: 32, y: viewWithData.frame.maxY + 32, width: (self.view.frame.size.width - 64), height: 50))
        buttonSave.setTitle("SALVAR NO DISPOSITIVO", for: .normal)
        buttonSave.titleLabel?.font = UIFont(name: "Futura", size: 18)
        buttonSave.setTitleColor(UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0), for: .normal)
        buttonSave.layer.borderWidth = 3.0
        buttonSave.layer.borderColor = UIColor.init(red: 70/255, green: 144/255, blue: 53/255, alpha: 1.0).cgColor
        buttonSave.layer.cornerRadius = buttonSave.frame.height/6
        buttonSave.layer.masksToBounds = true
        
        
        //MAKE: - Adicionando os componentes na VIEW
        self.view.addSubview(scrollView)
        scrollView.addSubview(QRCodeImage)
        scrollView.addSubview(lineStartView)
        scrollView.addSubview(viewWithData)
        viewWithData.addSubview(labelName)
        viewWithData.addSubview(labelCPF)
        viewWithData.addSubview(labelCity)
        viewWithData.addSubview(labelEvent)
        viewWithData.addSubview(labelCampu)
        viewWithData.addSubview(labelDate)
        scrollView.addSubview(buttonSave)
        
        contentSizeHeight = buttonSave.frame.maxY + 16
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: contentSizeHeight)
        
    }
    
    
    func generateQRCode(from string: String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return UIImage()
    }

}
