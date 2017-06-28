//
//  GameCenterManager.swift
//  Pods
//
//  Created by Qi Chen on 6/28/17.
//
//

import UIKit
import GameKit

open class GameCenterManager: NSObject, GKGameCenterControllerDelegate {
    
    public static let shared = GameCenterManager()
    
    open func authenticate() {
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = { viewController, error in
            if let vc = viewController, let rootViewController = UIApplication.rootViewController {
                rootViewController.present(vc, animated: true, completion: nil)
            } else if localPlayer.isAuthenticated {
                print("GameCenterManager authentication succeeded.")
            } else {
                print("GameCenterManager authentication failed.")
                if let err = error {
                    print(err.localizedDescription)
                }
            }
        }
    }
    
    open func report(score s: Int64, leaderboardIdentifier identifier: String) {
        if GKLocalPlayer.localPlayer().isAuthenticated {
            let score = GKScore(leaderboardIdentifier: identifier)
            score.value = s
            GKScore.report([score]) { (error) in
                if let err = error {
                    print(err.localizedDescription)
                }
            }
        }
    }
    
    open func showLeaderboard(leaderboardIdentifier identifier: String) {
        let gameCenterViewController = GKGameCenterViewController()
        gameCenterViewController.gameCenterDelegate = self
        gameCenterViewController.viewState = .leaderboards
        gameCenterViewController.leaderboardIdentifier = identifier
        if let rootViewController = UIApplication.rootViewController {
            rootViewController.present(gameCenterViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - GKGameCenterControllerDelegate
    
    public func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }

}
