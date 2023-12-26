//
//  main.swift
//  ProtocolsAndDelegates
//
//  Created by Berkay Çaylı on 26.12.2023.
//

import Foundation

protocol AdvancedLifeSupport {
    // kalp masajı yapan fonksiyon
    func performCPR()
}

// acil çağrılara yanıt veren eleman
class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    // durum değerlendirmesi yap
    func assessSitutation() {
        print("can you tell me what happened")
    }
    
    // acil durum müdahalesi yap
    func medicalEmergency()  {
        delegate?.performCPR()
    }
}

struct Paramedic : AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("perform chest massage from paramedic")
    }
    
    
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("perform chest massage from doctor")
    }
    
    func useSteteschope()  {
        print("using steteschope")
    }
}

let berkay = EmergencyCallHandler()
let emir = Paramedic(handler: berkay)
let doctorAngelaYu = Doctor(handler: berkay)

berkay.assessSitutation()
berkay.medicalEmergency()



