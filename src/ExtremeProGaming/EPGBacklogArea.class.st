Class {
	#name : #EPGBacklogArea,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/28/2024 12:42'
}
EPGBacklogArea >> initialize [

	super initialize.
	
	self dropEnabled: false;
		pickEnabled: true.
	
	self
		color: Color transparent;
		highlightColor: Color green;
		extent: 200@250;
		initializeVisibleArea;
		addMorph: self area;
		borderVisible: false;
		dropped: OrderedCollection new.
]
