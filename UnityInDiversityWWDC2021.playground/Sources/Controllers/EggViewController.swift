import Foundation
import UIKit
import PlaygroundSupport

public class EggViewController: UIViewController {
    // MARK: - Attributes
    private var creator = UICreator()
    private var speech = Speech()
    private var rpsPoint = RockPaperScissorPoint()
    
    private let rockPaperScissor = ["✊", "🖐", "✌️"]
    private var countDown = 10
    private var timer: Timer?
    private var countCheck = 1
    
    private var countWhiteEggTapped = 0
    private var countBrownEggTapped = 0
    
    // MARK: - Outlets
    private var guideView: UIView!
    private var guideLabel: UILabel!
    
    private var whiteEggImage: UIImageView!
    private var brownEggImage: UIImageView!
    
    private var whiteEggLabel: UILabel!
    private var brownEggLabel: UILabel!
    
    private var yourSuit: UILabel!
    private var yourSuitName: UILabel!
    private var xueXueSuit: UILabel!
    private var xueXueSuitName: UILabel!
    
    private var informationLabel: UILabel!
    
    private var rockButton: UIButton!
    private var paperButton: UIButton!
    private var scissorButton: UIButton!
    
    private var noteView: UIView!
    private var noteLabel: UILabel!
    
    private var xueXue: UILabel!
    private var xueXueNameLabel: UILabel!
    private var xueXueView: UIView!
    private var xueXueMessage: UILabel!
    
    private var linda: UILabel!
    private var lindaNameLabel: UILabel!
    private var lindaView: UIView!
    private var lindaMessage: UILabel!
    
    private var nextButton: UIButton!
    
    // MARK: - Life Cycles
    public override func loadView() {
        super.loadView()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        view.frame.size = CGSize(width: 600, height: 700)
        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        rpsPoint.delegate = self
        
        initElements()
        createAfterGameElements()
    }
    
