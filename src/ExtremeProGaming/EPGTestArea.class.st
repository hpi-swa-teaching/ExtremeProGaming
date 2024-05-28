Class {
	#name : #EPGTestArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/28/2024 11:39'
}
EPGTestArea >> initialize [

	super initialize.
	self
		color: Color transparent;
		highlightColor: Color green;
		extent: 350@500;
		initializeVisibleArea;
		addMorph: self area;
		borderVisible: false;
		dropped: OrderedCollection new.
]
