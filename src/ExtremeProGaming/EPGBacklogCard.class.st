Class {
	#name : #EPGBacklogCard,
	#superclass : #EPGCard,
	#category : #ExtremeProGaming
}

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 6/16/2024 12:38'
}
EPGBacklogCard >> checkCost: aDebtAmount [

	^ (self cost + (self perTechnicalDebt * aDebtAmount) <= self owner amounfOfStorypoints)
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:31'
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
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/15/2024 21:56'
}
EPGBacklogCard >> isEPGBacklogCard [

	^ true.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/15/2024 22:17'
}
EPGBacklogCard >> moveToDone [

	^ self subclassResponsibility.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'sv 6/18/2024 11:13'
}
EPGBacklogCard >> prepareMoveToDone [

	self toggleFocusCard.
	self updateStoryPoints.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'sv 6/17/2024 14:45'
}
EPGBacklogCard >> process: aDebtArea [
	
	self owner dropped remove: self.
	self owner resetAccepts.
	self prepareMoveToDone.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:31'
}
EPGBacklogCard >> processStorypoints [
	
	| submorphsToRemove regularStoryPointArea regularAreaIndex |
	self owner dropped removeAllSuchThat: [:morph | morph isEPGStorypoint].
	
	submorphsToRemove := (owner submorphs select: [:morph | morph isKindOf: EPGStorypoint]).
	submorphsToRemove do: [:morph | self owner removeMorph: morph].
	
	regularAreaIndex := self gameBoard class storyPointAreaTypes indexOf: #regular.
	regularStoryPointArea := (self gameBoard storyPointAreas at: regularAreaIndex).
	regularStoryPointArea addStorypoints: self owner amounfOfStorypoints.
	self owner amountOfStorypoints: 0.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'JP 6/19/2024 20:16'
}
EPGBacklogCard >> update: anAspectSymbol [
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'JP 6/19/2024 20:14'
}
EPGBacklogCard >> update: anAspectSymbol with: aParameter [

	anAspectSymbol = #updateCards
		ifTrue: [(aParameter = #frontend and: self isFrontend) ifTrue:[self checkIfProcessed.].
				(aParameter = #backend and: self isBackend) ifTrue:[self checkIfProcessed.].].
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'sv 6/17/2024 14:51'
}
EPGBacklogCard >> updateStoryPoints [

	"TODO update exisiting/locked storypoints accoring to card"
]
