Class {
	#name : #EPGStorypoint,
	#superclass : #EPGDnDMorph,
	#instVars : [
		'game',
		'timeToLive',
		'image',
		'imageBag',
		'available'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/20/2024 19:52'
}
EPGStorypoint class >> newTemporary [

	^ self new
		timeToLive: 1;
		setProperty: #temporaryAdditional toValue: true;
		yourself.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/20/2024 19:53'
}
EPGStorypoint class >> newTemporaryWithTimeToLive: aNumber [

	^ self new;
		timeToLive: aNumber;
		setProperty: #temporaryAdditional toValue: true;
		yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:55'
}
EPGStorypoint >> available [

	^ available.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:55'
}
EPGStorypoint >> available: aBoolean [

	available := aBoolean.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:55'
}
EPGStorypoint >> beAvailable [

	self available: true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:55'
}
EPGStorypoint >> beUnavailable [

	self available: false.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:27'
}
EPGStorypoint >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:27'
}
EPGStorypoint >> game: aGame [

	game := aGame.
]

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
	#'squeak_changestamp' : 'HCH 6/19/2024 00:01'
}
EPGStorypoint >> initialize [

	super initialize.
	
	self
		color: Color transparent;
		extent: 100 @ 100;
		initializeImageBag;
		image: self newStorypointMorph;
		addMorph: self image;
		beAvailable;
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
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:56'
}
EPGStorypoint >> isAvailable [

	^ self available.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 17:52'
}
EPGStorypoint >> isEPGStorypoint [

	^ true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:56'
}
EPGStorypoint >> isUnavailable [

	^ self isAvailable not.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/18/2024 23:54'
}
EPGStorypoint >> makeUnavailable [

	self beUnavailable.
	self timeToLive: 1.
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
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:58'
}
EPGStorypoint >> update: anAspectSymbol [

	anAspectSymbol = #newRound
		ifTrue: [self updateTimeToLive].
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/19/2024 22:55'
}
EPGStorypoint >> updateTimeToLive [

	self timeToLive ifNotNil: [
		self timeToLive: self timeToLive - 1.
		(self timeToLive = 0) ifTrue: [
			self game removeStorypoint: self.
			self isUnavailable ifTrue: [self game addPermanent: 1].
			self abandon.]].
]
