//
//  ViewController.swift
//  NFC Scan
//
//  Created by Sidnei de Souza Junior on 19/11/19.
//  Copyright © 2019 Sidnei de Souza Junior. All rights reserved.
//

import UIKit
import CoreNFC
import YouTubePlayer
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate
//, NFCNDEFReaderSessionDelegate
{
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    var bannerView: GADBannerView!
    
    var nfcSession: NFCNDEFReaderSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var videoPlayer = YouTubePlayerView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
                
        let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=EgotZZZ0LlY")
        videoPlayer.loadVideoURL(myVideoURL! as URL)
        
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-7411089297547317/3357903962"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        
        view.addSubview(bannerView)
        view.addSubview(videoPlayer)
        
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
     bannerView.translatesAutoresizingMaskIntoConstraints = false
     view.addSubview(bannerView)
     view.addConstraints(
       [NSLayoutConstraint(item: bannerView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: bottomLayoutGuide,
                           attribute: .top,
                           multiplier: 1,
                           constant: 0),
        NSLayoutConstraint(item: bannerView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0)
       ])
    }
    
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("adViewDidReceiveAd")
    }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
        didFailToReceiveAdWithError error: GADRequestError) {
      print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print("adViewWillLeaveApplication")
    }

//    @IBAction func scanPressed(_ sender: Any) {
//        nfcSession = NFCNDEFReaderSession.init(delegate: self, queue: nil, invalidateAfterFirstRead: true)
//        nfcSession?.begin()
//    }
//    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
//        print("The session was invalidated: \(error)")
//    }
//
//    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
//        var result = ""
//        for payload in messages[0].records {
//            result += String.init(data: payload.payload.advanced(by: 3), encoding: .utf8)!
//        }
//
//        DispatchQueue.main.async {
//            self.messageLabel.text = result
//        }
//    }
    
}

