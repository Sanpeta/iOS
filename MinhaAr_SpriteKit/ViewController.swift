//
//  ViewController.swift
//  MinhaAr_SpriteKit
//
//  Created by Sidnei de Souza Junior on 02/08/17.
//  Copyright © 2017 Sidnei de Souza Junior. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    let listaPersonagem = ["felpudo", "fofura", "uruca", "bugado", "bang"]
    let scale: [CGFloat] = [0.1, 0.1, 0.085, 0.15, 0.2]
    var contador = 0
    
    @IBOutlet var sceneView: ARSKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        configuration.planeDetection = .horizontal
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        let meuSprite = MeuSprite(texture: nil, color: UIColor.black, size: CGSize())
        meuSprite.caminhoAtlas = listaPersonagem[contador]
        meuSprite.escala = scale[contador]
        meuSprite.configuraSprite()
        
        contador += 1
        if contador > 4 {
            contador = 3
        }
        
        let nodeVazio = SKNode()
        
        nodeVazio.addChild(criarParticula(posicao: nodeVazio.position))
        nodeVazio.addChild(meuSprite)
        
        return nodeVazio
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func criarParticula(posicao: CGPoint) -> SKEmitterNode {
        
        let texturaPArcila = SKTexture(imageNamed: "texturaParticulaCoracao")
        let emissor = SKEmitterNode()
        
        emissor.position = posicao
        emissor.particleScale = 0.1
        emissor.particlePositionRange = CGVector(dx: 10, dy: 1)
        
        emissor.particleTexture = texturaPArcila
        emissor.particleBirthRate = 1000
        emissor.numParticlesToEmit = 100
        emissor.particleLifetime = 1.0
        
        emissor.emissionAngle = CGFloat(Double.pi / 2)
        emissor.emissionAngleRange = CGFloat(Double.pi / 4)
        
        emissor.particleScale = 0.05
        emissor.particleScaleRange = 0.09
        
        emissor.xAcceleration = 0
        emissor.yAcceleration = -1000
        
        emissor.particleSpeed = 500
        emissor.particleSpeedRange = 500
        
        emissor.particleRotation = 0
        emissor.particleRotationSpeed = 0
        emissor.particleRotationRange = CGFloat(Double.pi)
        
        emissor.particleColorAlphaSpeed = 1.0
        emissor.particleColorAlphaRange = 0.1
        
        emissor.particleAlphaSequence = SKKeyframeSequence(keyframeValues: [1, 1, 0], times: [0, 0.75, 1])
        
        return emissor
    }
    
}
