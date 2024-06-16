Class {
	#name : #EPGDebtArea,
	#superclass : #Morph,
	#instVars : [
		'game',
		'type',
		'currentDebt'
	],
	#category : #ExtremeProGaming
}

{
	#category : #features,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:15'
}
EPGDebtArea >> addTechnicalDebt [

	| newDebt |
	newDebt := EPGDebt new.
	newDebt
		setType: self type;
		area: self;
		game: self game;
		position: (self randomPositionFor: newDebt).

	self game gameBoard addMorph: newDebt.
	self game addDependent: newDebt.
	self incrementDebt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:10'
}
EPGDebtArea >> currentDebt [

	^ currentDebt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:10'
}
EPGDebtArea >> currentDebt: aNumber [

	currentDebt := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:18'
}
EPGDebtArea >> decrementDebt [

	self currentDebt: self currentDebt - 1.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:30'
}
EPGDebtArea >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:30'
}
EPGDebtArea >> game: aGame [

	game := aGame.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:17'
}
EPGDebtArea >> incrementDebt [

	self currentDebt: self currentDebt + 1.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:12'
}
EPGDebtArea >> initialize [ 

	super initialize.
	
	self 
		currentDebt: 0;
		extent: 375 @ 225.
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
