Class {
	#name : #EPGDoneArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #nil,
	#'squeak_changestamp' : 'JP 5/29/2024 20:33'
}
EPGDoneArea >> initialize [

	super initialize.
	
	self
		highlightColor: Color green;
		extent: 200@250;
		backgroundMargin: 25@25;
		initializeVisibleArea.
]
