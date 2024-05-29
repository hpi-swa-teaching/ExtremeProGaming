Class {
	#name : #EPGDebtArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 5/29/2024 20:46'
}
EPGDebtArea >> initialize [

	super initialize.
	
	self
		highlightColor: Color green;
		extent: 400@250;
		backgroundMargin: 25@25;
		initializeVisibleArea.
]
