Class {
	#name : #EPGJSONParser,
	#superclass : #Object,
	#instVars : [
		'jsonContent',
		'assetPath',
		'bugCards',
		'featureCards'
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
	#'squeak_changestamp' : 'sv 6/9/2024 12:19'
}
EPGJSONParser >> bugCards [
	
	^ bugCards.
]

{
	#category : #accessors,
	#'squeak_changestamp' : 'sv 6/9/2024 12:19'
}
EPGJSONParser >> bugCards: aBugCardCollection [
	
	bugCards := aBugCardCollection.
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
	#'squeak_changestamp' : 'sv 6/9/2024 15:38'
}
EPGJSONParser >> createCards [

	| cards |
	cards := (self jsonContent collect: [:card |
		self createCard: card]).
	self featureCards: (cards select: [:card | card isEPGFeatureCard]).
	self bugCards: (cards select: [:card | card isEPGBugCard]).
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
	#category : #accessors,
	#'squeak_changestamp' : 'sv 6/9/2024 12:20'
}
EPGJSONParser >> featureCards [
	
	^ featureCards.
]

{
	#category : #accessors,
	#'squeak_changestamp' : 'sv 6/9/2024 12:20'
}
EPGJSONParser >> featureCards: aFeatureCardCollection [
	
	featureCards := aFeatureCardCollection.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 18:43'
}
EPGJSONParser >> initialize [

	super initialize.
	
	self
		assetPath: '/assets/cards.json';
		decodeJson.
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
