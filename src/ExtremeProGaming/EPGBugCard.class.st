Class {
	#name : #EPGBugCard,
	#superclass : #EPGBacklogCard,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 5/27/2024 20:51'
}
EPGBugCard >> initialize [

	super initialize.
	self colorBar: (Color fromString: '#5f4dfa') withLayout: #right.
]
