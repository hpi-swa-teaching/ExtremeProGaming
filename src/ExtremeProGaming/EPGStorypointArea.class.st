Class {
	#name : #EPGStorypointArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #nil,
	#'squeak_changestamp' : 'JP 5/27/2024 23:48'
}
EPGStorypointArea >> addStorypoints: aNumber [

	aNumber timesRepeat: [|newStorypoint|
		newStorypoint := EPGStorypoint new.
		self dropInMorph: newStorypoint]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/27/2024 23:50'
}
EPGStorypointArea >> dropInMorph: aMorph [
	| range |

	range := self extent  - aMorph extent.
	self addMorphFront: (aMorph position: self position +  ((0 to: range x ) atRandom @ (0 to: range y) atRandom)).
	self dropped addFirst: aMorph.
	self removeBorder.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/27/2024 23:34'
}
EPGStorypointArea >> initialize [

	super initialize.
	self
		highlightColor: Color green;
		color: Color transparent;
		extent: 150 @ 150;
		initializeVisibleArea;
		addMorph: self area;
		borderVisible: false;
		dropped: OrderedCollection new.
		
	self addStorypoints: 3.
]
