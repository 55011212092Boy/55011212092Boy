
class TipCalculator {
    //2
    let total: Double
    let taxPct: Double
    let subtatal: Double
    
    //3
    init(total:Double,taxPct:Double){
        self.total = total
        self.taxPct = taxPct
        subtatal = total / (taxPct + 1)
    }
    //4
    func calcTipWithTipPct(tipPct:Double) ->Double {
        return subtatal * tipPct
    }
    //1
    func returnPossibleTips() -> [Int: Double] {
        let possibleTipsInterred = [0.15,0.18,0.20]
        let possibleTipsExplicit:[Double] = [0.15,0.18,0.20]
        
        //2
        var retval = Dictionary<Int,Double>()
        for possibleTip in possibleTipsInterred {
            let intPct = Int(possibleTip * 100)
            //3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
    
}

//6
let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
tipCalc.returnPossibleTips()
