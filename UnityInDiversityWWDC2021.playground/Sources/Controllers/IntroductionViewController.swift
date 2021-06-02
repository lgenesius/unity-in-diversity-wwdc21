import Foundation
import PlaygroundSupport
import UIKit
import AVFoundation

public class IntroductionViewController: UIViewController {
    // MARK: - Audio Player
    public var audioPlayer: AVAudioPlayer?
    
    // MARK: - Attribute
    private var creator = UICreator()
    private var speech = Speech()
    
    // MARK: - Outlets
    private var chatView: UIView!
    private var linda: UILabel!
    private var nameLabel: UILabel!
    private var chatting: UILabel!
    
    private var nextButton: UIButton!
    
    // MARK: - Life Cycles
    public override func loadView() {
        super.loadView()
        
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = CGSize(width: 600, height: 700)
        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
        initElements()
        animateElements()
    }
    
    // MARK: - Methods
    private func playMusic() {
        let musicUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "morningdew.mp3", ofType: nil)!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: musicUrl)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.volume = 0.6
            audioPlayer?.play()
        } catch {
            print("Error in playing music \(error.localizedDescription)")
        }
    }
     
    private func initElements() {
        chatView = creator.createView(width: 500, height: 450, backgroundColor: UIColor.white, borderWidth: 5, borderColor: UIColor.black.cgColor, alpha: 0)
        view.addSubview(chatView)
        
        linda = creator.createLabel(text: Text.Characters.Emojis.linda, size: 150, alpha: 0)
        view.addSubview(linda)
        
        nameLabel = creator.createLabel(text: Text.Characters.Names.linda, size: 23, alpha: 0)
        view.addSubview(nameLabel)
        
        chatting = creator.createLabel(text: Text.Informations.Introduction.introduction, size: 30, weight: .bold, alpha: 0)
        chatView.addSubview(chatting)
    
        nextButton = creator.createButton(title: Text.Buttons.letsMove, backgroundColor: UIColor.orange, width: 200, height: 50)
        nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        view.addSubview(nextButton)
        
        activateConstraint()
    }
    
    @objc func nextButtonAction(sender: UIButton!) {
        self.navigateToRainbow()
    }
    
    private func navigateToRainbow() {
        let rainbowVC = RainbowViewController()
        rainbowVC.modalPresentationStyle = .fullScreen
        self.present(rainbowVC, animated: true, completion: nil)
    }
    
    private func activateConstraint() {
        NSLayoutConstraint.activate([
            chatView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            linda.bottomAnchor.constraint(equalTo: chatView.bottomAnchor, constant: 80),
            linda.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: linda.bottomAnchor, constant: -10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatting.centerYAnchor.constraint(equalTo: chatView.centerYAnchor),
            chatting.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chatting.leadingAnchor.constraint(equalTo: chatView.leadingAnchor, constant: 20),
            chatting.trailingAnchor.constraint(equalTo: chatView.trailingAnchor, constant: -20),
            nextButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 40),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func animateElements() {
        UIView.animate(withDuration: 0.5, animations: {
            self.chatView.alpha = 1
            self.linda.alpha = 1
        }) { (_) in
            UIView.animate(withDuration: 1, delay: 0.5, animations: {
                self.chatting.alpha = 1
                self.speech.speakFullWord(phrase : Text.Speech.hello)
            }, completion: { (_) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.nameLabel.alpha = 1
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
                        self.chatting.alpha = 0
                    }, completion: { (_) in
                        UIView.animate(withDuration: 1, delay:1, animations: {
                            self.chatting.text = Text.Informations.Introduction.worldCondition
                            self.chatting.alpha = 1
                            self.speech.speakFullWord(phrase : self.chatting.text!)
                        }, completion: { (_) in
                            UIView.animate(withDuration: 0.5, delay:4, animations: {
                                self.chatting.alpha = 0
                            }, completion: { (_) in
                                UIView.animate(withDuration: 1, delay:0.5, animations: {
                                    self.chatting.text = Text.Informations.Introduction.teachUnityInDiversity
                                    self.chatting.alpha = 1
                                    self.speech.speakFullWord(phrase : self.chatting.text!)
                                }, completion: { (_) in
                                    UIView.animate(withDuration: 0.5, delay:3, animations: {
                                        self.chatting.alpha = 0
                                    }, completion: { (_) in
                                        UIView.animate(withDuration: 1, delay:0.5, animations: {
                                            self.chatting.text = Text.Informations.Introduction.wannaComeAlong
                                            self.chatting.alpha = 1
                                            self.nextButton.alpha = 1
                                            self.speech.speakFullWord(phrase : self.chatting.text!)
                                        }, completion: { (_) in
                                            
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
}
