Class {
	#name : #EPGGame,
	#superclass : #Object,
	#instVars : [
		'gameBoard',
		'cardSource',
		'numOfFeatureCards',
		'numOfBugCards',
		'frontendIsBlocked',
		'backendIsBlocked'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'jmetrikat 6/20/2024 00:20'
}
EPGGame class >> open [

	^ EPGGame new openInWorld.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:46'
}
EPGGame >> backendIsBlocked [

	^ backendIsBlocked.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:46'
}
EPGGame >> backendIsBlocked: aBoolean [

	backendIsBlocked := aBoolean.
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
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:47'
}
EPGGame >> frontendIsBlocked [

	^ frontendIsBlocked.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:47'
}
EPGGame >> frontendIsBlocked: aBoolean [

	frontendIsBlocked := aBoolean.
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
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:47'
}
EPGGame >> initialize [

	super initialize.
	self 
		gameBoard: (EPGGameBoard newWithGame: self);
		cardSource: EPGJSONParser new;
		frontendIsBlocked: false;
		backendIsBlocked: false.		
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
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:48'
}
EPGGame >> resetBlockedValues [

	self
		frontendIsBlocked: false;
		backendIsBlocked: false.
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:48'
}
EPGGame >> startNewRound [

	self changed: #newRound.
	self resetBlockedValues.
	
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
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:51'
}
EPGGame >> update: anAspectSymbol with: aParameter [

	anAspectSymbol = #StorypointDroppedOnDebt
		ifTrue: [(aParameter = #frontend) ifTrue: [self frontendIsBlocked: true].
				(aParameter = #backend) ifTrue: [self backendIsBlocked: true]].
			
	anAspectSymbol = #StorypointPickedUpFromDebt
		ifTrue: [(aParameter = #frontend) ifTrue: [self frontendIsBlocked: false].
				(aParameter = #backend) ifTrue: [self backendIsBlocked: false]].
]

{
	#category : #'card management',
	#'squeak_changestamp' : 'JP 6/19/2024 22:38'
}
EPGGame >> updateFeatureScore [

	self gameBoard featureScore updateScore.
]
