Class {
	#name : #EPGBacklogCard,
	#superclass : #EPGCard,
	#category : #ExtremeProGaming
}

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 16:17'
}
EPGBacklogCard >> checkCost: aDebtAmount [

	^ (self cost + (self perTechnicalDebt * aDebtAmount) <= self owner amounfOfStoryPoints)
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 16:13'
}
EPGBacklogCard >> checkIfProcessed [
	
	| debtArea |
	debtArea := self frontend
		ifTrue: [self gameBoard frontendDebtArea]
		ifFalse: [self gameBoard backendDebtArea].

	((self owner isKindOf: EPGBacklogArea) and: [self checkCost: debtArea currentDebt])
		ifTrue: [self processStorypoints. self processCard].
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 16:19'
}
EPGBacklogCard >> processCard [
	
	self owner dropped remove: self.
	self abandon.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 16:46'
}
EPGBacklogCard >> processStorypoints [
	
	| submorphsToRemove regularStoryPointArea |
	self owner dropped removeAllSuchThat: [:morph | morph isKindOf: EPGStorypoint].
	
	submorphsToRemove := (owner submorphs select: [:morph | morph isKindOf: EPGStorypoint]).
	submorphsToRemove do: [:morph | self owner removeMorph: morph].
	
	regularStoryPointArea := (self gameBoard storyPointAreas at: 2).
	regularStoryPointArea addStorypoints: self owner amounfOfStoryPoints.
	self owner amountOfStoryPoints: 0.
]
