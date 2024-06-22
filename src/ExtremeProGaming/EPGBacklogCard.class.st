Class {
	#name : #EPGBacklogCard,
	#superclass : #EPGCard,
	#category : #'ExtremeProGaming-UI'
}

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/20/2024 19:50'
}
EPGBacklogCard >> canBeProcessed [

	^ self isBlocked not and: [self checkCost: self owner amountOfStorypoints].
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/19/2024 23:21'
}
EPGBacklogCard >> checkCost: aStorypointAmount [

	^ self totalCost <= aStorypointAmount.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/20/2024 01:27'
}
EPGBacklogCard >> isBlocked [

	^ (self game frontendIsBlocked and: self isFrontend) 
		or: [self game backendIsBlocked and: self isBackend].
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
	#'squeak_changestamp' : 'HCH 6/20/2024 01:04'
}
EPGBacklogCard >> prepareMoveToDone [

	self toggleFocusCard.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/20/2024 00:50'
}
EPGBacklogCard >> process [
	
	self owner dropped remove: self.
	self owner resetAccepts.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/19/2024 23:21'
}
EPGBacklogCard >> totalCost [

	| debtArea debtAmount |
	debtArea := self frontend
		ifTrue: [self gameBoard frontendDebtArea]
		ifFalse: [self gameBoard backendDebtArea].
	debtAmount := debtArea currentDebt.

	^ self cost + (self perTechnicalDebt * debtAmount).
]
