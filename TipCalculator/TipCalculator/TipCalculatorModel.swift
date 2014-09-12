//
//  TipCalculatorMobel.swift
//  TipCalculator
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.

class TipCalculatorModel {
    //2
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total:Double,taxPct:Double){
        self.total = total
        self.taxPct = taxPct
       //subtatol = total / (taxPct + 1)
    }
    func calcTipWithTipPct(tipPct:Double) ->Double {
        return subtotal * tipPct
    }
    func returnPossibleTips() ->[Int: Double] {
        let possibleTipsInferred = [0.15,0.18,0.20]
        let possibleTipsExplicit:[Double] = [0.15,0.18,0.20]
        //var numberOfItems = possibleTipsInferred.count
    
        
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred{
            let intPct = Int(possibleTip * 100)
            
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}