//
//  SoundManager.swift
//  egamelan
//
//  Created by Erlangga Anugrah Arifin on 09/03/23.
//

import Foundation
import AVFoundation

class SoundManager: NSObject, AVAudioPlayerDelegate {

  static let engine = SoundManager()

  private override init() {}

  var players = [NSURL:AVAudioPlayer]()
  var duplicatePlayers = [AVAudioPlayer]()

  func play (_ soundFileName: String) {

    let soundFileNameURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: soundFileName, ofType: "wav", inDirectory:"Sound")!)

    if duplicatePlayers.count >= 30 {
      deleteDuplicates() // memory handler, so wouldn't exceed memory limit
    }
    if let player = players[soundFileNameURL] { //player for sound has been found
      if player.isPlaying == false { //player is not in use, so use that one
        player.prepareToPlay()
        player.play()
      } else { // player is in use, create a new, duplicate, player and use that instead
        let duplicatePlayer = try! AVAudioPlayer(contentsOf: soundFileNameURL as URL)
        //use 'try!' because we know the URL worked before.
        duplicatePlayer.delegate = self
        //assign delegate for duplicatePlayer so delegate can remove the duplicate once it's stopped playing
        duplicatePlayers.append(duplicatePlayer)
        //add duplicate to array so it doesn't get removed from memory before finishing
        duplicatePlayer.prepareToPlay()
        duplicatePlayer.play()
      }
    } else { //player has not been found, create a new player with the URL if possible
      do {
        let player = try AVAudioPlayer(contentsOf: soundFileNameURL as URL)
        players[soundFileNameURL] = player
        player.prepareToPlay()
        player.play()
      } catch {
        fatalError("Could not play sound file / file not found!")
      }
    }
  }


  func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
    if let index = duplicatePlayers.firstIndex(of: player) {
      duplicatePlayers.remove(at: index)
    }
  }

  func deleteDuplicates() {
    duplicatePlayers.removeAll()
  }
}
