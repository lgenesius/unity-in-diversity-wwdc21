import Foundation
import UIKit

protocol RockPaperScissorDelegate: class {
    func calculateScore()
    func performDisplayAfterGame()
}

public class RockPaperScissorPoint {
    private var player1Score: Int
    private var player2Score: Int
    
    weak var delegate: RockPaperScissorDelegate?
    
    init() {
        player1Score = 3
        player2Score = 3
    }
    
    public func getPlayer1Score() -> Int {
        return player1Score
    }
    
    public func getPlayer2Score() -> Int {
        return player2Score
    }
    
    public func remove1ScoreFromPlayer1() {
        self.player1Score -= 1
    }
    
    public func remove1ScoreFromPlayer2() {
        self.player2Score -= 1
    }
}
