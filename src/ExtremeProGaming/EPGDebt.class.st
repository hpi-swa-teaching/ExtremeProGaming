Class {
	#name : #EPGDebt,
	#superclass : #EPGDnDArea,
	#instVars : [
		'image',
		'type'
	],
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:21'
}
EPGDebt >> checkForStorypoint [

	^ self dropped size == 1.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:13'
}
EPGDebt >> checkIfProcessed [

	(self checkForStorypoint)
		ifTrue: [
			self area decrementDebt.
			self game removeDependent: self.
			self abandon].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/19/2024 19:50'
}
EPGDebt >> dropInMorph: aMorph [

	super dropInMorph: aMorph.
	self changed: #StorypointDroppedOnDebt with: self type.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:22'
}
EPGDebt >> image [

	^ image.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 5/30/2024 22:22'
}
EPGDebt >> image: anImage [

	image := anImage.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 21:59'
}
EPGDebt >> initialize [

	super initialize.
	
	self
		extent: 100 @ 100;
		accepts: #(#EPGStorypoint);
		initializeVisibleArea.
		
	self area color: Color transparent.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 22:09'
}
EPGDebt >> mouseEnterDragging: evt [

	(self dropEnabled and: [self checkForStorypoint not]) ifTrue: [self addBorder].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 6/19/2024 19:49'
}
EPGDebt >> pickUpMorph: aMorph [

	self pickUpEnabled ifTrue: [
		aMorph formerOwner: self.
		aMorph formerPosition: aMorph position.
		self dropped remove: aMorph.
		self update: #StorypointPickUpOfDebt with: self type.
		^ aMorph.]
	ifFalse: [^ nil.].
]

{
	#category : #typesetting,
	#'squeak_changestamp' : 'JP 6/19/2024 19:34'
}
EPGDebt >> setType: aType [

	| path |
	(aType = #frontend or: [aType = #backend])
		ifFalse: [self error: 'Non valid debt type'].

	path := (aType = #frontend)
		ifTrue: ['/assets/TechnicalDebt_Frontend.png']
		ifFalse: ['/assets/TechnicalDebt_Backend.png'].

	self
		image: (ImageMorph new image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: path) scaledToSize: (self backgroundExtent - self backgroundMargin)));
		addMorph: self image.

	self image center: self center.
	self type: aType.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 19:34'
}
EPGDebt >> type [
	^ type
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 6/19/2024 19:34'
}
EPGDebt >> type: anObject [
	type := anObject
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 22:12'
}
EPGDebt >> update: anAspectSymbol [

	anAspectSymbol = #newRound
		ifTrue: [self checkIfProcessed].
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 22:08'
}
EPGDebt >> wantsDroppedMorph: aMorph event: evt [

	(self dropEnabled 
		and: [aMorph isEPGDnDMorph] 
		and: [self acceptsMorph: aMorph]
		and: [self checkForStorypoint not])
		ifFalse: [^ self rejectMorph].
	^ true.
]
