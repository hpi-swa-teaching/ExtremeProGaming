"
Concrete DnD area to represent technical debt. To reduce technical debt drop storypoint into area.
"
Class {
	#name : #EPGDebt,
	#superclass : #EPGDnDArea,
	#instVars : [
		'image',
		'type'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 12:50'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 11:55'
}
EPGDebt >> canBeProcessed [

	^ self dropped size == 1.
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
	#'squeak_changestamp' : 'HCH 6/23/2024 11:55'
}
EPGDebt >> mouseEnterDragging: evt [

	(self dropEnabled and: [self canBeProcessed not]) ifTrue: [self addBorder].
]

{
	#category : #'event-processing',
	#'squeak_changestamp' : 'HCH 6/23/2024 11:55'
}
EPGDebt >> process [
	
	self canBeProcessed ifTrue:[
		self area decrementDebt.
		self returnStorypoints.
		self abandon.].
	
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
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:44'
}
EPGDebt >> type [

	^ type.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'jmetrikat 6/19/2024 23:44'
}
EPGDebt >> type: aType [

	type := aType.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/23/2024 11:55'
}
EPGDebt >> wantsDroppedMorph: aMorph event: evt [

	(self dropEnabled 
		and: [aMorph isEPGDnDMorph] 
		and: [self acceptsMorph: aMorph]
		and: [self canBeProcessed not])
		ifFalse: [^ self rejectMorph].
	^ true.
]
