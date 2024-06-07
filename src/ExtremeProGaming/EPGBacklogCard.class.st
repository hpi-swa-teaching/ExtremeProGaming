Class {
	#name : #EPGBacklogCard,
	#superclass : #EPGCard,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/7/2024 17:23'
}
EPGBacklogCard >> checkCost: aDebt [

	^ (self cost + (self perTechnicalDebt * aDebt) <= self owner storyPoints)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/7/2024 17:32'
}
EPGBacklogCard >> checkIfProcessed [

	| debtArea |
	debtArea := self frontend ifTrue: [self gameBoard frontendDebtArea] ifFalse: [self gameBoard backendDebtArea].
	((self owner isKindOf: EPGBacklogArea) and:[self checkCost: debtArea currentDebt]) ifTrue: [self process: debtArea].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/7/2024 17:32'
}
EPGBacklogCard >> process: aDebtArea [
	
	self owner dropped remove: self.
	self abandon.
]
