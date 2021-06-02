import Foundation
import UIKit

public class AnimalViewController: UIViewController {
    // MARK: - Attributes
    private var creator = UICreator()
    private var speech = Speech()
    
    // MARK: - Outlets
    private var guideView: UIView!
    private var guideLabel: UILabel!
    
    private var animalImageView: UIImageView!
    private var animalImageLabel: UILabel!
    
    private var quizView: UIView!
    private var quizLabel1: UILabel!
    
    private var answer1: UIButton!
    private var answer2: UIButton!
    private var answer3: UIButton!
    
    private var evelyn: UILabel!
    private var evelynLabel: UILabel!
    private var evelynView: UIView!
    private var evelynMessage: UILabel!
    
    private var linda: UILabel!
    private var lindaNameLabel: UILabel!
    private var lindaView: UIView!
    private var lindaMessage: UILabel!
    
    // MARK: - Life Cycles
    public override func loadView() {
        super.loadView()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        view.frame.size = CGSize(width: 600, height: 700)
        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
    }
    
    // MARK: - Init Elements Methods
    private func setupElements() {
        
        guideView = creator.createView(width: 550, height: 45)
        view.addSubview(guideView)
        
        NSLayoutConstraint.activate([
            guideView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            guideView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        guideLabel = creator.createLabel(text: Text.Informations.Ant.guess, size: 15)
        guideView.addSubview(guideLabel)
        
        NSLayoutConstraint.activate([
            guideLabel.topAnchor.constraint(equalTo: guideView.topAnchor, constant: 10),
            guideLabel.trailingAnchor.constraint(equalTo: guideView.trailingAnchor, constant: -5),
            guideLabel.leadingAnchor.constraint(equalTo: guideView.leadingAnchor, constant: 5),
            guideLabel.centerXAnchor.constraint(equalTo: guideView.centerXAnchor),
            guideLabel.centerYAnchor.constraint(equalTo: guideView.centerYAnchor)
        ])
        
        initQuizElements()
        initButtonElements()
    }
    
    private func initQuizElements() {
        animalImageView = creator.createImageView(name: Text.Images.questionMark, width: 400, height: 200)
        view.addSubview(animalImageView)
        
        NSLayoutConstraint.activate([
            animalImageView.topAnchor.constraint(equalTo: guideView.bottomAnchor, constant: 20),
            animalImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        animalImageLabel = creator.createLabel(text: Text.Credits.antImage, textColor: UIColor.white, size: 13, alpha: 0)
        view.addSubview(animalImageLabel)
        
        NSLayoutConstraint.activate([
            animalImageLabel.topAnchor.constraint(equalTo: animalImageView.bottomAnchor, constant: 5),
            animalImageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        quizView = creator.createView(width: 500, height: 250, borderWidth: 3, borderColor: UIColor.black.cgColor)
        view.addSubview(quizView)
        
        NSLayoutConstraint.activate([
            quizView.topAnchor.constraint(equalTo: animalImageLabel.bottomAnchor, constant: 20),
            quizView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        quizLabel1 = creator.createLabel(text: Text.Informations.Ant.quizQuestion, size: 18)
        quizView.addSubview(quizLabel1)
        
        NSLayoutConstraint.activate([
            quizLabel1.topAnchor.constraint(equalTo: quizView.topAnchor, constant: 10),
            quizLabel1.trailingAnchor.constraint(equalTo: quizView.trailingAnchor, constant: -5),
            quizLabel1.leadingAnchor.constraint(equalTo: quizView.leadingAnchor, constant: 5),
            quizLabel1.centerXAnchor.constraint(equalTo: quizView.centerXAnchor),
            quizLabel1.centerYAnchor.constraint(equalTo: quizView.centerYAnchor)
        ])
    }
    
    private func initButtonElements() {
        answer1 = creator.createButton(title: Text.Buttons.crab, backgroundColor: #colorLiteral(red: 0.9791838527, green: 0.8357049823, blue: 0.4429068565, alpha: 1), width: 120, height: 50, alpha: 1)
        answer1.setTitleColor(UIColor.black, for: .normal)
        answer1.addTarget(self, action: #selector(answer1Action), for: .touchUpInside)
        view.addSubview(answer1)
        
        answer2 = creator.createButton(title: Text.Buttons.ant, backgroundColor: #colorLiteral(red: 0.9791838527, green: 0.8357049823, blue: 0.4429068565, alpha: 1), width: 120, height: 50, alpha: 1)
        answer2.setTitleColor(UIColor.black, for: .normal)
        answer2.addTarget(self, action: #selector(answer2Action), for: .touchUpInside)
        view.addSubview(answer2)
        
        answer3 = creator.createButton(title: Text.Buttons.ladybug, backgroundColor: #colorLiteral(red: 0.9791838527, green: 0.8357049823, blue: 0.4429068565, alpha: 1), width: 120, height: 50, alpha: 1)
        answer3.setTitleColor(UIColor.black, for: .normal)
        answer3.addTarget(self, action: #selector(answer3Action), for: .touchUpInside)
        view.addSubview(answer3)
        
        NSLayoutConstraint.activate([
            answer1.topAnchor.constraint(equalTo: quizView.bottomAnchor, constant: 20),
            answer1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            answer2.topAnchor.constraint(equalTo: quizView.bottomAnchor, constant: 20),
            answer2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            answer3.topAnchor.constraint(equalTo: quizView.bottomAnchor, constant: 20),
            answer3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    private func performAfterCorrect() {
        initEvelynElements()
        initLindaElements()
        setButtonEnabledOff()
        animateMoralMessages()
    }
    
    private func initEvelynElements() {
        evelynView = creator.createView(width: 450, height: 100, cornerRadius: 10, borderWidth: 2, borderColor: UIColor.black.cgColor, alpha: 0)
        view.addSubview(evelynView)
        
        evelyn = creator.createLabel(text: Text.Characters.Emojis.evelyn, size: 60, alpha: 0)
        view.addSubview(evelyn)
        
        evelynLabel = creator.createLabel(text: Text.Characters.Names.evelyn, size: 17, alpha: 0)
        view.addSubview(evelynLabel)
        
        evelynMessage = creator.createLabel(text: Text.Messages.Evelyn.message, size: 19, weight: .semibold, alpha: 0)
        evelynView.addSubview(evelynMessage)
        
        activateEvelynConstraint()
    }
    
    private func activateEvelynConstraint() {
        NSLayoutConstraint.activate([
            self.evelynView.topAnchor.constraint(equalTo: self.animalImageLabel.bottomAnchor, constant: 40),
            self.evelynView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -70),
            self.evelyn.trailingAnchor.constraint(equalTo: self.evelynView.leadingAnchor, constant: 30),
            self.evelyn.topAnchor.constraint(equalTo: self.animalImageView.bottomAnchor, constant: 20),
            self.evelynLabel.bottomAnchor.constraint(equalTo: self.evelynView.topAnchor, constant: 2),
            self.evelynLabel.leadingAnchor.constraint(equalTo: self.evelyn.trailingAnchor, constant: 5),
            self.evelynMessage.centerYAnchor.constraint(equalTo: self.evelynView.centerYAnchor),
            self.evelynMessage.centerXAnchor.constraint(equalTo: self.evelynView.centerXAnchor),
            self.evelynMessage.leadingAnchor.constraint(equalTo: self.evelynView.leadingAnchor, constant: 30),
            self.evelynMessage.trailingAnchor.constraint(equalTo: self.evelynView.trailingAnchor, constant: -5),
        ])
    }
    
    private func initLindaElements() {
        lindaView = creator.createView(width: 450, height: 150, cornerRadius: 10, borderWidth: 2, borderColor: UIColor.black.cgColor, alpha: 0)
        view.addSubview(lindaView)

        linda = creator.createLabel(text: Text.Characters.Emojis.linda, size: 60, alpha: 0)
        view.addSubview(linda)

        lindaNameLabel = creator.createLabel(text: Text.Characters.Names.linda, size: 17, alpha: 0)
        view.addSubview(lindaNameLabel)

        lindaMessage = creator.createLabel(text: Text.Messages.Linda.animalMessage1, size: 19, weight: .semibold, alpha: 0)
        lindaView.addSubview(lindaMessage)

        activateLindaConstraint()
    }
    
    private func activateLindaConstraint() {
        NSLayoutConstraint.activate([
            self.lindaView.topAnchor.constraint(equalTo: self.evelynView.bottomAnchor, constant: 30),
            self.lindaView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 70),
            self.linda.leadingAnchor.constraint(equalTo: self.lindaView.trailingAnchor, constant: -30),
            self.linda.topAnchor.constraint(equalTo: self.evelynView.bottomAnchor, constant: 10),
            self.lindaNameLabel.bottomAnchor.constraint(equalTo: self.lindaView.topAnchor, constant: 2),
            self.lindaNameLabel.trailingAnchor.constraint(equalTo: self.linda.leadingAnchor, constant: 5),
            self.lindaMessage.centerYAnchor.constraint(equalTo: self.lindaView.centerYAnchor),
            self.lindaMessage.centerXAnchor.constraint(equalTo: self.lindaView.centerXAnchor),
            self.lindaMessage.leadingAnchor.constraint(equalTo: self.lindaView.leadingAnchor, constant: 10),
            self.lindaMessage.trailingAnchor.constraint(equalTo: self.lindaView.trailingAnchor, constant: -30),
        ])
    }
    
    private func setZeroAlphaElements() {
        quizView.alpha = 0
        quizLabel1.alpha = 0
        answer1.alpha = 0
        answer2.alpha = 0
        answer3.alpha = 0
    }
    
    private func removeElementsFromSuperView() {
        quizView.removeFromSuperview()
        quizLabel1.removeFromSuperview()
        answer1.removeFromSuperview()
        answer2.removeFromSuperview()
        answer3.removeFromSuperview()
    }
    
    private func setButtonEnabledOff() {
        answer1.isEnabled = false
        answer3.isEnabled = false
    }
    
    func shake(targetView: UIView, duration: Double? = 0.4) {
        targetView.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(withDuration: duration ?? 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            targetView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
}

// MARK: - Button Action Methods
extension AnimalViewController {
    @objc func answer1Action() {
        UIView.animate(withDuration: 0.2) {
            self.answer1.backgroundColor = UIColor.red
        }
        shake(targetView: answer1)
    }
    
    @objc func answer2Action() {
        self.answer2.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        transition.duration = 1
        self.animalImageView.layer.add(transition, forKey: kCATransition)
        self.animalImageView.image = UIImage(named: "ant-photo.jpg")! as UIImage
        
        UIView.animate(withDuration: 1) {
            self.animalImageLabel.alpha = 1
        }
        
        performAfterCorrect()
    }
    
    @objc func answer3Action() {
        UIView.animate(withDuration: 1) {
            self.answer3.backgroundColor = UIColor.red
        }
        shake(targetView: answer3)
    }
}

// MARK: - Moral Message Methods
extension AnimalViewController  {
    private func animateMoralMessages() {
        UIView.animate(withDuration: 0.5,animations: {
            self.guideLabel.alpha = 0
        }, completion: { (_) in
            UIView.animate(withDuration: 1, delay: 0.5,animations: {
                self.guideLabel.text = Text.Informations.Ant.youCorrect
                self.guideLabel.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 0.5, delay: 1,animations: {
                    self.guideLabel.alpha = 0
                    self.setZeroAlphaElements()
                }, completion: { (_) in
                    UIView.animate(withDuration: 1, delay: 0.5,animations: {
                        self.removeElementsFromSuperView()
                        self.guideLabel.text = Text.Informations.Ant.whatCanWeLearn
                        self.guideLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
                        self.guideLabel.alpha = 1
                    }, completion: { (_) in
                        UIView.animate(withDuration: 0.5, delay: 0.5,animations: {
                            self.evelynView.alpha = 1
                            self.evelyn.alpha = 1
                            self.evelynLabel.alpha = 1
                        }, completion: { (_) in
                            UIView.animate(withDuration: 1, delay: 1,animations: {
                                self.evelynMessage.alpha = 1
                                self.speech.evelynSpeak(phrase: self.evelynMessage.text!)
                            }, completion: { (_) in
                                UIView.animate(withDuration: 0.5, delay: 3,animations: {
                                    self.lindaView.alpha = 1
                                    self.linda.alpha = 1
                                    self.lindaNameLabel.alpha = 1
                                }, completion: { (_) in
                                    UIView.animate(withDuration: 1, delay: 0.5,animations: {
                                        self.lindaMessage.alpha = 1
                                        self.speech.speakFullWord(phrase: self.lindaMessage.text!)
                                    }, completion: { (_) in
                                        UIView.animate(withDuration: 0.5, delay: 4,animations: {
                                            self.lindaMessage.alpha = 0
                                        }, completion: { (_) in
                                            UIView.animate(withDuration: 1, delay: 0.5,animations: {
                                                self.lindaMessage.text = Text.Messages.Linda.animalMessage2
                                                self.lindaMessage.alpha = 1
                                                self.speech.speakFullWord(phrase: self.lindaMessage.text!)
                                            }, completion: { (_) in
                                                sleep(5)
                                                self.navigateToEndVC()
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
    
    private func navigateToEndVC() {
        let endVC = EndingViewController()
        endVC.modalPresentationStyle = .fullScreen
        self.present(endVC, animated: true, completion: nil)
    }
}
