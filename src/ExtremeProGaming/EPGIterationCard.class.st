Class {
	#name : #EPGIterationCard,
	#superclass : #EPGCard,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 5/27/2024 20:50'
}
EPGIterationCard >> initialize [

	super initialize.
	self colorBar: (Color fromString: '#ffe1a1') withLayout: #full.
]
