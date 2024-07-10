"
Concrete backlog card which represents a feature. Processing rewards a point and may add technical debt.
"
Class {
	#name : #EPGFeatureCard,
	#superclass : #EPGBacklogCard,
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 12:59'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/6/2024 20:02'
}
EPGFeatureCard class >> headerSymbol [

	^ ImageMorph new
		image:
			(((GitAssetLoader for: 'ExtremeProGaming')
			loadAsset: '/assets/Feature.png')
			scaledToSize: 30 @ 30).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 22:33'
}
EPGFeatureCard class >> headerSymbolOffset [

	^ 45 @ 0.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'sv 7/9/2024 22:42'
}
EPGFeatureCard class >> headerTextCenter [

	^ 75 @ 25.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'sv 7/9/2024 23:06'
}
EPGFeatureCard class >> newBackendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
					beBackend;
					initializeHeader: 'Feature';
					colorBar: self backendColor withLayout: self backendLayout;
					displayTaskText: aTask;
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
	#'squeak_changestamp' : 'sv 7/9/2024 23:06'
}
EPGFeatureCard class >> newFrontendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
					beFrontend;
					initializeHeader: 'Feature';
					colorBar: self frontendColor withLayout: self frontendLayout;
					displayTaskText: aTask;
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
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/6/2024 22:48'
}
EPGFeatureCard >> initialize [

	super initialize.
	
	self setProperty: #EPGFeatureCard toValue: true.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'sv 6/9/2024 15:30'
}
EPGFeatureCard >> isEPGBugCard [

	^ false.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'sv 6/9/2024 15:30'
}
EPGFeatureCard >> isEPGFeatureCard [

	^ true.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'jmetrikat 6/23/2024 12:34'
}
EPGFeatureCard >> moveToDone [

	| doneArea index |
	index := self gameBoard class doneAreaTypes indexOf: #Feature.
	doneArea := self gameBoard doneAreas at: index.
	doneArea dropInMorph: self.
	
	self
		removeProperty: #EPGFeatureCard;
		setProperty: #EPGFeatureDone toValue: true.
	
]
