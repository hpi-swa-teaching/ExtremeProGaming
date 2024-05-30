Class {
	#name : #EPGStorypoint,
	#superclass : #EPGDnDMorph,
	#instVars : [
		'timeToLive',
		'image',
		'imageBag'
	],
	#category : #ExtremeProGaming
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:08'
}
EPGStorypoint >> image [

	^ image.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:09'
}
EPGStorypoint >> image: anImageMorph [

	image := anImageMorph.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:09'
}
EPGStorypoint >> imageBag [

	^ imageBag.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 5/29/2024 01:09'
}
EPGStorypoint >> imageBag: aCollection [

	imageBag := aCollection.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/28/2024 11:17'
}
EPGStorypoint >> initialize [

	super initialize.
	
	self color: Color transparent;
		extent: 100 @ 100;
		initializeImageBag;
		image: self newStorypointMorph;
		addMorph: self image.
		
	self image center: self center.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/28/2024 11:16'
}
EPGStorypoint >> initializeImageBag [

	self imageBag: OrderedCollection new.
	self imageBag add: '/assets/Storypoint_DarkOrange.png';
		add: '/assets/Storypoint_Orange.png';
		add: '/assets/Storypoint_Yellow.png';
		add: '/assets/Storypoint_Red.png';
		add: '/assets/Storypoint_White.png';
		add: '/assets/Storypoint_Green.png'.
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/28/2024 12:05'
}
EPGStorypoint >> newStorypointMorph [

	 ^ ImageMorph new image:(((GitAssetLoader for: 'ExtremeProGaming') loadAsset: (self imageBag at: ((1 to: 6) atRandom))) scaledToSize: 50 @ 50).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/30/2024 21:01'
}
EPGStorypoint >> timeToLive [
	^ timeToLive
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/30/2024 21:01'
}
EPGStorypoint >> timeToLive: anObject [
	timeToLive := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/30/2024 21:05'
}
EPGStorypoint >> update: anAspectSymbol with: aValueObject [

	anAspectSymbol = #newRound
		ifTrue: [self updateTimeToLife].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 21:01'
}
EPGStorypoint >> updateTimeToLife [

	self timeToLife: self timeToLife - 1.
	(self timeToLife == 0) ifTrue: [self abandon].
]
