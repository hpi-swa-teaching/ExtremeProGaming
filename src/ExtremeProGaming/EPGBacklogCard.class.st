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
	#'squeak_changestamp' : 'JP 6/20/2024 00:04'
}
EPGBacklogCard >> checkIfProcessed [
	
	| debtArea |
	debtArea := self frontend
		ifTrue: [self gameBoard frontendDebtArea]
		ifFalse: [self gameBoard backendDebtArea].

	((self owner isEPGBacklogArea) and: [self checkCost: debtArea currentDebt])
		ifTrue: [self isBlocked not ifTrue:[self owner processStorypoints. self process: debtArea]
								 ifFalse:[self owner processStorypoints.].].
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'JP 6/20/2024 00:05'
}
EPGBacklogCard >> isBlocked [

	^ (self game blockFrontend and: self isFrontend) or: (self game blockBackend and: self isBackend).
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
	#'squeak_changestamp' : 'sv 6/17/2024 14:51'
}
EPGBacklogCard >> updateStoryPoints [

	"TODO update exisiting/locked storypoints accoring to card"
]
