//
//  InterfaceController.swift
//  my first watchOS app WatchKit Extension
//
//  Created by Sidnei de Souza Junior on 06/09/17.
//  Copyright © 2017 Sidnei de Souza Junior. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
