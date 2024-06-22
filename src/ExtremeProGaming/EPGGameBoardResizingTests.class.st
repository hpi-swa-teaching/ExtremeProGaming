Class {
	#name : #EPGGameBoardResizingTests,
	#superclass : #MorphTest,
	#category : #'ExtremeProGaming-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 6/17/2024 19:06'
}
EPGGameBoardResizingTests >> setUp [

	morph := EPGGame new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 6/17/2024 19:11'
}
EPGGameBoardResizingTests >> testInitialExtent [
	
	self assert: morph extent equals: 2000 @ 1310.
	self assert: (morph planningArea extent) equals: (0.25 * 2000) @ 1310.
	self assert: (morph backlogArea extent) equals: (0.5 * 2000) @ 1310.
	self assert: (morph reviewArea extent) equals: (0.25 * 2000) @ 1310.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 6/17/2024 19:21'
}
EPGGameBoardResizingTests >> testInitialPosition [
	
	self assert: morph position equals: 0 @ 0.
	self assert: (morph planningArea position) equals: 0 @ 0.
	self assert: (morph backlogArea position) equals: (2000*0.25) @ 0.
	self assert: (morph reviewArea position) equals: (2000*0.75) @ 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 6/17/2024 19:20'
}
EPGGameBoardResizingTests >> testResizedExtent [

	morph extent: 2500 @ 1310.
	morph fullBounds.
	
	self assert: morph extent equals: 2500 @ 1310.
	self assert: (morph planningArea extent) equals: (2500/4) @ 1310.
	self assert: (morph backlogArea extent) equals: (2500/2) @ 1310.
	self assert: (morph reviewArea extent) equals: (2500/4) @ 1310.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JP 6/17/2024 19:22'
}
EPGGameBoardResizingTests >> testResizedPosition [
	
	morph extent: 2500 @ 1310.
	morph fullBounds.
	
	self assert: morph position equals: 0 @ 0.
	self assert: (morph planningArea position) equals: 0 @ 0.
	self assert: (morph backlogArea position) equals: (2500*0.25) @ 0.
	self assert: (morph reviewArea position) equals: (2500*0.75) @ 0.
]
