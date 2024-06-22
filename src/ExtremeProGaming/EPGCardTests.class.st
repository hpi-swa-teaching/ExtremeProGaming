Class {
	#name : #EPGCardTests,
	#superclass : #TestCase,
	#instVars : [
		'game'
	],
	#category : #'ExtremeProGaming-Tests'
}

{
	#category : #initialize,
	#'squeak_changestamp' : 'sv 6/17/2024 15:21'
}
EPGCardTests >> setUp [

	game := EPGGame new game.
]
