"
A JSON-to-EPGCard-converter that creates card morphs according to the given content in the cards.json file which can be found in the GitAssetLoader.
"
Class {
	#name : #EPGJSONParser,
	#superclass : #Object,
	#instVars : [
		'jsonContent',
		'assetPath',
		'bugCards',
		'featureCards',
		'eventCards'
	],
	#category : #'ExtremeProGaming-Core',
	#'squeak_changestamp' : 'JP 7/8/2024 10:48'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/8/2024 19:28'
}
EPGJSONParser >> assetPath [

	^ assetPath.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/8/2024 19:28'
}
EPGJSONParser >> assetPath: aString [

	assetPath := aString.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 12:19'
}
EPGJSONParser >> bugCards [

	^ bugCards.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 12:19'
}
EPGJSONParser >> bugCards: aBugCardCollection [

	bugCards := aBugCardCollection.
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'jmetrikat 7/10/2024 09:21'
}
EPGJSONParser >> configureCardType: aCardJsonFormatted [

	| cardType |
	cardType := aCardJsonFormatted at: 'type'.
	cardType caseOf: {
		['Feature'] -> [	^ self createFeatureCard: aCardJsonFormatted.].
		['Bug'] -> [^ self createBugCard: aCardJsonFormatted.].
		['Event'] -> [^ self createEventCard: aCardJsonFormatted.]}
	 otherwise: [
		Error new: 'Unkown card type: ', cardType, '. Please check JSON file for card creation'; signal].
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
			perTechnicalDebt: (aCardJsonFormatted at: 'techDebt')
			positive: (aCardJsonFormatted at: 'positive').
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'JP 7/8/2024 13:25'
}
EPGJSONParser >> createBugCard: aCardJsonFormatted [

	| cardCategory |
	cardCategory := aCardJsonFormatted at: 'frontend'.
	cardCategory
    		ifTrue: [^ self createBugFrontendCard: aCardJsonFormatted.]
   	 	ifFalse: [^ self createBugBackendCard: aCardJsonFormatted.].
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
			perTechnicalDebt: (aCardJsonFormatted at: 'techDebt')
			positive: (aCardJsonFormatted at: 'positive').
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 7/7/2024 19:51'
}
EPGJSONParser >> createCard: aCardJsonFormatted [

	| card |
	card := self configureCardType: aCardJsonFormatted.
	card effect: (self createEffect: aCardJsonFormatted).
	^ card.

]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 7/9/2024 18:30'
}
EPGJSONParser >> createCards [

	| cards |
	cards := (self jsonContent collect: [:card | self createCard: card.]).
	self
		featureCards: (cards select: [:card | card isEPGFeatureCard.]) shuffled;
		bugCards: (cards select: [:card | card isEPGBugCard.]) shuffled;
		eventCards: (cards select: [:card | card isEPGEventCard.]).
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 7/7/2024 19:52'
}
EPGJSONParser >> createEffect: aJSONCardFormatted [

	| effectClass |
	(aJSONCardFormatted at: 'effectType') caseOf: {
		['newFeature'] -> [effectClass := EPGExtraFeature].
		['newBug'] -> [effectClass := EPGExtraBug].
		['addTemporary'] -> [effectClass := EPGTemporaryAddition].
		['addPermanent'] -> [effectClass := EPGPermanentAddition].
		['removeTemporary'] -> [effectClass := EPGTemporaryRemoval].
		['removePermanent'] -> [effectClass := EPGPermanentRemoval]}
	otherwise: [self error: 'Unknown effect type'].
	
	^ effectClass newFromJSON: aJSONCardFormatted.
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'sv 7/9/2024 20:22'
}
EPGJSONParser >> createEventCard: aCardJsonFormatted [

	^ EPGEventCard newWithTitle: (aCardJsonFormatted at: 'title') 
		    description: (aCardJsonFormatted at: 'description') 
		    effectText: (aCardJsonFormatted at: 'effect')
		    iterationNumber: (aCardJsonFormatted at: 'number').
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
			perTechnicalDebt: (aCardJsonFormatted at: 'techDebt')
			positive: (aCardJsonFormatted at: 'positive').
]

{
	#category : #'card creation',
	#'squeak_changestamp' : 'JP 7/8/2024 13:25'
}
EPGJSONParser >> createFeatureCard: aCardJsonFormatted [

	| cardCategory |
	cardCategory := aCardJsonFormatted at: 'frontend'.
	cardCategory
    		ifTrue: [^ self createFeatureFrontendCard: aCardJsonFormatted.]
   	 	ifFalse: [^ self createFeatureBackendCard: aCardJsonFormatted.].
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
			perTechnicalDebt: (aCardJsonFormatted at: 'techDebt')
			positive: (aCardJsonFormatted at: 'positive').
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 7/7/2024 20:02'
}
EPGJSONParser >> decodeJson [

	| readStream |
	readStream := ReadStream
				on: ((GitAssetLoader for: 'ExtremeProGaming')
						loadString: self assetPath).
	self
		jsonContent: (WebUtils jsonDecode: readStream).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 7/9/2024 20:21'
}
EPGJSONParser >> eventCards [

	^ eventCards sort: [:cardA :cardB | cardA iterationNumber >= cardB iterationNumber].
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 14:24'
}
EPGJSONParser >> eventCards: anEventCardCollection [

	eventCards := anEventCardCollection.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 12:20'
}
EPGJSONParser >> featureCards [

	^ featureCards.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/9/2024 12:20'
}
EPGJSONParser >> featureCards: aFeatureCardCollection [

	featureCards := aFeatureCardCollection.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'sv 6/9/2024 20:12'
}
EPGJSONParser >> initialize [

	super initialize.

	self
		assetPath: '/assets/cards.json';
		decodeJson.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/8/2024 18:50'
}
EPGJSONParser >> jsonContent [

	^ jsonContent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'sv 6/8/2024 18:51'
}
EPGJSONParser >> jsonContent: aString [

	jsonContent := aString.
]