    // MARK: - Init Elements Methods
    private func initElements() {
        guideView = creator.createView(width: 550, height: 60)
        view.addSubview(guideView)
        
        NSLayoutConstraint.activate([
            guideView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            guideView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        guideLabel = creator.createLabel(text: Text.Informations.Egg.playWithXueXue, size: 15)
        guideView.addSubview(guideLabel)
        
        NSLayoutConstraint.activate([
            guideLabel.topAnchor.constraint(equalTo: guideView.topAnchor, constant: 10),
            guideLabel.trailingAnchor.constraint(equalTo: guideView.trailingAnchor, constant: -5),
            guideLabel.leadingAnchor.constraint(equalTo: guideView.leadingAnchor, constant: 5),
            guideLabel.centerXAnchor.constraint(equalTo: guideView.centerXAnchor),
            guideLabel.centerYAnchor.constraint(equalTo: guideView.centerYAnchor)
        ])
        
        createImageElements()
        createSuitElements()
        
        informationLabel = creator.createLabel(text: Text.Informations.Egg.chooseYourChoice, textColor: UIColor.blue, size: 20)
        view.addSubview(informationLabel)
        
        NSLayoutConstraint.activate([
            informationLabel.topAnchor.constraint(equalTo: yourSuitName.bottomAnchor, constant: 10),
            informationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        createButtonElements()
        createNoteElements()
    }
    
    private func createImageElements() {
        whiteEggImage = creator.createImageView(name: Text.Images.whiteEggPhase1, width: 150, height: 200)
        view.addSubview(whiteEggImage)
        
        whiteEggLabel = creator.createLabel(text: Text.Informations.Egg.yourEgg, size: 13, weight: .semibold)
        view.addSubview(whiteEggLabel)
        
        brownEggImage = creator.createImageView(name: Text.Images.brownEggPhase1, width: 150, height: 200)
        view.addSubview(brownEggImage)
        
        brownEggLabel = creator.createLabel(text: Text.Informations.Egg.xueXueEgg, size: 13, weight: .semibold)
        view.addSubview(brownEggLabel)
        
        NSLayoutConstraint.activate([
            whiteEggImage.topAnchor.constraint(equalTo: guideView.bottomAnchor, constant: 20),
            whiteEggImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            whiteEggLabel.topAnchor.constraint(equalTo: whiteEggImage.bottomAnchor, constant: 5),
            whiteEggLabel.centerXAnchor.constraint(equalTo: whiteEggImage.centerXAnchor),
            brownEggImage.topAnchor.constraint(equalTo: guideView.bottomAnchor, constant: 20),
            brownEggImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            brownEggLabel.topAnchor.constraint(equalTo: brownEggImage.bottomAnchor, constant: 5),
            brownEggLabel.centerXAnchor.constraint(equalTo: brownEggImage.centerXAnchor)
        ])
    }
    
    private func createSuitElements() {
        yourSuit = creator.createLabel(text: Text.Characters.Emojis.scissor, size: 100)
        view.addSubview(yourSuit)
        
        yourSuitName = creator.createLabel(text: Text.Informations.Egg.yourChoice, size: 15)
        view.addSubview(yourSuitName)
        
        xueXueSuit = creator.createLabel(text: Text.Characters.Emojis.scissor, size: 100)
        view.addSubview(xueXueSuit)
        
        xueXueSuitName = creator.createLabel(text: Text.Informations.Egg.xueXueChoice, size: 15)
        view.addSubview(xueXueSuitName)
        
        NSLayoutConstraint.activate([
            yourSuit.topAnchor.constraint(equalTo: whiteEggLabel.bottomAnchor, constant: 20),
            yourSuit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            yourSuitName.topAnchor.constraint(equalTo: yourSuit.bottomAnchor, constant: 5),
            yourSuitName.centerXAnchor.constraint(equalTo: yourSuit.centerXAnchor),
            xueXueSuit.topAnchor.constraint(equalTo: brownEggLabel.bottomAnchor, constant: 20),
            xueXueSuit.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            xueXueSuitName.topAnchor.constraint(equalTo: xueXueSuit.bottomAnchor, constant: 5),
            xueXueSuitName.centerXAnchor.constraint(equalTo: xueXueSuit.centerXAnchor)
        ])
    }
    
    private func createButtonElements() {
        rockButton = creator.createButton(title: Text.Buttons.rock, backgroundColor: #colorLiteral(red: 0, green: 0.8146532774, blue: 1, alpha: 1), width: 120, height: 50, alpha: 1)
        rockButton.addTarget(self, action: #selector(rockButtonAction), for: .touchUpInside)
        view.addSubview(rockButton)
        
        paperButton = creator.createButton(title: Text.Buttons.paper, backgroundColor: #colorLiteral(red: 0, green: 0.8146532774, blue: 1, alpha: 1), width: 120, height: 50, alpha: 1)
        paperButton.addTarget(self, action: #selector(paperButtonAction), for: .touchUpInside)
        view.addSubview(paperButton)
        
        scissorButton = creator.createButton(title: Text.Buttons.scissor, backgroundColor: #colorLiteral(red: 0, green: 0.8146532774, blue: 1, alpha: 1), width: 120, height: 50, alpha: 1)
        scissorButton.addTarget(self, action: #selector(scissorButtonAction), for: .touchUpInside)
        view.addSubview(scissorButton)
        
        NSLayoutConstraint.activate([
            rockButton.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 20),
            rockButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            paperButton.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 20),
            paperButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scissorButton.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 20),
            scissorButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    private func createNoteElements() {
        noteView = creator.createView(width: 550, height: 65)
        view.addSubview(noteView)
        
        noteLabel = creator.createLabel(text: Text.Informations.Egg.note, size: 15)
        noteView.addSubview(noteLabel)
        
        NSLayoutConstraint.activate([
            noteView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5),
            noteView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noteLabel.topAnchor.constraint(equalTo: noteView.topAnchor, constant: 5),
            noteLabel.trailingAnchor.constraint(equalTo: noteView.trailingAnchor, constant: -5),
            noteLabel.leadingAnchor.constraint(equalTo: noteView.leadingAnchor, constant: 5),
            noteLabel.centerXAnchor.constraint(equalTo: noteView.centerXAnchor),
        ])
    }
    
    private func createAfterGameElements() {
        
        initXueXue()
        initLinda()
        initNextButton()
    }
    
    private func initXueXue() {
        xueXueView = creator.createView(width: 450, height: 100, cornerRadius: 10, borderWidth: 2, borderColor: UIColor.black.cgColor, alpha: 0)
        view.addSubview(xueXueView)
        
        xueXue = creator.createLabel(text: Text.Characters.Emojis.xueXue, size: 60, alpha: 0)
        view.addSubview(self.xueXue)
        
        xueXueNameLabel = creator.createLabel(text: Text.Characters.Names.xueXue, size: 17, alpha: 0)
        view.addSubview(xueXueNameLabel)
        
        xueXueMessage = creator.createLabel(text: Text.Messages.XueXue.message, size: 19, weight: .semibold, alpha: 0)
        xueXueView.addSubview(xueXueMessage)
        
        activateXueXueConstraint()
    }
    
    private func activateXueXueConstraint() {
        NSLayoutConstraint.activate([
            self.xueXueView.topAnchor.constraint(equalTo: self.whiteEggImage.bottomAnchor, constant: 40),
            self.xueXueView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70),
            self.xueXue.trailingAnchor.constraint(equalTo: self.xueXueView.leadingAnchor, constant: 30),
            self.xueXue.topAnchor.constraint(equalTo: self.whiteEggImage.bottomAnchor, constant: 20),
            self.xueXueNameLabel.bottomAnchor.constraint(equalTo: self.xueXueView.topAnchor, constant: 2),
            self.xueXueNameLabel.leadingAnchor.constraint(equalTo: self.xueXue.trailingAnchor, constant: 5),
            self.xueXueMessage.centerYAnchor.constraint(equalTo: self.xueXueView.centerYAnchor),
            self.xueXueMessage.centerXAnchor.constraint(equalTo: self.xueXueView.centerXAnchor),
            self.xueXueMessage.leadingAnchor.constraint(equalTo: self.xueXueView.leadingAnchor, constant: 30),
            self.xueXueMessage.trailingAnchor.constraint(equalTo: self.xueXueView.trailingAnchor, constant: -5),
        ])
    }
    
    private func initLinda() {
        lindaView = creator.createView(width: 450, height: 150, cornerRadius: 10, borderWidth: 2, borderColor: UIColor.black.cgColor, alpha: 0)
        view.addSubview(lindaView)

        linda = creator.createLabel(text: Text.Characters.Emojis.linda, size: 60, alpha: 0)
        view.addSubview(self.linda)

        lindaNameLabel = creator.createLabel(text: Text.Characters.Names.linda, size: 17, alpha: 0)
        view.addSubview(lindaNameLabel)

        lindaMessage = creator.createLabel(text: Text.Messages.Linda.eggMessage1, size: 19, weight: .semibold, alpha: 0)
        lindaView.addSubview(lindaMessage)
        
        activateLindaConstraint()
    }
    
    private func activateLindaConstraint() {
        NSLayoutConstraint.activate([
            self.lindaView.topAnchor.constraint(equalTo: self.xueXueView.bottomAnchor, constant: 30),
            self.lindaView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
            self.linda.leadingAnchor.constraint(equalTo: self.lindaView.trailingAnchor, constant: -30),
            self.linda.topAnchor.constraint(equalTo: self.xueXueView.bottomAnchor, constant: 10),
            self.lindaNameLabel.bottomAnchor.constraint(equalTo: self.lindaView.topAnchor, constant: 2),
            self.lindaNameLabel.trailingAnchor.constraint(equalTo: self.linda.leadingAnchor, constant: 5),
            self.lindaMessage.centerYAnchor.constraint(equalTo: self.lindaView.centerYAnchor),
            self.lindaMessage.centerXAnchor.constraint(equalTo: self.lindaView.centerXAnchor),
            self.lindaMessage.leadingAnchor.constraint(equalTo: self.lindaView.leadingAnchor, constant: 10),
            self.lindaMessage.trailingAnchor.constraint(equalTo: self.lindaView.trailingAnchor, constant: -30),
        ])
    }
    
    private func initNextButton() {
        nextButton = creator.createButton(title: Text.Buttons.letsGo, backgroundColor: UIColor.orange, width: 200, height: 50)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: lindaView.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setAlphaZeroElements() {
        self.whiteEggLabel.alpha = 0
        self.brownEggLabel.alpha = 0
        self.yourSuit.alpha = 0
        self.xueXueSuit.alpha = 0
        self.yourSuitName.alpha = 0
        self.xueXueSuitName.alpha = 0
        self.informationLabel.alpha = 0
        self.scissorButton.alpha = 0
        self.paperButton.alpha = 0
        self.rockButton.alpha = 0
        self.noteView.alpha = 0
        self.noteLabel.alpha = 0
        
    }
    
    private func removeGameElements() {
        self.brownEggLabel.removeFromSuperview()
        self.whiteEggLabel.removeFromSuperview()
        self.yourSuit.removeFromSuperview()
        self.xueXueSuit.removeFromSuperview()
        self.yourSuitName.removeFromSuperview()
        self.xueXueSuitName.removeFromSuperview()
        self.informationLabel.removeFromSuperview()
        self.scissorButton.removeFromSuperview()
        self.paperButton.removeFromSuperview()
        self.rockButton.removeFromSuperview()
        self.noteView.removeFromSuperview()
        self.noteLabel.removeFromSuperview()
    }
}

// MARK: - Suit Animation Methods
extension EggViewController {
    @objc func nextButtonAction() {
        let animalVC = AnimalViewController()
        animalVC.modalPresentationStyle = .fullScreen
        self.present(animalVC, animated: true, completion: nil)
    }
    
    @objc func rockButtonAction() {
        enabledOffButton()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        
        performPlayerAction(rockPaperScissor: Text.Characters.Emojis.rock)
    }
    
    @objc func paperButtonAction() {
        enabledOffButton()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        
        performPlayerAction(rockPaperScissor: Text.Characters.Emojis.paper)
    }
    
    @objc func scissorButtonAction() {
        enabledOffButton()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        
        performPlayerAction(rockPaperScissor: Text.Characters.Emojis.scissor)
    }

    private func performPlayerAction(rockPaperScissor: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.xueXueChoice()
            self.yourSuit.text = rockPaperScissor
            self.countDown = 10
            self.calculateScore()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                (self.rpsPoint.getPlayer1Score() == 0 || self.rpsPoint.getPlayer2Score() == 0) ? self.performDisplayAfterGame() : self.enabledOnButton()
            }
        }
    }
    
    @objc func timerFired() {
        countDown -= 1
        
        if countCheck == 1 {
            yourSuit.text = Text.Characters.Emojis.paper
            xueXueSuit.text = Text.Characters.Emojis.scissor
        } else if countCheck == 2 {
            yourSuit.text = Text.Characters.Emojis.rock
            xueXueSuit.text = Text.Characters.Emojis.paper
        } else if countCheck == 3 {
            yourSuit.text = Text.Characters.Emojis.scissor
            xueXueSuit.text = Text.Characters.Emojis.rock
        }
        
        countCheck += 1
        
        if countCheck > 3 { countCheck = 1 }
        
        if countDown == 0 { timer?.invalidate() }
    }
    
    private func enabledOffButton() {
        informationLabel.text = "Please wait..."
        informationLabel.textColor = UIColor.darkGray
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorButton.isEnabled = false
        
        rockButton.backgroundColor = UIColor.lightGray
        paperButton.backgroundColor = UIColor.lightGray
        scissorButton.backgroundColor = UIColor.lightGray
    }
    
    private func enabledOnButton() {
        informationLabel.text = "Choose your choice by clicking one of the blue buttons"
        informationLabel.textColor = UIColor.blue
        
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorButton.isEnabled = true
        
        rockButton.backgroundColor = #colorLiteral(red: 0, green: 0.8146532774, blue: 1, alpha: 1)
        paperButton.backgroundColor = #colorLiteral(red: 0, green: 0.8146532774, blue: 1, alpha: 1)
        scissorButton.backgroundColor = #colorLiteral(red: 0, green: 0.8146532774, blue: 1, alpha: 1)
    }
    
    private func xueXueChoice() {
        let randomNumber = Int.random(in: 0...(rockPaperScissor.count - 1))
        xueXueSuit.text = rockPaperScissor[randomNumber]
    }
}

// MARK: - Changing Image Methods
extension EggViewController {
    private func breakOtherEgg() {
        if rpsPoint.getPlayer1Score() == 0 {
            brownEggImage.shake(0.1)
            brownEggImage.image = UIImage(named: Text.Images.brownEggPhase4) as UIImage?
        } else {
            whiteEggImage.shake(0.1)
            whiteEggImage.image = UIImage(named: Text.Images.whiteEggPhase4) as UIImage?
        }
    }
    
    private func changeEggImage() {
        if rpsPoint.getPlayer1Score() == 2 {
            whiteEggImage.image = UIImage(named: Text.Images.whiteEggPhase2) as UIImage?
        } else if rpsPoint.getPlayer1Score() == 1 {
            whiteEggImage.image = UIImage(named: Text.Images.whiteEggPhase3) as UIImage?
        } else if rpsPoint.getPlayer1Score() == 0 {
            whiteEggImage.image = UIImage(named: Text.Images.whiteEggPhase4) as UIImage?
        }
        
        if rpsPoint.getPlayer2Score() == 2 {
            brownEggImage.image = UIImage(named: Text.Images.brownEggPhase2) as UIImage?
        } else if rpsPoint.getPlayer2Score() == 1 {
            brownEggImage.image = UIImage(named: Text.Images.brownEggPhase3) as UIImage?
        } else if rpsPoint.getPlayer2Score() == 0 {
            brownEggImage.image = UIImage(named: Text.Images.brownEggPhase4) as UIImage?
        }
    }
}

// MARK: - Shake Method
extension UIView {
    func shake(_ duration: Double? = 0.4) {
        self.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(withDuration: duration ?? 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

// MARK: - RockPaperScissor Delegate
extension EggViewController: RockPaperScissorDelegate {
    
    func calculateScore() {
        informationLabel.textColor = UIColor.red
        if yourSuit.text == Text.Characters.Emojis.rock {
            if xueXueSuit.text == Text.Characters.Emojis.rock {
                informationLabel.text = Text.Informations.Egg.draw
            }
            else if xueXueSuit.text == Text.Characters.Emojis.scissor {
                informationLabel.text = Text.Informations.Egg.youWin
                rpsPoint.remove1ScoreFromPlayer2()
                brownEggImage.shake(0.5)
            }
            else {
                informationLabel.text = Text.Informations.Egg.youLose
                rpsPoint.remove1ScoreFromPlayer1()
                whiteEggImage.shake(0.5)
            }
        }
        else if yourSuit.text == Text.Characters.Emojis.paper {
            if xueXueSuit.text == Text.Characters.Emojis.rock {
                informationLabel.text = Text.Informations.Egg.youWin
                rpsPoint.remove1ScoreFromPlayer2()
                brownEggImage.shake(0.5)
            }
            else if xueXueSuit.text == Text.Characters.Emojis.scissor {
                informationLabel.text = Text.Informations.Egg.youLose
                rpsPoint.remove1ScoreFromPlayer1()
                whiteEggImage.shake(0.5)
            }
            else {
                informationLabel.text = Text.Informations.Egg.draw
            }
        }
        else if yourSuit.text == Text.Characters.Emojis.scissor {
            if xueXueSuit.text == Text.Characters.Emojis.rock {
                informationLabel.text = Text.Informations.Egg.youLose
                rpsPoint.remove1ScoreFromPlayer1()
                whiteEggImage.shake(0.5)
            }
            else if xueXueSuit.text == Text.Characters.Emojis.scissor {
                informationLabel.text = Text.Informations.Egg.draw
            }
            else {
                informationLabel.text = Text.Informations.Egg.youWin
                rpsPoint.remove1ScoreFromPlayer2()
                brownEggImage.shake(0.5)
            }
        }
        changeEggImage()
    }
    
    func performDisplayAfterGame() {
        var string = ""
        
        if rpsPoint.getPlayer1Score() == 0 {
            string = Text.Informations.Egg.loseTheGame
        } else if rpsPoint.getPlayer2Score() == 0 {
            string = Text.Informations.Egg.winTheGame
        }
        
        animateMoralMessage(string: string)
    }
    
    private func animateMoralMessage(string: String) {
        UIView.animate(withDuration: 0.5, animations: {
            self.guideLabel.alpha = 0
            self.enabledOffButton()
            self.informationLabel.text = Text.Informations.Egg.gameEnd
        }, completion: { (_) in
            UIView.animate(withDuration: 0.5, delay: 0.5,animations: {
                self.guideLabel.text = string
                self.guideLabel.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 0.5, delay: 1,animations: {
                    self.guideLabel.alpha = 0
                }, completion: { (_) in
                    UIView.animate(withDuration: 1, delay: 0.5,animations: {
                        self.guideLabel.text = Text.Informations.Egg.breakOtherEgg
                        self.guideLabel.alpha = 1
                    }, completion: { (_) in
                        UIView.animate(withDuration: 0.5, delay: 1,animations: {
                            self.breakOtherEgg()
                            self.setAlphaZeroElements()
                        }, completion: { (_) in
                            UIView.animate(withDuration: 0.5, delay: 0.5,animations: {
                                self.removeGameElements()
                                self.guideLabel.alpha = 0
                            }, completion: { (_) in
                                UIView.animate(withDuration: 1, delay: 0.5,animations: {
                                    self.guideLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
                                    self.guideLabel.text = Text.Informations.Egg.whatCanWeLearn
                                    self.guideLabel.alpha = 1
                                }, completion: { (_) in
                                    UIView.animate(withDuration: 0.5, delay: 0.5,animations: {
                                        self.xueXue.alpha = 1
                                        self.xueXueView.alpha = 1
                                        self.xueXueNameLabel.alpha = 1
                                    }, completion: { (_) in
                                        UIView.animate(withDuration: 1, delay: 0.5,animations: {
                                            self.speech.xueXueSpeak(phrase: self.xueXueMessage.text!)
                                            self.xueXueMessage.alpha = 1
                                        }, completion: { (_) in
                                            UIView.animate(withDuration: 0.5, delay: 4,animations: {
                                                self.lindaView.alpha = 1
                                                self.linda.alpha = 1
                                                self.lindaNameLabel.alpha = 1
                                            }, completion: { (_) in
                                                UIView.animate(withDuration: 1, delay: 0.5,animations: {
                                                    self.speech.speakFullWord(phrase: Text.Speech.regardless)
                                                    self.lindaMessage.alpha = 1
                                                }, completion: { (_) in
                                                    UIView.animate(withDuration: 0.5, delay: 3,animations: {
                                                        self.lindaMessage.alpha = 0
                                                    }, completion: { (_) in
                                                        UIView.animate(withDuration: 1, delay: 0.5,animations: {
                                                            self.lindaMessage.text = Text.Messages.Linda.eggMessage2
                                                            self.lindaMessage.alpha = 1
                                                            self.speech.speakFullWord(phrase: self.lindaMessage.text!)
                                                        }, completion: { (_) in
                                                            UIView.animate(withDuration: 0.5, delay: 2,animations: {
                                                                self.lindaMessage.alpha = 0
                                                            }, completion: { (_) in
                                                                UIView.animate(withDuration: 1, delay: 0.5,animations: {
                                                                    self.lindaMessage.text = Text.Messages.Linda.eggShallMove
                                                                    self.speech.speakFullWord(phrase: self.lindaMessage.text!)
                                                                    self.lindaMessage.alpha = 1
                                                                    self.nextButton.alpha = 1
                                                                })
                                                            })
                                                        })
                                                    })
                                                })
                                            })
                                        })
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    }
}
