Class {
	#name : #EPGDebtArea,
	#superclass : #Morph,
	#instVars : [
		'gameBoard',
		'type'
	],
	#category : #ExtremeProGaming
}

{
	#category : #features,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:43'
}
EPGDebtArea >> addTechnicalDebt [

	| newDebt |
	newDebt := EPGDebt new.
	newDebt
		setType: self type;
		position: (self randomPositionFor: newDebt).
		
	self gameBoard addMorph: newDebt.
	self gameBoard addDependent: newDebt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:01'
}
EPGDebtArea >> gameBoard [

	^ gameBoard.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:02'
}
EPGDebtArea >> gameBoard: aGameBoard [

	gameBoard := aGameBoard.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:01'
}
EPGDebtArea >> initialize [ 

	super initialize.
	
	self extent: 375 @ 225.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:02'
}
EPGDebtArea >> randomPositionFor: aMorph [

	| range |
	range := self extent - aMorph extent.
	^ self position + ((0 to: range x) atRandom @ (0 to: range y) atRandom).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:02'
}
EPGDebtArea >> type [

	^ type.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:02'
}
EPGDebtArea >> type: aType [

	type := aType.
]
