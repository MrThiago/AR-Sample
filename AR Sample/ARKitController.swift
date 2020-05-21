//
//  ARKitController.swift
//  AR Sample
//
//  Created by Thiago Gouvea on 21/05/2020.
//  Copyright © 2020 ThiagoGouvea. All rights reserved.
//

import Foundation
import SceneKit
import ARKit

class ARKitController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Show Features points (plane surfaces)
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showPhysicsFields]
        
        // Automatically light up scenes
        sceneView.autoenablesDefaultLighting = true
        
        makeMars()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        if ARWorldTrackingConfiguration.isSupported {
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = .horizontal
            
            // Run the view's session
            sceneView.session.run(configuration)
        }
        else  {
           let configuration = AROrientationTrackingConfiguration()
            
            // Run the view's session
            sceneView.session.run(configuration)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    
    
    func makeMars(){
        // Planet Object
        let sphereMars = SCNSphere(radius: 0.2)

        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")

        sphereMars.materials = [material]

        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -1)
        node.geometry = sphereMars

        sceneView.scene.rootNode.addChildNode(node)
    }
}
