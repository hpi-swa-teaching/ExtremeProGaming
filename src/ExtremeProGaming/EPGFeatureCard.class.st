Class {
	#name : #EPGFeatureCard,
	#superclass : #EPGBacklogCard,
	#category : #ExtremeProGaming
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
	#category : #'instance creation',
	#'squeak_changestamp' : 'HCH 6/3/2024 17:30'
}
EPGFeatureCard class >> newBackendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
					beBackend;
					initializeHeader: 'Feature';
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
	#'squeak_changestamp' : 'HCH 6/3/2024 17:30'
}
EPGFeatureCard class >> newFrontendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
					beFrontend;
					initializeHeader: 'Feature';
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
	#'squeak_changestamp' : 'HCH 6/3/2024 16:38'
}
EPGFeatureCard >> headerSymbolCenter [

	^ self header center + (50 @ 0).
]

{
	#category : #header,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:37'
}
EPGFeatureCard >> headerTextCenter [

	^ 100 @ 25.
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
	#'squeak_changestamp' : 'Philipp 6/7/2024 17:31'
}
EPGFeatureCard >> process: aDebtArea [

	aDebtArea addTechnicalDebt.
	super process: aDebtArea.
	
]
