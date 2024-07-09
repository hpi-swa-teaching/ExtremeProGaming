Class {
	#name : #EPGEffectExecutionTest,
	#superclass : #TestCase,
	#instVars : [
		'effect',
		'game'
	],
	#category : #'ExtremeProGaming-Tests'
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'HCH 7/9/2024 11:18'
}
EPGEffectExecutionTest >> setUp [
	
	game := EPGGame newWithoutReturn.
	game startOfRound: false.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 6/19/2024 20:13'
}
EPGEffectExecutionTest >> testBugAddition [

	| oldCount |
	oldCount := game numOfBugCardsInGame.
	effect := EPGExtraBug newWithGame: game.
	effect apply.
	
	self assert: oldCount + 1 equals: game numOfBugCardsInGame.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 6/19/2024 20:13'
}
EPGEffectExecutionTest >> testFeatureAddition [

	| oldCount |
	oldCount := game numOfFeatureCardsInGame.
	effect := EPGExtraFeature newWithGame: game.
	effect apply.
	
	self assert: oldCount + 1 equals: game numOfFeatureCardsInGame.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 20:55'
}
EPGEffectExecutionTest >> testPermanentAddition [

	| oldCount |
	oldCount := game numOfAvailableStorypoints.
	effect := EPGPermanentAddition newWithGame: game amount: 3.
	effect apply.
	
	self assert: oldCount + 3 equals: game numOfAvailableStorypoints.
	game finishSprint.
	self assert: oldCount + 3 equals: game numOfAvailableStorypoints.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 20:55'
}
EPGEffectExecutionTest >> testPermanentRemovalSufficient [

	| oldCount |
	game addPermanent: 1.
	oldCount := game numOfAvailableStorypoints.
	effect := EPGPermanentRemoval newWithGame: game amount: 1. "rm perm 1"
	effect apply.
	
	self assert: oldCount - 1 equals: game numOfAvailableStorypoints.
	game finishSprint.
	self assert: oldCount - 1 equals: game numOfAvailableStorypoints.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/9/2024 11:17'
}
EPGEffectExecutionTest >> testTemporaryAddition [

	| oldCount |
	oldCount := game numOfTemporaryStorypoints.
	effect := EPGTemporaryAddition newWithGame: game amount: 3.
	effect apply.
	
	self assert: oldCount + 3 equals: game numOfTemporaryStorypoints.
	game finishSprint.
	self assert: oldCount equals: game numOfTemporaryStorypoints.
]

{
	#category : #tests,
	#'squeak_changestamp' : 'HCH 7/8/2024 20:55'
}
EPGEffectExecutionTest >> testTemporaryRemoval [

	| oldCountAvailable oldCountUnavailable |
	game addPermanent: 1.
	oldCountAvailable := game numOfAvailableStorypoints.
	oldCountUnavailable := game numOfUnavailableStorypoints.
	effect := EPGTemporaryRemoval newWithGame: game amount: 1. "-1 tmp"
	effect apply.
	
	self assert: oldCountAvailable - 1 equals: game numOfAvailableStorypoints.
	self assert: oldCountUnavailable + 1 equals: game numOfUnavailableStorypoints.
	game finishSprint.
	self assert: oldCountAvailable equals: game numOfAvailableStorypoints.
	self assert: oldCountUnavailable equals: game numOfUnavailableStorypoints.
]
