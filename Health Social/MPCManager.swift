//
//  MPCManager.swift
//  MultiPeerConnectivity
//
//  Created by Gabriel Theodoropoulos on 11/1/15 and modified by Ori Benhamou on 24/3/15
//

import UIKit
import MultipeerConnectivity


protocol MPCManagerDelegate {
    func foundPeer()
    
    func lostPeer()
    
    func invitationWasReceived(fromPeer: String)
    
    func connectedWithPeer(peerID: MCPeerID)
}


class MPCManager: NSObject, MCSessionDelegate, MCNearbyServiceBrowserDelegate, MCNearbyServiceAdvertiserDelegate {

    var delegate: MPCManagerDelegate?
    
    var session: MCSession!
    
    var peer: MCPeerID!
    
    var browser: MCNearbyServiceBrowser!
    
    var advertiser: MCNearbyServiceAdvertiser!
    
    var foundPeers = [MCPeerID]()
    
    var invitationHandler: ((Bool, MCSession!)->Void)!
    
    var current: Person!
    
    
    override init() {
        super.init()
        
        current = Person.currentUser()
        
        peer = MCPeerID(displayName: UIDevice.currentDevice().name)
        
        if current != nil {
            peer = MCPeerID(displayName: current.userName)
        }

        session = MCSession(peer: peer)
        session.delegate = self
        
        browser = MCNearbyServiceBrowser(peer: peer, serviceType: "healthsoc-mpc")
        browser.delegate = self
        
        advertiser = MCNearbyServiceAdvertiser(peer: peer, discoveryInfo: nil, serviceType: "healthsoc-mpc")
        advertiser.delegate = self
    }
    
    
    // MARK: MCNearbyServiceBrowserDelegate method implementation
    
    func browser(browser: MCNearbyServiceBrowser!, foundPeer peerID: MCPeerID!, withDiscoveryInfo info: [NSObject : AnyObject]!) {
        foundPeers.append(peerID)
        
        delegate?.foundPeer()
    }
    
    
    func browser(browser: MCNearbyServiceBrowser!, lostPeer peerID: MCPeerID!) {
        for (index, aPeer) in enumerate(foundPeers){
            if aPeer == peerID {
                foundPeers.removeAtIndex(index)
                break
            }
        }
        
        delegate?.lostPeer()
    }
    
    
    func browser(browser: MCNearbyServiceBrowser!, didNotStartBrowsingForPeers error: NSError!) {
        println(error.localizedDescription)
    }
    
    
    // MARK: MCNearbyServiceAdvertiserDelegate method implementation
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
        self.invitationHandler = invitationHandler
        
        delegate?.invitationWasReceived(peerID.displayName)
    }
    
    
    func advertiser(advertiser: MCNearbyServiceAdvertiser!, didNotStartAdvertisingPeer error: NSError!) {
        println(error.localizedDescription)
    }
    
    
    // MARK: MCSessionDelegate method implementation
    
    func session(session: MCSession!, peer peerID: MCPeerID!, didChangeState state: MCSessionState) {
        switch state{
        case MCSessionState.Connected:
            println("Connected to session: \(session)")
            delegate?.connectedWithPeer(peerID)
            
        case MCSessionState.Connecting:
            println("Connecting to session: \(session)")
            
        default:
            println("Did not connect to session: \(session)")
        }
    }
    
    
    func session(session: MCSession!, didReceiveData data: NSData!, fromPeer peerID: MCPeerID!) {
        let dictionary: [String: AnyObject] = ["data": data, "fromPeer": peerID]
        NSNotificationCenter.defaultCenter().postNotificationName("receivedMPCDataNotification", object: dictionary)
    }
    
    
    func session(session: MCSession!, didStartReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!) { }
    
    func session(session: MCSession!, didFinishReceivingResourceWithName resourceName: String!, fromPeer peerID: MCPeerID!, atURL localURL: NSURL!, withError error: NSError!) { }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!, withName streamName: String!, fromPeer peerID: MCPeerID!) { }
    
    
    
    // MARK: Custom method implementation
    
    func sendData(dictionaryWithData dictionary: Dictionary<String, String>, toPeer targetPeer: MCPeerID) -> Bool {
        let dataToSend = NSKeyedArchiver.archivedDataWithRootObject(dictionary)
        let peersArray = NSArray(object: targetPeer)
        var error: NSError?
        
        if !session.sendData(dataToSend, toPeers: peersArray, withMode: MCSessionSendDataMode.Reliable, error: &error) {
            println(error?.localizedDescription)
            return false
        }
        
        return true
    }
    
}
