Class {
	#name : #EPGDebt,
	#superclass : #EPGDnDArea,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'JP 5/29/2024 22:54'
}
EPGDebt >> initialize [

	super initialize.
	
	self
		extent: 50 @ 50;
		initializeVisibleArea.
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
	#'squeak_changestamp' : 'JP 5/29/2024 22:45'
}
EPGDebt >> setTypeBackend [

	self area color: Color blue darker darker.
]

{
	#category : #typesetting,
	#'squeak_changestamp' : 'JP 5/29/2024 22:45'
}
EPGDebt >> setTypeFrontend [

	self area color: Color red darker darker.
]
