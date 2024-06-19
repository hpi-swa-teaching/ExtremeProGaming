Class {
	#name : #EPGGame,
	#superclass : #Object,
	#instVars : [
		'gameBoard',
		'cardSource',
		'numOfFeatureCards',
		'numOfBugCards',
		'frontendIsBlocked',
		'backendIsBlocked',
		'sprintEffects',
		'focusedCards'
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
	#'squeak_changestamp' : 'HCH 6/20/2024 01:16'
}
EPGGame >> applySprintEffects [

	self sprintEffects do: [:effect | effect apply].
	self sprintEffects removeAll.
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
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/20/2024 01:22'
}
EPGGame >> checkBlockingDebt [

	self frontendIsBlocked: self gameBoard frontendDebtArea isBlocking.
	self backendIsBlocked: self gameBoard backendDebtArea isBlocking.
]

{
	#category : #cards,
	#'squeak_changestamp' : 'HCH 6/20/2024 01:00'
}
EPGGame >> focusCard: anEPGCard [

	| board |
	self focusedCards add: anEPGCard.
	board := self gameBoard.
	board freezeDnD.
	board addMorphFront: (anEPGCard center: board boundsInWorld center).
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/20/2024 00:59'
}
EPGGame >> focusedCards [

	^ focusedCards.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/20/2024 00:59'
}
EPGGame >> focusedCards: aCollection [

	^ focusedCards := aCollection.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/20/2024 01:19'
}
EPGGame >> freeBacklogAreas [

	^ (self gameBoard backlogDnDAreas select: [:area | area isFree]) reverse.
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
	#'squeak_changestamp' : 'HCH 6/20/2024 01:04'
}
EPGGame >> initialize [

	super initialize.
	self 
		gameBoard: (EPGGameBoard newWithGame: self);
		cardSource: EPGJSONParser new;
		frontendIsBlocked: false;
		backendIsBlocked: false.		
	self initializeDefaultGameState.
	self 
		sprintEffects: OrderedCollection new;
		focusedCards: OrderedCollection new.
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
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/20/2024 00:36'
}
EPGGame >> occupiedAreas [
 
	^ self gameBoard backlogDnDAreas 
			select: [:area | area isFree not.]
]

{
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/20/2024 01:37'
}
EPGGame >> processCards [

	| processedCards |
	processedCards := OrderedCollection new.
	self processableCards do: [:card | 
			self sprintEffects add: card effect. 
			card process.
			processedCards add: card].
	processedCards do: [:card | card prepareMoveToDone].
	self processDebt: processedCards.
	
	
]

{
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/20/2024 01:37'
}
EPGGame >> processDebt: aCardCollection [

	| featureCards |
	featureCards := aCardCollection select: [:card | card isEPGFeatureCard].
	(featureCards anySatisfy: [:card | card isFrontend] ) 
		ifTrue: [self gameBoard frontendDebtArea addTechnicalDebt].
	(featureCards anySatisfy: [:card | card isBackend] ) 
		ifTrue: [self gameBoard backendDebtArea addTechnicalDebt].
	
	
]

{
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/20/2024 00:52'
}
EPGGame >> processStorypoints [

	self occupiedAreas do: [:area | area processStorypoints].
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/20/2024 01:28'
}
EPGGame >> processableCards [

	^ self occupiedAreas collect: [:area | area card] thenSelect: [:card | card canBeProcessed].
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
	#category : #'game logic',
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:48'
}
EPGGame >> resetBlockedValues [

	self
		frontendIsBlocked: false;
		backendIsBlocked: false.
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
	#'squeak_changestamp' : 'HCH 6/20/2024 01:29'
}
EPGGame >> startNewRound [

	self 
		checkBlockingDebt;
		processCards;
		processStorypoints;
		resetBlockedValues;
		changed: #newRound.
	
]

{
	#category : #cards,
	#'squeak_changestamp' : 'HCH 6/20/2024 01:33'
}
EPGGame >> unfocusCard: anEPGCard [

	self focusedCards remove: anEPGCard.
	anEPGCard isEPGFeatureCard ifTrue: [self updateFeatureScore].
	self focusedCards size = 0
		ifTrue: [self gameBoard unfreezeDnD. self applySprintEffects.].
	
]

{
	#category : #'card management',
	#'squeak_changestamp' : 'JP 6/19/2024 22:38'
}
EPGGame >> updateFeatureScore [

	self gameBoard featureScore updateScore.
]
