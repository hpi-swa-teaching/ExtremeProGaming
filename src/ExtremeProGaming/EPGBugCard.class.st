"
Concrete backlog card which represents a bug. Processing rewards no points and adds no technical debt.
"
Class {
	#name : #EPGBugCard,
	#superclass : #EPGBacklogCard,
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 12:59'
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
	#'squeak_changestamp' : 'HCH 6/23/2024 13:30'
}
EPGBugCard class >> newBackendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
					beBackend;
					initializeHeader: 'Bug';
					colorBar: self backendColor withLayout: self backendLayout;
					displayTask: aTask;
					displayConsequenceText: aConsequence;
					displayEffectText: anEffect;
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
	#'squeak_changestamp' : 'HCH 6/23/2024 13:30'
}
EPGBugCard class >> newFrontendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
					beFrontend;
					initializeHeader: 'Bug';
					colorBar: self frontendColor withLayout: self frontendLayout;
					displayTask: aTask;
					displayConsequenceText: aConsequence;
					displayEffectText: anEffect;
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
	#'squeak_changestamp' : 'jmetrikat 6/23/2024 12:35'
}
EPGBugCard >> moveToDone [

	| doneArea index |
	index := self gameBoard class doneAreaTypes indexOf: #Bug.
	doneArea := self gameBoard doneAreas at: index.
	doneArea dropInMorph: self.
	
	self
		removeProperty: #EPGBugCard;
		setProperty: #EPGBugDone toValue: true.
	
]
