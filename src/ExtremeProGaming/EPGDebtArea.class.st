Class {
	#name : #EPGDebtArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/29/2024 21:54'
}
EPGDebtArea >> initialize [

	super initialize.
	
	self
		extent: 400@250;
		initializeVisibleArea.
]
