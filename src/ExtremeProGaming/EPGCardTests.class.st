Class {
	#name : #EPGCardTests,
	#superclass : #TestCase,
	#instVars : [
		'game',
		'parser',
		'card'
	],
	#category : #'ExtremeProGaming-Tests'
}

{
	#category : #assist,
	#'squeak_changestamp' : 'sv 6/23/2024 12:41'
}
EPGCardTests >> blockFrontend [

	game gameBoard frontendDebtArea incrementDebt.
	game gameBoard frontendDebtArea submorphsDo: [:debt | debt dropped add: EPGStorypoint new.].
]

{
	#category : #assist,
	#'squeak_changestamp' : 'sv 6/22/2024 14:16'
}
EPGCardTests >> processCards [
	
	| backlogArea |
	backlogArea := game gameBoard backlogDnDAreas first.
	backlogArea dropInCard: card.
	card totalCost timesRepeat: [backlogArea dropInStorypoint: EPGStorypoint new].
	game processCards.
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'sv 6/23/2024 12:40'
}
EPGCardTests >> setUp [

	game := EPGGame newWithoutReturn.
	
	parser := game cardSource.

	"reseting the jsonContent for a indicidual testing file"
	parser
		jsonContent: '';
		assetPath: '/assets/cardsTesting.json';
		decodeJson.
		
	card := game cardSource featureCards first.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'sv 6/23/2024 12:41'
}
EPGCardTests >> testBlockedness [

	self blockFrontend.
	self assert: true equals: card isBlocked.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'sv 6/22/2024 14:15'
}
EPGCardTests >> testCardDoubleClick [

	self processCards.
	self assert: true equals: card isFocus.
	card doubleClick: MouseEvent new.
	self assert: false equals: card isFocus.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'sv 6/22/2024 14:14'
}
EPGCardTests >> testCardDoubleClickWhenForbidden [

	self assert: false equals: card isFocus.
	card doubleClick: MouseEvent new.
	self assert: false equals: card isFocus.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'sv 6/22/2024 14:06'
}
EPGCardTests >> testCardsToBeProcessed [

	| backlogArea |
	backlogArea := game gameBoard backlogDnDAreas first.
	backlogArea dropInCard: card.
	card totalCost timesRepeat: [backlogArea dropInStorypoint: EPGStorypoint new].
	self assert: false equals: game processableCards isEmpty.
	self assert: card equals: game processableCards first.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'sv 6/22/2024 14:16'
}
EPGCardTests >> testFocusedCards [

	self processCards.
	self assert: false equals: game focusedCards isEmpty.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'sv 6/22/2024 14:16'
}
EPGCardTests >> testFocussingCards [

	self processCards.
	self assert: true equals: game focusedCards first isFocus.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'sv 6/22/2024 13:59'
}
EPGCardTests >> testOccupiedAreas [

	game gameBoard backlogDnDAreas first dropInCard: card.
	self assert: false equals: game occupiedAreas isEmpty.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'sv 6/22/2024 14:05'
}
EPGCardTests >> testOccupiedAreasWhenEmpty [

	self assert: true equals: game occupiedAreas isEmpty.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'sv 6/22/2024 14:20'
}
EPGCardTests >> testTurn [

	self assert: #front equals: card facing.
	card turn.
	self assert: #back equals: card facing.
]
