import Foundation
import AVFoundation

public class Speech {
    public let synthesizer = AVSpeechSynthesizer()
    
    public func speakFullWord(phrase: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !phrase.isEmpty {
                self.synthesizer.stopSpeaking(at: .immediate)
                let utterance = AVSpeechUtterance(string: phrase)
                utterance.volume = 0.95
                utterance.pitchMultiplier = 1.4
                self.synthesizer.speak(utterance)
            }
        }
        
    }
    
    public func frederickSpeak(phrase: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !phrase.isEmpty {
                self.synthesizer.stopSpeaking(at: .immediate)
                let utterance = AVSpeechUtterance(string: phrase)
                utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Daniel-compact")
                utterance.volume = 1
                utterance.pitchMultiplier = 1.8
                self.synthesizer.speak(utterance)
            }
        }
    }
    
    public func xueXueSpeak(phrase: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !phrase.isEmpty {
                self.synthesizer.stopSpeaking(at: .immediate)
                let utterance = AVSpeechUtterance(string: phrase)
                utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Karen-compact")
                utterance.volume = 1
                utterance.pitchMultiplier = 1.6
                self.synthesizer.speak(utterance)
            }
        }
    }
    
    public func evelynSpeak(phrase: String) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !phrase.isEmpty {
                self.synthesizer.stopSpeaking(at: .immediate)
                let utterance = AVSpeechUtterance(string: phrase)
                utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Tessa-compact")
                utterance.volume = 1
                utterance.pitchMultiplier = 1.4
                self.synthesizer.speak(utterance)
            }
        }
    }
}
