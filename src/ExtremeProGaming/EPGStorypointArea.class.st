Class {
	#name : #EPGStorypointArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/27/2024 22:38'
}
EPGStorypointArea >> initialize [

	super initialize.
	self
		color: Color transparent;
		extent: 150 @ 150;
		initializeVisibleArea;
		addMorph: self area;
		borderVisible: false;
		dropped: OrderedCollection new.
]
