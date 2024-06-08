Class {
	#name : #EPGJSONParserTests,
	#superclass : #TestCase,
	#instVars : [
		'parser'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:07'
}
EPGJSONParserTests >> setUp [

	parser := EPGJSONParser new.
	
	"reseting the jsonContent for a indicidual testing file"
	parser jsonContent: ''.
	parser assetPath: '/assets/cardsTesting.json'.
	parser decodeJson.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:30'
}
EPGJSONParserTests >> testBugBackendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	self assert: true equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:28'
}
EPGJSONParserTests >> testBugFrontendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> true. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	self assert: false equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:47'
}
EPGJSONParserTests >> testCardCollection [

	parser createCards.

	self assert: false equals: parser cards isEmpty.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:51'
}
EPGJSONParserTests >> testCardCollectionElement [

	parser createCards.

	self assert: EPGFeatureCard equals: ((parser cards at: 1) class).
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:40'
}
EPGJSONParserTests >> testEffectExistence [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> 'dummy effect'. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	"self assert: 'dummy effect' equals: (parser createCard: mockJSON) effect."
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:26'
}
EPGJSONParserTests >> testFeatureBackendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Feature'. 'frontend' -> false. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	self assert: true equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:28'
}
EPGJSONParserTests >> testFeatureFrontendCardCreation [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Feature'. 'frontend' -> true. 'task' -> ''. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	self assert: false equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 19:27'
}
EPGJSONParserTests >> testJsonContentNotEmpty [

	self assert: false equals: parser jsonContent isEmpty.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:31'
}
EPGJSONParserTests >> testTaskExistence [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> 'Challenging task here'. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 0. 'positive' -> false}.

	self assert: true equals: (parser createCard: mockJSON) isBackend.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 20:41'
}
EPGJSONParserTests >> testTechDeptExistence [

	| mockJSON |
	mockJSON := Dictionary newFrom: {'type' -> 'Bug'. 'frontend' -> false. 'task' -> 'Challenging task here'. 'consequence' -> ''. 'effect' -> ''. 'cost' -> 1. 'techDept' -> 3. 'positive' -> false}.

	self assert: 3 equals: (parser createCard: mockJSON) perTechnicalDebt.
]
