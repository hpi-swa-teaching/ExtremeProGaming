Class {
	#name : #EPGDebt,
	#superclass : #EPGDnDArea,
	#instVars : [
		'image'
	],
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 22:07'
}
EPGDebt >> checkForStorypoint [

	^ self dropped size == 1
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 22:07'
}
EPGDebt >> checkIfProcessed [

	(self checkForStorypoint) ifTrue: [self abandon].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/30/2024 21:51'
}
EPGDebt >> image [
	^ image
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'JP 5/30/2024 21:51'
}
EPGDebt >> image: anObject [
	image := anObject
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
	#category : #typesetting,
	#'squeak_changestamp' : 'JP 5/29/2024 22:57'
}
EPGDebt >> setType: aType [

	(aType = #frontend) ifTrue: [self setTypeFrontend. ^ self].
	(aType = #backend) ifTrue: [self setTypeBackend. ^ self]
	ifFalse: [self error: 'Non valid Debt Type'].
]

{
	#category : #typesetting,
	#'squeak_changestamp' : 'JP 5/30/2024 21:53'
}
EPGDebt >> setTypeBackend [

	self image: (ImageMorph new image:(((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/TechnicalDebt_Backend.png')) scaledToSize: 75 @ 75));
		addMorph: self image.
		
	self image center: self center.
]

{
	#category : #typesetting,
	#'squeak_changestamp' : 'JP 5/30/2024 22:09'
}
EPGDebt >> setTypeFrontend [

	self image: (ImageMorph new image:(((GitAssetLoader for: 'ExtremeProGaming') loadAsset: ('/assets/TechnicalDebt_Frontend.png')) scaledToSize: 75 @ 75));
		addMorph: self image.
		
	self image center: self center.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/30/2024 21:02'
}
EPGDebt >> update: anAspectSymbol with: aValueObject [

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
