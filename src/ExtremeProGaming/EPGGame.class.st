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
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/18/2024 22:44'
}
EPGGame class >> newWithoutReturn [

	^ (self new) game.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:31'
}
EPGGame >> addPermanent: aNumber [

	self gameBoard regularStorypointArea addStorypoints: aNumber.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:25'
}
EPGGame >> addTemporary: aNumber [

	| area |
	area := self gameBoard temporaryStorypointArea.
	aNumber timesRepeat: [area addCustomStorypoint: EPGStorypoint newTemporary].
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/19/2024 00:07'
}
EPGGame >> addUnavailable: aNumber [

	self gameBoard unavailableStorypointArea addStorypoints: aNumber.
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
	#'squeak_changestamp' : 'sv 6/18/2024 11:12'
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
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:56'
}
EPGGame >> numOfAvailableStorypoints [

	| unavailableArea unavailableCount |
	unavailableArea := self gameBoard unavailableStorypointArea.
	unavailableCount := (unavailableArea dropped select: [:drop | drop isEPGStorypoint]) size.
	^ self numOfStorypoints - unavailableCount.
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
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:43'
}
EPGGame >> numOfPermanentStorypoints [

	^ self numOfAvailableStorypoints - self numOfTemporaryStorypoints.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:45'
}
EPGGame >> numOfStorypoints [

	^ (self gameBoard allMorphs select: [:morph | morph isEPGStorypoint]) size.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:56'
}
EPGGame >> numOfTemporaryStorypoints [

	| temporaryArea temporaryCount |
	temporaryArea := self gameBoard temporaryStorypointArea.
	temporaryCount := (temporaryArea dropped select: [:drop | drop isEPGStorypoint.]) size.
	^ temporaryCount.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:38'
}
EPGGame >> numOfUnavailableStorypoints [

	^ self numOfStorypoints - self numOfAvailableStorypoints.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:25'
}
EPGGame >> remove: aStorypoint [

	self gameBoard storyPointAreas do: [:area | 
		(area dropped includes: aStorypoint)
			ifTrue: [ area dropped remove: aStorypoint.
					area removeMorph: aStorypoint.
					aStorypoint abandon.]].
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:45'
}
EPGGame >> removeAllAvailableStorypoints [

	| availableAreas |
	availableAreas := self gameBoard storyPointAreas select: 
						[:area | area dropEnabled].
	availableAreas do: [:area | area clearArea].
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:45'
}
EPGGame >> removeAllStorypoints [

	self gameBoard storyPointAreas do: [:area | area clearArea].
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:56'
}
EPGGame >> removeAllTemporaryStorypoints [

	| temporaryArea |
	temporaryArea := self gameBoard temporaryStorypointArea.
 	temporaryArea clearArea.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 22:56'
}
EPGGame >> removeAllUnavailableStorypoints [

	| temporaryArea |
	temporaryArea := self gameBoard unavailableStorypointArea.
 	temporaryArea clearArea.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:46'
}
EPGGame >> removePermanent: aNumber [

	self numOfAvailableStorypoints - aNumber <= 0
		ifTrue: [self removeAllAvailableStorypoints. ^ self].
	aNumber timesRepeat: [
		self numOfPermanentStorypoints > 0
			ifTrue: [self removeStorypoint: 
						self gameBoard regularStorypointArea dropped first.]
			ifFalse: [self removeStorypoint: 
						self gameBoard temporaryStorypointArea dropped first]].
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:57'
}
EPGGame >> removeStorypoint: aStorypoint [

	self gameBoard storyPointAreas do: [:area | 
		(area dropped includes: aStorypoint)
			ifTrue: [ area dropped remove: aStorypoint.
					area removeMorph: aStorypoint]].
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/19/2024 00:08'
}
EPGGame >> removeTemporary: aNumber [

	| area |
	area := self gameBoard regularStorypointArea.
	area dropped do: [:storypoint | 
		[aNumber > 0] or: 
			[storypoint makeUnavailable. self]]
	
]

{
	#category : #observer,
	#'squeak_changestamp' : 'Philipp 6/16/2024 16:50'
}
EPGGame >> startNewRound [

	self changed: #newRound.
	
]

{
	#category : #'card management',
	#'squeak_changestamp' : 'sv 6/18/2024 13:22'
}
EPGGame >> unfocusCard [

	self gameBoard unfreezeDnD.
	
]
