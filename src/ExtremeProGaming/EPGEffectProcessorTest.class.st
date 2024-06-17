Class {
	#name : #EPGEffectProcessorTest,
	#superclass : #TestCase,
	#instVars : [
		'gameBoard',
		'processor'
	],
	#category : #ExtremeProGaming
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'HCH 6/16/2024 14:41'
}
EPGEffectProcessorTest >> setUp [
	
	processor := EPGEffectProcessor new.
	gameBoard := EPGGameBoard new.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/16/2024 15:08'
}
EPGEffectProcessorTest >> testPermanentAddition [

	| oldCount |
	oldCount := gameBoard numOfAvailableStorypoints.
	
	processor addPermanent: 3.
	
	self assert: oldCount + 3 equals: gameBoard numOfAvailableStorypoints.
	gameBoard startNewRound.
	self assert: oldCount + 3 equals: gameBoard numOfAvailableStorypoints.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/16/2024 15:08'
}
EPGEffectProcessorTest >> testPermanentRemovalSufficient [

	| oldCount |
	oldCount := gameBoard numOfAvailableStorypoints.
	
	processor removePermanent: 1.
	
	self assert: oldCount - 1 equals: gameBoard numOfAvailableStorypoints.
	gameBoard startNewRound.
	self assert: oldCount - 1 equals: gameBoard numOfAvailableStorypoints.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/16/2024 14:55'
}
EPGEffectProcessorTest >> testTemporaryAddition [

	| oldCount |
	oldCount := gameBoard numOfTemporaryStorypoints.
	processor addTemporary: 3.
	
	self assert: oldCount + 3 equals: gameBoard numOfTemporaryStorypoints.
	gameBoard startNewRound.
	self assert: oldCount equals: gameBoard numOfTemporaryStorypoints.
]

{
	#category : #storypoints,
	#'squeak_changestamp' : 'HCH 6/16/2024 15:08'
}
EPGEffectProcessorTest >> testTemporaryRemoval [

	| oldCountAvailable oldCountUnavailable |
	oldCountAvailable := gameBoard numOfAvailableStorypoints.
	oldCountUnavailable := gameBoard numOfUnavailableStorypoints.
	
	processor removeTemporary: 1.
	
	self assert: oldCountAvailable - 1 equals: gameBoard numOfAvailableStorypoints.
	self assert: oldCountUnavailable + 1 equals: gameBoard numOfUnavailableStorypoints.
	gameBoard startNewRound.
	self assert: oldCountAvailable equals: gameBoard numOfAvailableStorypoints.
	self assert: oldCountUnavailable equals: gameBoard numOfUnavailableStorypoints.
]
