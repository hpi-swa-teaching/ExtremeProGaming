Class {
	#name : #EPGEffectProcessor,
	#superclass : #Object,
	#instVars : [
		'gameBoard'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/16/2024 14:37'
}
EPGEffectProcessor >> gameBoard [

	^ gameBoard.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/16/2024 14:36'
}
EPGEffectProcessor >> gameBoard: aMorph [

	gameBoard := aMorph.
]
