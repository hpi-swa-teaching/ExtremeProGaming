"
Defines gamelogic and provides interfaces for interaction with game components.
"
Class {
	#name : #EPGGame,
	#superclass : #Object,
	#instVars : [
		'gameBoard',
		'cardSource',
		'numOfFeatureCards',
		'numOfBugCards',
		'sprintEffects',
		'focusedCards',
		'startOfRound',
		'currentRound'
	],
	#classVars : [
		'HighScore'
	],
	#category : #'ExtremeProGaming-Core',
	#'squeak_changestamp' : 'JP 7/8/2024 10:47'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/21/2024 01:50'
}
EPGGame class >> highScore [

	^ HighScore.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/21/2024 01:51'
}
EPGGame class >> highScore: aNumber [

	HighScore := aNumber.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/18/2024 22:44'
}
EPGGame class >> newWithoutReturn [

	^ (self new) game.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'jmetrikat 6/21/2024 09:24'
}
EPGGame class >> open [

	EPGStartScreen new openInWorld.
]

{
	#category : #cards,
	#'squeak_changestamp' : 'sv 6/24/2024 10:09'
}
EPGGame >> addBugCard [

	self addCard: self gameBoard bugArea pickUpTopCard.
]

{
	#category : #cards,
	#'squeak_changestamp' : 'HCH 6/20/2024 19:54'
}
EPGGame >> addCard: aBacklogCard [

	(self freeBacklogAreas size = 0) ifTrue: [self error: 'Cannot place more cards on board'].
	self freeBacklogAreas first dropInCard: aBacklogCard.
]

{
	#category : #cards,
	#'squeak_changestamp' : 'sv 6/24/2024 10:09'
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
	#'squeak_changestamp' : 'HCH 6/20/2024 01:57'
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
	#'squeak_changestamp' : 'sv 6/24/2024 10:07'
}
EPGGame >> applySprintEffects [
	
	self gameBoard unfreezeDnD.
	self sprintEffects do: [:effect | effect apply].
	self sprintEffects removeAll.
	self gameBoard freezeDnD.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/22/2024 20:39'
}
EPGGame >> backendIsBlocked [

	^ self gameBoard backendDebtArea isBlocking.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/20/2024 19:56'
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
	#'squeak_changestamp' : 'sv 6/24/2024 10:17'
}
EPGGame >> checkForGameEnd [

	 ((self currentRound = 10) or: (self freeBacklogAreas isEmpty)) ifTrue: [self endGame].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/23/2024 18:15'
}
EPGGame >> currentRound [

	^ currentRound.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Philipp 6/23/2024 18:15'
}
EPGGame >> currentRound: aNumber [

	currentRound := aNumber.
]

{
	#category : #'game logic',
	#'squeak_changestamp' : 'Philipp 6/21/2024 02:48'
}
EPGGame >> endGame [

	| score |
	score := self gameBoard featureScore score.
	self initializeEndScreen: score.
	self class highScore: (score max: (self class highScore ifNil: [0])).
	self gameBoard abandon.
	
]

{
	#category : #cards,
	#'squeak_changestamp' : 'sv 6/22/2024 14:03'
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
	#'squeak_changestamp' : 'sv 6/22/2024 20:39'
}
EPGGame >> frontendIsBlocked [

	^ self gameBoard frontendDebtArea isBlocking.
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
	#'squeak_changestamp' : 'HCH 6/23/2024 14:37'
}
EPGGame >> generateCards [

	| parser |
	parser := self cardSource.
	parser createCards.
	
	self 
		numOfFeatureCards: parser featureCards size;
		numOfBugCards: parser bugCards size;
		generateFeatureCards;
		generateBugCards;
		generateEventCards.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'HCH 6/23/2024 14:37'
}
EPGGame >> generateEventCards [

	self cardSource eventCards do: [:card |
		card gameBoard: self gameBoard.
		card game: self.
		card effect game: self.
		(self gameBoard eventArea) dropInMorph: card].
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
	#'squeak_changestamp' : 'Philipp 6/23/2024 18:16'
}
EPGGame >> initialize [

	super initialize.
	self 
		gameBoard: (EPGGameBoard newWithGame: self);
		cardSource: EPGJSONParser new.	
	self initializeDefaultGameState.
	self 
		sprintEffects: OrderedCollection new;
		focusedCards: OrderedCollection new;
		currentRound: 1;
		startOfRound: true.
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
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/21/2024 09:35'
}
EPGGame >> initializeEndScreen: score [
	
	(EPGEndScreen newWithScore: score)
		game: self;
		center: self gameBoard center;
		openInWorld.
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
	#'squeak_changestamp' : 'jmetrikat 6/23/2024 12:26'
}
EPGGame >> processBacklogAreaStorypoints [

	self occupiedAreas do: [:area | area returnStorypoints].
]

