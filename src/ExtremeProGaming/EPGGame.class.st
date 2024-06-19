Class {
	#name : #EPGGame,
	#superclass : #Object,
	#instVars : [
		'gameBoard',
		'cardSource',
		'numOfFeatureCards',
		'numOfBugCards',
		'blockFrontend',
		'blockBackend'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 19:45'
}
EPGGame >> blockBackend [
	^ blockBackend
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 19:45'
}
EPGGame >> blockBackend: anObject [
	blockBackend := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 19:45'
}
EPGGame >> blockFrontend [
	^ blockFrontend
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 19:45'
}
EPGGame >> blockFrontend: anObject [
	blockFrontend := anObject
]

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
	#category : #'card management',
	#'squeak_changestamp' : 'sv 6/18/2024 13:21'
}
EPGGame >> focusCard: anEPGCard [
	| board |
	board := self gameBoard.
	board freezeDnD.
	board addMorphFront: (anEPGCard center: board boundsInWorld center).
	
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
	#category : #'card management',
	#'squeak_changestamp' : 'sv 6/18/2024 11:12'
}
EPGGame >> generateBugCards [

	| index |
	index := self gameBoard class planningAreasAcceptance indexOf: #EPGBugCard.
	self cardSource bugCards do: [:card |
		card gameBoard: self gameBoard.
		card game: self.
		self addDependent: card.
		(self gameBoard planningAreas at: index) dropInMorph: card].
]

{
	#category : #'card management',
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
	#category : #'card management',
	#'squeak_changestamp' : 'sv 6/18/2024 11:12'
}
EPGGame >> generateFeatureCards [

	| index |
	index := self gameBoard class planningAreasAcceptance indexOf: #EPGFeatureCard.
	self cardSource featureCards do: [:card |
		card gameBoard: self gameBoard.
		card game: self.
		self addDependent: card.
		(self gameBoard planningAreas at: index) dropInMorph: card].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/19/2024 19:46'
}
EPGGame >> initialize [

	super initialize.
	self 
		gameBoard: (EPGGameBoard newWithGame: self);
		cardSource: EPGJSONParser new;
		blockFrontend: false;
		blockBackend: false.		
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
	#category : #'game logic',
	#'squeak_changestamp' : 'JP 6/19/2024 20:18'
}
EPGGame >> resetValues [

	self blockFrontend: false.
	self blockBackend: false.
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'JP 6/19/2024 21:17'
}
EPGGame >> startNewRound [

	self changed: #newRound.
	self resetValues.
	
]

{
	#category : #'card management',
	#'squeak_changestamp' : 'sv 6/18/2024 13:22'
}
EPGGame >> unfocusCard [

	self gameBoard unfreezeDnD.
	
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'JP 6/19/2024 19:47'
}
EPGGame >> update: anAspectSymbol with: aParameter [

	anAspectSymbol = #StorypointDroppedOnDebt
		ifTrue: [(aParameter = #frontend) ifTrue: [self blockFrontend: true.].
				(aParameter = #backend) ifTrue: [self blockBackend: true.].].
			
	anAspectSymbol = #StorypointPickUpOfDebt
		ifTrue: [(aParameter = #frontend) ifTrue: [self blockFrontend: false.].
				(aParameter = #backend) ifTrue: [self blockBackend: false.].].
]
