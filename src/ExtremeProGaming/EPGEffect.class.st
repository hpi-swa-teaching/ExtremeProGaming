Class {
	#name : #EPGEffect,
	#superclass : #Object,
	#instVars : [
		'game',
		'amount'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/19/2024 21:41'
}
EPGEffect class >> newFromJSON: aJSONFormattedCard [

	^ self new amount: (aJSONFormattedCard at: 'effectAmount').
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/19/2024 21:52'
}
EPGEffect class >> newWithGame: aGame [

	^ self new game: aGame.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/18/2024 23:11'
}
EPGEffect class >> newWithGame: aGame amount: aNumber [

	^ self new 
		game: aGame;
		amount: aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:06'
}
EPGEffect >> amount [

	^ amount.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:07'
}
EPGEffect >> amount: aNumber [

	amount := aNumber.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/18/2024 22:24'
}
EPGEffect >> apply [

	^ self subclassResponsibility.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:23'
}
EPGEffect >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:24'
}
EPGEffect >> game: aGame [

	game := aGame.
]
