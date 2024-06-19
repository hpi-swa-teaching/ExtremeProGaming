Class {
	#name : #EPGExtraBug,
	#superclass : #EPGEffect,
	#category : #ExtremeProGaming
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/19/2024 19:06'
}
EPGExtraBug class >> newWithGame: aGame [

	^ self new 
		game: aGame; 
		amount: 1.
]

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/19/2024 19:54'
}
EPGExtraBug >> apply [

	self game addBugCard.
]
