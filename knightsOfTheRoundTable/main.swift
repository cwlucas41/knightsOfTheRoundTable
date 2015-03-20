//
//  main.swift
//  knightsOfTheRoundTable
//
//  Created by Christopher Lucas on 1/16/15.
//  Copyright (c) 2015 CWL. All rights reserved.
//

import Darwin

func generateRandomArrayOfLength(length:Int) -> Array<Double> {
	var randomValues:Array = [Double]()
	for knight in 0..<length {
		let randomAmount = arc4random()
		randomValues.append(Double(randomAmount))
	}
	return randomValues
}

func makeNewValuesArrayFromOldValuesArray(oldValues: Array<Double>) -> Array<Double> {
	
	var newValues:Array = [Double]()
	
	for (knightIndex, Amount) in enumerate(oldValues) {
		
		var newAmount:Double = 0
		
		if Double(knightIndex) == 0 {
			newAmount = (oldValues[1] / 2) + (oldValues[oldValues.count-1] / 2)
		} else if Double(knightIndex) == Double(oldValues.count-1) {
			newAmount = (oldValues [0] / 2) + (oldValues[oldValues.count - 2] / 2)
		} else {
			newAmount = (oldValues[knightIndex-1] / 2) + (oldValues[knightIndex+1] / 2)
		}
		newValues.append(newAmount)
	}
	return newValues
}

func simulateRoundtableFor(NumberOfKnights numberOfKnights:Int, AndNumberOfIterations numberOfIterations:Int = 1000) -> Array<Double> {
	var oldValues = generateRandomArrayOfLength(numberOfKnights)
	
	for var i = 0; i < numberOfIterations; ++i {
		oldValues = makeNewValuesArrayFromOldValuesArray(oldValues)
	}
	return oldValues
}

func simulateForTwoTo(Knights knights:Int) {
	for n in 2...knights {
			println("\(n) knights:")
			println(simulateRoundtableFor(NumberOfKnights: n))
			println()
		}
}

simulateForTwoTo(Knights: 20)

