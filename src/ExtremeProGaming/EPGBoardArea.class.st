Class {
	#name : #EPGBoardArea,
	#superclass : #Morph,
	#instVars : [
		'gameBoard'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JA 5/16/2024 11:56'
}
EPGBoardArea >> bsinitializeField: aNumber [

	"create and return morph with the width aNumber"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JA 5/16/2024 12:12'
}
EPGBoardArea >> calculateAreaWidth: aString [

		^ (gameBoard class areaRatio at: aString) * gameBoard extent x.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:57'
}
EPGBoardArea >> gameBoard [
	^ gameBoard
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JA 5/16/2024 11:57'
}
EPGBoardArea >> gameBoard: anObject [
	gameBoard := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JA 5/16/2024 12:10'
}
EPGBoardArea >> initialize [ 
	super initialize.
	
]
