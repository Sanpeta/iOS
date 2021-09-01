//
//  ViewController.swift
//  Minha AR_SpriteKit
//
//  Created by Sidnei de Souza Junior on 11/09/17.
//  Copyright © 2017 Sidnei de Souza Junior. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    var minhaARView = ARSCNView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minhaARView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(minhaARView)
        // Set the view's delegate

        minhaARView.delegate = self
        // Show statistics such as fps and node count
        minhaARView.showsStatistics = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SCNScene(named: "SceneKit.scn") {
            minhaARView.scene = scene
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        // Run the view's session
        minhaARView.session.run(configuration)
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
}
