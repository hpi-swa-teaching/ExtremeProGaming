Class {
	#name : #EPGJSONParserTests,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'board'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/9/2024 15:54'
}
EPGJSONParserTests >> setUp [

	parser := EPGJSONParser new.
	board := EPGGameBoard new.
	
	"reseting the jsonContent for a indicidual testing file"
	parser jsonContent: ''.
	parser assetPath: '/assets/cardsTesting.json'.
	parser decodeJson.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 20:30'
}
EPGJSONParserTests >> testBugBackendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	self assert: true equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 20:28'
}
EPGJSONParserTests >> testBugFrontendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> true. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	self assert: false equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'sv 6/9/2024 16:12'
}
EPGJSONParserTests >> testCardAmountSetting [
"manually set the parser of the board to testing parser"
	board cardSource: parser.
	board generateCards.
	
	self assert: 1 equals: board numOfFeatureCards.
	self assert: 0 equals: board numOfBugCards.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'sv 6/9/2024 16:24'
}
EPGJSONParserTests >> testCardAmountSettingReal [

	board generateCards.
	
	self assert: false equals: board numOfFeatureCards isNil.
	self assert: false equals: board numOfBugCards isNil.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/9/2024 15:38'
}
EPGJSONParserTests >> testCardCollection [

	parser createCards.

	self assert: false equals: (parser featureCards isEmpty).
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/9/2024 15:38'
}
EPGJSONParserTests >> testCardCollectionElement [

	parser createCards.

	self assert: EPGFeatureCard equals: ((parser featureCards at: 1) class).
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 20:40'
}
EPGJSONParserTests >> testEffectExistence [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> 'dummy effect'. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	"self assert: 'dummy effect' equals: (parser createCard: mockJSON) effect."
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 20:26'
}
EPGJSONParserTests >> testFeatureBackendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Feature'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	self assert: true equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 20:28'
}
EPGJSONParserTests >> testFeatureFrontendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Feature'. 'frontend' -> true. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	self assert: false equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'sv 6/9/2024 16:31'
}
EPGJSONParserTests >> testGenerateCardsSuccessful [
	
	self assert: false equals: board cardSource featureCards isEmpty.
	self assert: false equals: board cardSource bugCards isEmpty.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 19:27'
}
EPGJSONParserTests >> testJsonContentNotEmpty [

	self assert: false equals: parser jsonContent isEmpty.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'sv 6/9/2024 15:54'
}
EPGJSONParserTests >> testParserForGameExistence [
	
	self assert: false equals: board cardSource isNil.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 20:41'
}
EPGJSONParserTests >> testTechDeptExistence [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> 'Challenging task here'. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 3. 'positive' -> false}.

	self assert: 3 equals: (parser createCard: mockJSON) perTechnicalDebt.
]
