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
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:23'
}
EPGJSONParserTests >> setUp [

	board := EPGGame new.
	parser := board game cardSource.

	"reseting the jsonContent for a indicidual testing file"
	parser
		jsonContent: '';
		assetPath: '/assets/cardsTesting.json';
		decodeJson.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 20:30'
}
EPGJSONParserTests >> testBugBackendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 0. 'positive' -> false}.

	self assert: true equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 20:28'
}
EPGJSONParserTests >> testBugFrontendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> true. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 0. 'positive' -> false}.

	self assert: false equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:22'
}
EPGJSONParserTests >> testCardAmountSetting [
	"manually set the parser of the board to testing parser"
	board game cardSource: parser.
	board game generateCards.

	self
		assert: 1 equals: board game numOfFeatureCards;
		assert: 0 equals: board game numOfBugCards.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:22'
}
EPGJSONParserTests >> testCardAmountSettingReal [

	board game generateCards.

	self
		assert: false equals: board game numOfFeatureCards isNil;
		assert: false equals: board game numOfBugCards isNil.
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
	#'squeak_changestamp' : 'sv 6/8/2024 20:26'
}
EPGJSONParserTests >> testFeatureBackendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Feature'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 0. 'positive' -> false}.

	self assert: true equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 20:28'
}
EPGJSONParserTests >> testFeatureFrontendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Feature'. 'frontend' -> true. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 0. 'positive' -> false}.

	self assert: false equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'card generation',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:21'
}
EPGJSONParserTests >> testGenerateCardsSuccessful [

	self
		assert: false equals: board game cardSource featureCards isEmpty;
		assert: false equals: board game cardSource bugCards isEmpty.
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
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:21'
}
EPGJSONParserTests >> testParserForGameExistence [

	self assert: false equals: board game cardSource isNil.
]

{
	#category : #'parsing functionality',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:21'
}
EPGJSONParserTests >> testTechDebtExistence [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> 'Challenging task here'. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 3. 'positive' -> false}.

	self assert: 3 equals: (parser createCard: mockJSON) perTechnicalDebt.
]
