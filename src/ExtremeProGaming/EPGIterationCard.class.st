Class {
	#name : #EPGIterationCard,
	#superclass : #EPGCard,
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 5/29/2024 23:13'
}
EPGIterationCard >> initialize [

	super initialize.
	
	self colorBar: (Color fromString: '#ffe1a1') withLayout: #full.
]
