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
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 18:17'
}
EPGBacklogCard >> checkIfProcessed [
	
	| debtArea |
	debtArea := self frontend
		ifTrue: [self gameBoard frontendDebtArea]
		ifFalse: [self gameBoard backendDebtArea].

	((self owner isEPGBacklogArea) and: [self checkCost: debtArea currentDebt])
		ifTrue: [self processStorypoints. self process: debtArea].
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 18:24'
}
EPGBacklogCard >> process: aDebtArea [
	
	| doneArea index |
	self owner dropped remove: self.
	index := (self hasProperty: #EPGFeatureCard)
		ifTrue: [self gameBoard class doneAreaTypes indexOf: #Feature]
		ifFalse: [self gameBoard class doneAreaTypes indexOf: #Bug].
	doneArea := (self hasProperty: #EPGFeatureCard)
		ifTrue: [self gameBoard doneAreas at: index]
		ifFalse: [self gameBoard doneAreas at: index].
	doneArea dropInMorph: self.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 6/8/2024 18:17'
}
EPGBacklogCard >> processCard [
	
	| doneArea |
	self owner dropped remove: self.
	doneArea := (self hasProperty: #EPGFeatureCard)
		ifTrue: [self gameBoard doneAreas at: 1]
		ifFalse: [self gameBoard doneAreas at: 2].
	doneArea dropInMorph: self.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 6/9/2024 18:27'
}
EPGBacklogCard >> processStorypoints [
	
	| submorphsToRemove regularStoryPointArea regularAreaIndex |
	self owner dropped removeAllSuchThat: [:morph | morph isEPGStorypoint].
	
	submorphsToRemove := (owner submorphs select: [:morph | morph isKindOf: EPGStorypoint]).
	submorphsToRemove do: [:morph | self owner removeMorph: morph].
	
	regularAreaIndex := self gameBoard class storyPointAreaTypes indexOf: #regular.
	regularStoryPointArea := (self gameBoard storyPointAreas at: regularAreaIndex).
	regularStoryPointArea addStorypoints: self owner amounfOfStoryPoints.
	self owner amountOfStoryPoints: 0.
]
