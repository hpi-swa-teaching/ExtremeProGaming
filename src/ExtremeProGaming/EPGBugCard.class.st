Class {
	#name : #EPGBugCard,
	#superclass : #EPGBacklogCard,
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/6/2024 20:02'
}
EPGBugCard class >> headerSymbol [

	^ ImageMorph new
		image:
			(((GitAssetLoader for: 'ExtremeProGaming')
			loadAsset: '/assets/Bug.png')
			scaledToSize: 30 @ 30).
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/3/2024 17:08'
}
EPGBugCard class >> newBackendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
					beBackend;
					initializeHeader: 'Bug';
					colorBar: self backendColor withLayout: #right;
					task: aTask;
					consequence: aConsequence;
					effect: anEffect;
					cost: aCost perTechnicalDebt: aNumber.
	aBoolean 
		ifTrue: [instance bePositive]
		ifFalse: [instance beNegative].
	instance 
		displayEffect;
		changeBody: instance frontBody.
	^ instance.
	
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/3/2024 17:29'
}
EPGBugCard class >> newFrontendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
					beFrontend;
					initializeHeader: 'Bug';
					colorBar: self frontendColor withLayout: #left;
					task: aTask;
					consequence: aConsequence;
					effect: anEffect;
					cost: aCost perTechnicalDebt: aNumber.
	aBoolean 
		ifTrue: [instance bePositive]
		ifFalse: [instance beNegative].
	instance 
		displayEffect;
		changeBody: instance frontBody.
	^ instance.
	
]

{
	#category : #header,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:37'
}
EPGBugCard >> headerSymbolCenter [

	^ self header center + (30 @ 0).
]

{
	#category : #header,
	#'squeak_changestamp' : 'HCH 6/12/2024 14:17'
}
EPGBugCard >> headerTextCenter [

	^ 70 @ 25.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/6/2024 22:45'
}
EPGBugCard >> initialize [

	super initialize.
	
	self setProperty: #EPGBugCard toValue: true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 6/9/2024 15:30'
}
EPGBugCard >> isEPGBugCard [

	^ true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'sv 6/9/2024 15:30'
}
EPGBugCard >> isEPGFeatureCard [

	^ false.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'Philipp 6/16/2024 18:31'
}
EPGBugCard >> moveToDone [

	| doneArea index |
	index := self gameBoard class doneAreaTypes indexOf: #Bug.
	doneArea := self gameBoard doneAreas at: index.
	self removeProperty: #EPGBugCard.
	self setProperty: #EPGBugDone toValue: true.
	doneArea dropInMorph: self.
	
]
