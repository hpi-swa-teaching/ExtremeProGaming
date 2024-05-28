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
	#'squeak_changestamp' : 'JP 5/27/2024 23:15'
}
EPGStorypoint >> image [
	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/27/2024 23:15'
}
EPGStorypoint >> image: anObject [
	image := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/28/2024 11:17'
}
EPGStorypoint >> imageBag [
	^ imageBag
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/28/2024 11:17'
}
EPGStorypoint >> imageBag: anObject [
	imageBag := anObject
]

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/28/2024 11:18'
}
EPGStorypoint >> newStorypointMorph [

	 ^ ImageMorph new image:(((GitAssetLoader for: 'ExtremeProGaming') loadAsset: (self imageBag at: ((1 to: 6) atRandom))) scaledToSize: 100 @ 100).
]
