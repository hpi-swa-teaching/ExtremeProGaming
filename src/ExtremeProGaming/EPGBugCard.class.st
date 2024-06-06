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
	#'squeak_changestamp' : 'HCH 6/3/2024 16:36'
}
EPGBugCard >> headerSymbolCenter [

	^ self header center + (30 @ 0).
]

{
	#category : #header,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:33'
}
EPGBugCard >> headerTextCenter [

	^ 90 @ 25.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'jmetrikat 6/6/2024 22:45'
}
EPGBugCard >> initialize [

	super initialize.
	
	self setProperty: #EPGBugCard toValue: true.
]
