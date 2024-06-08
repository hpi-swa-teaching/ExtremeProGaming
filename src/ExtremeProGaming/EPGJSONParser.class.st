Class {
	#name : #EPGJSONParser,
	#superclass : #Object,
	#instVars : [
		'jsonContent',
		'assetPath',
		'cards'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessors,
	#'squeak_changestamp' : 'sv 6/8/2024 19:28'
}
EPGJSONParser >> assetPath [
	
	^ assetPath.
]

{
	#category : #accessors,
	#'squeak_changestamp' : 'sv 6/8/2024 19:28'
}
EPGJSONParser >> assetPath: aString [
	
	assetPath := aString.
]

{
	#category : #accessors,
	#'squeak_changestamp' : 'sv 6/8/2024 19:05'
}
EPGJSONParser >> cards [
	
	^ cards.
]

{
	#category : #accessors,
	#'squeak_changestamp' : 'sv 6/8/2024 19:04'
}
EPGJSONParser >> cards: aCardCollection [

	cards := aCardCollection.
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 6/8/2024 20:29'
}
EPGJSONParser >> createBugBackendCard: aCardJsonFormatted [

	^ EPGBugCard newBackendWithTask: (aCardJsonFormatted at: 'task') 
			consequence: (aCardJsonFormatted at: 'consequence') 
			effect: (aCardJsonFormatted at: 'effect') 
			cost: (aCardJsonFormatted at: 'cost')
			perTechnicalDebt: (aCardJsonFormatted at: 'techDept') 
			positive: (aCardJsonFormatted at: 'positive').
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 6/8/2024 19:52'
}
EPGJSONParser >> createBugCard: aCardJsonFormatted [

	| cardCategory |
	cardCategory := aCardJsonFormatted at: 'frontend'.
	cardCategory
    		ifTrue: [^ self createBugFrontendCard: aCardJsonFormatted]
   	 	ifFalse: [^ self createBugBackendCard: aCardJsonFormatted].
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 6/8/2024 20:29'
}
EPGJSONParser >> createBugFrontendCard: aCardJsonFormatted [

	^ EPGBugCard newFrontendWithTask: (aCardJsonFormatted at: 'task') 
			consequence: (aCardJsonFormatted at: 'consequence') 
			effect: (aCardJsonFormatted at: 'effect') 
			cost: (aCardJsonFormatted at: 'cost')
			perTechnicalDebt: (aCardJsonFormatted at: 'techDept') 
			positive: (aCardJsonFormatted at: 'positive').
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 6/8/2024 19:50'
}
EPGJSONParser >> createCard: aCardJsonFormatted [

	| cardType |
	cardType := aCardJsonFormatted at: 'type'.
	cardType = 'Feature'
    		ifTrue: [^ self createFeatureCard: aCardJsonFormatted]
   	 	ifFalse: [cardType = 'Bug'
        		ifTrue: [^ self createBugCard: aCardJsonFormatted]
        		ifFalse: [Error new: 'Unkown card type: ', cardType, '. Please check JSON file for card creation'; signal]].

]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 6/8/2024 19:05'
}
EPGJSONParser >> createCards [

	self cards: (self jsonContent collect: [:card |
		self createCard: card]).
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 6/8/2024 20:01'
}
EPGJSONParser >> createFeatureBackendCard: aCardJsonFormatted [

	^ EPGFeatureCard newBackendWithTask: (aCardJsonFormatted at: 'task') 
			consequence: (aCardJsonFormatted at: 'consequence') 
			effect: (aCardJsonFormatted at: 'effect') 
			cost: (aCardJsonFormatted at: 'cost')
			perTechnicalDebt: (aCardJsonFormatted at: 'techDept') 
			positive: (aCardJsonFormatted at: 'positive').
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 6/8/2024 19:52'
}
EPGJSONParser >> createFeatureCard: aCardJsonFormatted [

	| cardCategory |
	cardCategory := aCardJsonFormatted at: 'frontend'.
	cardCategory
    		ifTrue: [^ self createFeatureFrontendCard: aCardJsonFormatted]
   	 	ifFalse: [^ self createFeatureBackendCard: aCardJsonFormatted].
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 6/8/2024 20:27'
}
EPGJSONParser >> createFeatureFrontendCard: aCardJsonFormatted [

	^ EPGFeatureCard newFrontendWithTask: (aCardJsonFormatted at: 'task') 
			consequence: (aCardJsonFormatted at: 'consequence') 
			effect: (aCardJsonFormatted at: 'effect') 
			cost: (aCardJsonFormatted at: 'cost')
			perTechnicalDebt: (aCardJsonFormatted at: 'techDept') 
			positive: (aCardJsonFormatted at: 'positive').
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 19:29'
}
EPGJSONParser >> decodeJson [

	| readStream |
	readStream := ReadStream on: ((GitAssetLoader for: 'ExtremeProGaming') loadString: assetPath).
	self jsonContent: (WebUtils jsonDecode: readStream).
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/8/2024 19:29'
}
EPGJSONParser >> initialize [

	super initialize.
	
	self assetPath: '/assets/cards.json'.
	self decodeJson.
]

{
	#category : #accessors,
	#'squeak_changestamp' : 'sv 6/8/2024 18:50'
}
EPGJSONParser >> jsonContent [
	
	^ jsonContent.
]

{
	#category : #accessors,
	#'squeak_changestamp' : 'sv 6/8/2024 18:51'
}
EPGJSONParser >> jsonContent: aString [
	
	jsonContent := aString.
]
