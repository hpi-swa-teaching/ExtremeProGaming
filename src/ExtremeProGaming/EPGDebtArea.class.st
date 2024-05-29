Class {
	#name : #EPGDebtArea,
	#superclass : #Morph,
	#instVars : [
		'type'
	],
	#category : #ExtremeProGaming
}

{
	#category : #features,
	#'squeak_changestamp' : 'JP 5/29/2024 23:01'
}
EPGDebtArea >> addTechnicalDebt [

	| newDebt |
	
	
	
	newDebt := EPGDebt new.
	newDebt setType: self type;
		position: (self randomPositionFor: newDebt).
	self addMorph: newDebt.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/29/2024 22:32'
}
EPGDebtArea >> initialize [ 

	super initialize.
	
	self 
		extent: 375 @ 225.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/29/2024 23:01'
}
EPGDebtArea >> randomPositionFor: aMorph [

	| range |

	range := self extent  - aMorph extent.
	^ self position +  ((0 to: range x ) atRandom @ (0 to: range y) atRandom).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/29/2024 22:29'
}
EPGDebtArea >> type [
	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/29/2024 22:29'
}
EPGDebtArea >> type: anObject [
	type := anObject
]
