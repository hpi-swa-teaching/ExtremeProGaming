"
This provides a framework for concrete backlog cards. It should not be instantiated.
"
Class {
	#name : #EPGBacklogCard,
	#superclass : #EPGCard,
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 12:58'
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:08'
}
EPGBacklogCard class >> applyEffectsFor: anInstance with: aBoolean [

	aBoolean
		ifTrue: [anInstance bePositive]
		ifFalse: [anInstance beNegative].
		
	anInstance 
		displayEffect;
		changeBody: anInstance frontBody.
		
	^ anInstance.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'HCH 6/20/2024 19:50'
}
EPGBacklogCard >> canBeProcessed [

	^ self isBlocked not and: [self checkCost: self owner amountOfStorypoints].
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'HCH 6/19/2024 23:21'
}
EPGBacklogCard >> checkCost: aStorypointAmount [

	^ self totalCost <= aStorypointAmount.
]

{
	#category : #'event handling',
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
	#category : #'event handling',
	#'squeak_changestamp' : 'HCH 6/15/2024 22:17'
}
EPGBacklogCard >> moveToDone [

	^ self subclassResponsibility.
]

{
	#category : #'event handling',
	#'squeak_changestamp' : 'HCH 6/20/2024 00:50'
}
EPGBacklogCard >> process [
	
	self owner dropped remove: self.
	self owner resetAccepts.
]

{
	#category : #'event handling',
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
