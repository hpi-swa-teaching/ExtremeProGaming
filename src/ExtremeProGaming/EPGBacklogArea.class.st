Class {
	#name : #EPGBacklogArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 5/29/2024 23:16'
}
EPGBacklogArea >> initialize [

	super initialize.
	
	self
		draggable: false;
		highlightColor: Color green;
		extent: 200 @ 250;
		backgroundMargin: 25 @ 25;
		initializeVisibleArea.
]
