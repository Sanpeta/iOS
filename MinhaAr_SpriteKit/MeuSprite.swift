//
//  MeuSprite.swift
//  MinhaAr_SpriteKit
//
//  Created by Sidnei de Souza Junior on 12/09/17.
//  Copyright © 2017 Sidnei de Souza Junior. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class MeuSprite: SKSpriteNode {
    
    var posicao = CGPoint()
    var rotacao = CGFloat()
    var escala = CGFloat()
    var caminhoAtlas: String = ""
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    func configuraSprite() {
    
        let meuAtlas = SKTextureAtlas(named: caminhoAtlas)
        var framesTextura = [SKTexture]()
        
        for i in 1...meuAtlas.textureNames.count {
            let nomeTextura = "\(caminhoAtlas)\(i)"
            framesTextura.append(meuAtlas.textureNamed(nomeTextura))
        }
        
        let animacao = SKAction.animate(with: framesTextura, timePerFrame: 0.1, resize: true, restore: true)
        let repete = SKAction.repeatForever(animacao)
        
        self.position = posicao
        self.setScale(escala)
        self.zRotation = rotacao
        
        self.run(repete)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
