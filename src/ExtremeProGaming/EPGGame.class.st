Class {
	#name : #EPGGame,
	#superclass : #Object,
	#instVars : [
		'gameBoard',
		'cardSource',
		'numOfFeatureCards',
		'numOfBugCards',
		'sprintEffects'
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
	#category : #cards,
	#'squeak_changestamp' : 'HCH 6/19/2024 19:53'
}
EPGGame >> addBugCard [

	self addCard: self gameBoard bugArea pickUpTopCard.
]

{
	#category : #cards,
	#'squeak_changestamp' : 'HCH 6/19/2024 20:20'
}
EPGGame >> addCard: aBacklogCard [

	(self freeBacklogAreas size = 0) ifTrue: [self error: 'Cannot place more cards on board'].
	self freeBacklogAreas first dropInCard: aBacklogCard.
	
]

{
	#category : #cards,
	#'squeak_changestamp' : 'HCH 6/19/2024 19:54'
}
EPGGame >> addFeatureCard [

	self addCard: self gameBoard featureArea pickUpTopCard.
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
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/19/2024 22:10'
}
EPGGame >> applySprintEffects [

	self sprintEffects do: [:effect | effect apply].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 20:14'
}
EPGGame >> backlogAreasWithBugCards [

	^ self gameBoard backlogDnDAreas 
		select: [:area | area isFree not and: [area card isEPGBugCard]].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 20:21'
}
EPGGame >> backlogAreasWithFeatureCards [

	^ self gameBoard backlogDnDAreas 
			select: [:area | area isFree not and: [area card isEPGFeatureCard]].
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
	#category : #cards,
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
	#'squeak_changestamp' : 'HCH 6/19/2024 19:56'
}
EPGGame >> freeBacklogAreas [

	^ self gameBoard backlogDnDAreas select: [:area | area isFree].
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
	#'squeak_changestamp' : 'HCH 6/19/2024 22:56'
}
EPGGame >> generateBugCards [

	self cardSource bugCards do: [:card |
		card gameBoard: self gameBoard.
		card game: self.
		card effect game: self.
		(self gameBoard bugArea) dropInMorph: card].
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
	#'squeak_changestamp' : 'HCH 6/19/2024 22:56'
}
EPGGame >> generateFeatureCards [

	self cardSource featureCards do: [:card |
		card 
			gameBoard: self gameBoard;
			game: self.
		card effect game: self.
		(self gameBoard featureArea) dropInMorph: card].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/19/2024 22:20'
}
EPGGame >> initialize [

	super initialize.
	self 
		gameBoard: (EPGGameBoard newWithGame: self);
		cardSource: EPGJSONParser new.
	self initializeDefaultGameState.
	self sprintEffects: OrderedCollection new.
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
	#'squeak_changestamp' : 'HCH 6/19/2024 20:13'
}
EPGGame >> numOfBugCardsInGame [

	^ self backlogAreasWithBugCards size.
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
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 20:13'
}
EPGGame >> numOfFeatureCardsInGame [

	^ self backlogAreasWithFeatureCards size.
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
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/19/2024 23:27'
}
EPGGame >> processCards [

	| processableCards |
	processableCards := 
		(self gameBoard backlogDnDAreas 
			select: [:area | area isFree not.]
			thenCollect: [:area | area card.])
			select: [:card | card canBeProcessed.].
	self sprintEffects:( processableCards collect: [:card | card effect.]).
	processableCards do: [:card | card process.].
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
	#'squeak_changestamp' : 'HCH 6/19/2024 17:40'
}
EPGGame >> removePermanent: aNumber [

	(aNumber min: self numOfAvailableStorypoints)
		timesRepeat: [self removeStorypoint: 
			self gameBoard regularStorypointArea dropped first].
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
	#'squeak_changestamp' : 'HCH 6/19/2024 17:36'
}
EPGGame >> removeTemporary: aNumber [

	| area |
	area := self gameBoard unavailableStorypointArea.
	self removePermanent: aNumber.
	aNumber timesRepeat: [area addCustomStorypoint: EPGStorypoint new makeUnavailable]. 
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 22:09'
}
EPGGame >> sprintEffects [

	^ sprintEffects.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 22:09'
}
EPGGame >> sprintEffects: aCollection [

	sprintEffects := aCollection.
]

{
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/19/2024 22:44'
}
EPGGame >> startNewRound [

	self changed: #newRound.
	self processCards.
	
]

{
	#category : #cards,
	#'squeak_changestamp' : 'sv 6/18/2024 13:22'
}
EPGGame >> unfocusCard [

	self gameBoard unfreezeDnD.
	
]
