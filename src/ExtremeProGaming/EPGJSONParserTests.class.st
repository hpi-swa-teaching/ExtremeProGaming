"
Tests the correct parsing from an json file to EPGCards.
"
Class {
	#name : #EPGJSONParserTests,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'board'
	],
	#category : #'ExtremeProGaming-Tests',
	#'squeak_changestamp' : 'JP 7/8/2024 13:13'
}

{
	#category : #running,
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
	#category : #running,
	#'squeak_changestamp' : 'HCH 7/10/2024 14:07'
}
EPGJSONParserTests >> tearDown [

	board abandon.
]

{
	#category : #'test parsing functionality',
	#'squeak_changestamp' : 'HCH 6/19/2024 21:18'
}
EPGJSONParserTests >> testBugBackendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 0. 'positive' -> false . 'effectType' -> 'newBug'}.

	self assert: true equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'test parsing functionality',
	#'squeak_changestamp' : 'HCH 6/19/2024 21:18'
}
EPGJSONParserTests >> testBugFrontendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> true. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 0. 'positive' -> false . 'effectType' -> 'newBug'}.

	self assert: false equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'test card generation',
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:16'
}
EPGJSONParserTests >> testCardAmountSetting [
	"manually set the parser of the board to testing parser"
	
	board game cardSource: parser.
	board game generateCards.

	self assert: 1 equals: board game numOfFeatureCards.
	self assert: 0 equals: board game numOfBugCards.
]

{
	#category : #'test card generation',
	#'squeak_changestamp' : 'jmetrikat 6/17/2024 23:11'
}
EPGJSONParserTests >> testCardAmountSettingReal [

	board game generateCards.

	self assert: false equals: board game numOfFeatureCards isNil.
	self assert: false equals: board game numOfBugCards isNil.
]

{
	#category : #'test parsing functionality',
	#'squeak_changestamp' : 'sv 6/9/2024 15:38'
}
EPGJSONParserTests >> testCardCollection [

	parser createCards.

	self assert: false equals: (parser featureCards isEmpty).
]

{
	#category : #'test parsing functionality',
	#'squeak_changestamp' : 'sv 6/9/2024 15:38'
}
EPGJSONParserTests >> testCardCollectionElement [

	parser createCards.

	self assert: EPGFeatureCard equals: ((parser featureCards at: 1) class).
]

{
	#category : #'test parsing functionality',
	#'squeak_changestamp' : 'HCH 6/19/2024 21:18'
}
EPGJSONParserTests >> testFeatureBackendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Feature'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 0. 'positive' -> false .  'effectType' -> 'newBug'}.
	
	self assert: true equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'test parsing functionality',
	#'squeak_changestamp' : 'HCH 6/19/2024 21:18'
}
EPGJSONParserTests >> testFeatureFrontendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Feature'. 'frontend' -> true. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 0. 'positive' -> false .  'effectType' -> 'newBug'}.
	
	self assert: false equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'test card generation',
	#'squeak_changestamp' : 'jmetrikat 6/17/2024 23:11'
}
EPGJSONParserTests >> testGenerateCardsSuccessful [

	self assert: false equals: board game cardSource featureCards isEmpty.
	self assert: false equals: board game cardSource bugCards isEmpty.
]

{
	#category : #'test parsing functionality',
	#'squeak_changestamp' : 'sv 6/8/2024 19:27'
}
EPGJSONParserTests >> testJsonContentNotEmpty [

	self assert: false equals: parser jsonContent isEmpty.
]

{
	#category : #'test card generation',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 23:21'
}
EPGJSONParserTests >> testParserForGameExistence [

	self assert: false equals: board game cardSource isNil.
]

{
	#category : #'test parsing functionality',
	#'squeak_changestamp' : 'HCH 6/19/2024 21:19'
}
EPGJSONParserTests >> testTechDebtExistence [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> 'Challenging task here'. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDebt' -> 3. 'positive' -> false .  'effectType' -> 'newBug'}.

	self assert: 3 equals: (parser createCard: mockJSON) perTechnicalDebt.
]
