Class {
	#name : #EPGBugCard,
	#superclass : #EPGBacklogCard,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 5/29/2024 23:14'
}
EPGBugCard >> initialize [

	super initialize.
	
	self colorBar: (Color fromString: '#5f4dfa') withLayout: #right.
]
