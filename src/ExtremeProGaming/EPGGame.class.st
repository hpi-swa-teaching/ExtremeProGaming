Class {
	#name : #EPGGame,
	#superclass : #Object,
	#instVars : [
		'gameBoard',
		'cardSource',
		'numOfFeatureCards',
		'numOfBugCards'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:03'
}
EPGGame >> cardSource [

	^ cardSource.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:03'
}
EPGGame >> cardSource: aCardSource [

	cardSource := aCardSource.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:03'
}
EPGGame >> gameBoard [

	^ gameBoard.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:03'
}
EPGGame >> gameBoard: aGameBoard [

	gameBoard := aGameBoard.
	
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'Philipp 6/16/2024 16:57'
}
EPGGame >> generateBugCards [

	| index |
	index := self gameBoard class planningAreasAcceptance indexOf: #EPGBugCard.
	self cardSource bugCards do: [:card |
		card gameBoard: self gameBoard.
		self addDependent: card.
		(self gameBoard planningAreas at: index) dropInMorph: card].
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'Philipp 6/16/2024 16:51'
}
EPGGame >> generateCards [

	| parser |
	parser := self cardSource.
	parser createCards.
	
	self 
		numOfFeatureCards: parser featureCards size;
		numOfBugCards: parser bugCards size;
		generateFeatureCards;
		generateBugCards.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'Philipp 6/16/2024 16:58'
}
EPGGame >> generateFeatureCards [

	| index |
	index := self gameBoard class planningAreasAcceptance indexOf: #EPGFeatureCard.
	self cardSource featureCards do: [:card |
		card gameBoard: self gameBoard.
		self addDependent: card.
		(self gameBoard planningAreas at: index) dropInMorph: card].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:15'
}
EPGGame >> initialize [

	super initialize.
	self 
		gameBoard: (EPGGameBoard newWithGame: self);
		cardSource: EPGJSONParser new.
	self initializeDefaultGameState.
	^ self gameBoard.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:11'
}
EPGGame >> initializeDefaultGameState [

	self generateCards.
	self gameBoard frontendDebtArea addTechnicalDebt.
	self gameBoard backendDebtArea addTechnicalDebt.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:03'
}
EPGGame >> numOfBugCards [

	^ numOfBugCards.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:04'
}
EPGGame >> numOfBugCards: aNumber [

	numOfBugCards := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:04'
}
EPGGame >> numOfFeatureCards [

	^ numOfFeatureCards.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/16/2024 17:04'
}
EPGGame >> numOfFeatureCards: aNumber [

	numOfFeatureCards := aNumber.
]

{
	#category : #observer,
	#'squeak_changestamp' : 'Philipp 6/16/2024 16:50'
}
EPGGame >> startNewRound [

	self changed: #newRound.
	
]
