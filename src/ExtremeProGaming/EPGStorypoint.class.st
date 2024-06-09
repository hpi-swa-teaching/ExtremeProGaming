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
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 16:22'
}
EPGStorypoint >> initialize [

	super initialize.
	
	self
		color: Color transparent;
		extent: 100 @ 100;
		initializeImageBag;
		image: self newStorypointMorph;
		addMorph: self image;
		setProperty: #EPGStorypoint toValue: true.
		
	self image center: self center.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/31/2024 14:01'
}
EPGStorypoint >> initializeImageBag [

	self imageBag: OrderedCollection new.
	self imageBag
		add: '/assets/Storypoints/Storypoint_DarkOrange.png';
		add: '/assets/Storypoints/Storypoint_Orange.png';
		add: '/assets/Storypoints/Storypoint_Yellow.png';
		add: '/assets/Storypoints/Storypoint_Red.png';
		add: '/assets/Storypoints/Storypoint_White.png';
		add: '/assets/Storypoints/Storypoint_Green.png'.
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 17:52'
}
EPGStorypoint >> isEPGStorypoint [

	^ true.
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
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:56'
}
EPGStorypoint >> timeToLive [

	^ timeToLive.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:57'
}
EPGStorypoint >> timeToLive: aTime [

	timeToLive := aTime.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:58'
}
EPGStorypoint >> update: anAspectSymbol [

	anAspectSymbol = #newRound
		ifTrue: [self updateTimeToLive].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 17:49'
}
EPGStorypoint >> updateTimeToLive [

	self timeToLive ifNotNil: [
		self timeToLive: self timeToLive - 1.
		(self timeToLive == 0) ifTrue: [self abandon]].
]
