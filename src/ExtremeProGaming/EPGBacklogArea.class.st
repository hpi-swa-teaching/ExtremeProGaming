Class {
	#name : #EPGBacklogArea,
	#superclass : #EPGDnDArea,
	#instVars : [
		'image',
		'amountOfStorypoints'
	],
	#category : #'ExtremeProGaming-UI'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 23:24'
}
EPGBacklogArea >> amountOfStorypoints [

	^ amountOfStorypoints.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 12:37'
}
EPGBacklogArea >> amountOfStorypoints: aNumber [

	amountOfStorypoints := aNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/19/2024 20:12'
}
EPGBacklogArea >> card [

	^ (self dropped select: [:drop | drop isEPGBacklogCard]) first.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/15/2024 21:53'
}
EPGBacklogArea >> dropInCard: aMorph [

	super dropInMorph: aMorph.
	self accepts: #(#EPGStorypoint).
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/15/2024 21:56'
}
EPGBacklogArea >> dropInMorph: aMorph [

	aMorph isEPGBacklogCard
		ifTrue: [self dropInCard: aMorph].
	aMorph isEPGStorypoint 
		ifTrue: [self dropInStorypoint: aMorph].
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/19/2024 23:24'
}
EPGBacklogArea >> dropInStorypoint: aMorph [
	
	| randomPosition |
	randomPosition := 
		(self width / 2 - 10 to: self width / 2 + 10) atRandom @ 
		((self height / 2 - 10 to: self height / 2 + 10) atRandom).
	super dropInMorph: aMorph at: randomPosition.
	self amountOfStorypoints: self amountOfStorypoints + 1.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/31/2024 14:37'
}
EPGBacklogArea >> image [

	^ image.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/31/2024 14:37'
}
EPGBacklogArea >> image: anImage [

	image := anImage.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/17/2024 14:57'
}
EPGBacklogArea >> initialize [

	super initialize.
	
	self
		amountOfStorypoints: 0;
		accepts: #(#EPGBugCard #EPGFeatureCard);
		initializeVisibleArea.
		
	self area color: Color transparent.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 17:55'
}
EPGBacklogArea >> isEPGBacklogArea [

	^ true.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'HCH 6/19/2024 19:55'
}
EPGBacklogArea >> isFree [

	^ self dropped size = 0.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/19/2024 23:24'
}
EPGBacklogArea >> pickUpMorph: aMorph [
	
	aMorph isEPGBacklogCard ifTrue: [^ nil.].
	aMorph isEPGStorypoint ifTrue: [self amountOfStorypoints: self amountOfStorypoints - 1].
	aMorph
		formerOwner: self;
		formerPosition: aMorph position.
	self dropped remove: aMorph.
	^ aMorph.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'sv 6/22/2024 20:44'
}
EPGBacklogArea >> processBacklogAreaStorypoints [
	
	self
		returnStorypoints.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/15/2024 22:41'
}
EPGBacklogArea >> resetAccepts [

	self accepts: #(#EPGBugCard #EPGFeatureCard).
]
