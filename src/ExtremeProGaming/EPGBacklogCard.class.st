Class {
	#name : #EPGBacklogCard,
	#superclass : #EPGCard,
	#category : #ExtremeProGaming
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:56'
}
EPGBacklogCard >> checkCost [

	| debt |
	debt := (self frontend ifTrue: [self gameBoard frontendDebtArea] ifFalse: [self gameBoard backendDebtArea]) currentDebt.
	^ (self cost + (self perTechnicalDebt * debt) <= self owner storyPoints)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Philipp 6/7/2024 16:56'
}
EPGBacklogCard >> checkIfProcessed [
	
	((self owner isKindOf: EPGBacklogArea) and:[self checkCost]) ifTrue: [self abandon].
]
