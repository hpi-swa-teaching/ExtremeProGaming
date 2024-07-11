"
Concrete DnD area to represent technical debt. To reduce technical debt drop storypoint into area.
"
Class {
	#name : #EPGDebt,
	#superclass : #EPGDnDArea,
	#instVars : [
		'type'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 12:50'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 23:40'
}
EPGDebt class >> defaultExtent [

	^ 100 @ 100.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 11:55'
}
EPGDebt >> canBeProcessed [

	^ self dropped size == 1.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 7/9/2024 23:40'
}
EPGDebt >> initialize [

	super initialize.
	
	self
		extent: self class defaultExtent;
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
	#'squeak_changestamp' : 'jmetrikat 7/10/2024 19:44'
}
EPGDebt >> setType: aType [

	| path imageMorph |
	path := (aType = #frontend)
		ifTrue: ['/assets/TechnicalDebt_Frontend.png']
		ifFalse: ['/assets/TechnicalDebt_Backend.png'].
	
	imageMorph := (ImageMorph new
			image: (((GitAssetLoader for: 'ExtremeProGaming') loadAsset: path)
			scaledToSize: (self backgroundExtent - self class backgroundMargin)))
			center: self center.
						
	self
		addMorph: imageMorph;
		type: aType.
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
