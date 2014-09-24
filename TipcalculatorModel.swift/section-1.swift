class TipCalculator {
    //2
    var total: Double
    var taxPct: Double
    var subtatal: Double
    
    
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
    func returnPossibleTips() ->[Int: Double] {
        let possibleTipsInferred = [0.15,0.18,0.20]
        let possibleTipsExplicit:[Double] = [0.15,0.18,0.20]
        var numberOfItems = possibleTipsInferred.count
        
        //2
        var retval = [Int: Double]()
        for possibleTip in possibleTipsInferred{
            let intPct = Int(possibleTip * 100)
            //3
            retval[intPct] = calcTipWithTipPct(possibleTip)
            }
            return retval
    }
}

