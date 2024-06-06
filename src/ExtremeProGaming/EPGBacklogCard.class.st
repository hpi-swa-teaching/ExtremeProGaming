Class {
	#name : #EPGBacklogCard,
	#superclass : #EPGCard,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/6/2024 22:48'
}
EPGBacklogCard >> checkIfProcessed [

	Transcript show: '1'.
	"(self checkForStorypoint) ifTrue: [self abandon]." "Cascade expected ->"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/6/2024 22:47'
}
EPGBacklogCard >> update: anAspectSymbol [

	anAspectSymbol = #newRound
		ifTrue: [self checkIfProcessed].
]