{
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/23/2024 16:36'
}
EPGGame >> processCards [

	| processedCards |
	processedCards := OrderedCollection new.
	self processableCards do: [:card | 
			self sprintEffects add: card effect. 
			card process.
			processedCards add: card].
	processedCards size = 0 ifTrue: [self startOfRound: true].
	processedCards do: [:card | card prepareMoveToDone].
	self processDebtToAdd: processedCards.
]

{
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/23/2024 11:51'
}
EPGGame >> processDebtAreas [

	self gameBoard frontendDebtArea processDebt.
	self gameBoard backendDebtArea processDebt.
]

{
	#category : #sprints,
	#'squeak_changestamp' : 'sv 6/22/2024 20:43'
}
EPGGame >> processDebtToAdd: aCardCollection [

	| featureCards |
	featureCards := aCardCollection select: [:card | card isEPGFeatureCard].
	(featureCards anySatisfy: [:card | card isFrontend]) 
		ifTrue: [self gameBoard frontendDebtArea addTechnicalDebt].
	(featureCards anySatisfy: [:card | card isBackend]) 
		ifTrue: [self gameBoard backendDebtArea addTechnicalDebt].
]

{
	#category : #sprints,
	#'squeak_changestamp' : 'HCH 6/23/2024 15:30'
}
EPGGame >> processEventCard: anEventCard [

	self gameBoard unfreezeDnD.
	anEventCard effect apply.
	anEventCard abandon.

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
	#'squeak_changestamp' : 'HCH 6/20/2024 20:10'
}
EPGGame >> removeAllAvailableStorypoints [

	self gameBoard availableStorypointAreas do: [:area | area clearArea].
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
	#'squeak_changestamp' : 'sv 6/24/2024 09:34'
}
EPGGame >> removePermanent: aNumber [
	| regularStorypoints |
	regularStorypoints := self gameBoard regularStorypointArea dropped.
	(aNumber min: self numOfAvailableStorypoints)
		timesRepeat: [regularStorypoints ifNotEmpty: 
			[self removeStorypoint: regularStorypoints first]].
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
	#'squeak_changestamp' : 'HCH 6/20/2024 20:04'
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
	#'squeak_changestamp' : 'Philipp 6/23/2024 18:20'
}
EPGGame >> startNewRound [

	self 
		processCards;
		processDebtAreas;
		processBacklogAreaStorypoints;
		checkForGameEnd;
		currentRound: self currentRound + 1;
		changed: #newRound.
	self gameBoard freezeDnD.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 16:36'
}
EPGGame >> startOfRound [

	^ startOfRound.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 16:36'
}
EPGGame >> startOfRound: aBoolean [

	startOfRound := aBoolean.
]

{
	#category : #cards,
	#'squeak_changestamp' : 'HCH 6/23/2024 16:37'
}
EPGGame >> unfocusCard: anEPGCard [

	self focusedCards remove: anEPGCard.
	anEPGCard isEPGFeatureCard ifTrue: [self updateFeatureScore].
	anEPGCard isEPGEventCard  ifTrue: [^ self].
	self focusedCards size = 0
		ifTrue: [self applySprintEffects. self startOfRound: true].
	
]

{
	#category : #'card management',
	#'squeak_changestamp' : 'JP 6/19/2024 22:38'
}
EPGGame >> updateFeatureScore [

	self gameBoard featureScore updateScore.
]
