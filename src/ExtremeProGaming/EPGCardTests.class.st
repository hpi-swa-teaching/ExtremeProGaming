Class {
	#name : #EPGCardTests,
	#superclass : #TestCase,
	#instVars : [
		'game'
	],
	#category : #ExtremeProGaming
}

{
	#category : #initialize,
	#'squeak_changestamp' : 'sv 6/17/2024 15:21'
}
EPGCardTests >> setUp [

	game := EPGGame new game.
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'sv 6/17/2024 16:44'
}
EPGCardTests >> testCardFreezing [

	game freezeCards.
	self assert: true equals: game cards first isLocked.
	self assert: true equals: game cards first isFrozen.
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'sv 6/17/2024 15:19'
}
EPGCardTests >> testCardsExistence [

	self assert: false equals: game cards isEmpty.
]
