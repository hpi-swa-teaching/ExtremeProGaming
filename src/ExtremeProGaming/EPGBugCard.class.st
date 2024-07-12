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
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:17'
}
EPGBugCard class >> headerSymbol [

	^ ImageMorph new
		image: (((GitAssetLoader for: 'ExtremeProGaming')
			loadAsset: '/assets/Bug.png')
			scaledToSize: 30 @ 30).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 22:30'
}
EPGBugCard class >> headerSymbolOffset [

	^ 30 @ 0.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'sv 7/9/2024 22:42'
}
EPGBugCard class >> headerTextCenter [

	^ 70 @ 25.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:07'
}
EPGBugCard class >> newBackendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
		beBackend;
		initializeHeader: 'Bug';
		colorBar: self backendColor withLayout: self backendLayout;
		displayTaskText: aTask;
		displayConsequenceText: aConsequence;
		displayEffectText: anEffect;
		cost: aCost perTechnicalDebt: aNumber.
		
	^ self applyEffectsFor: instance with: aBoolean.
	
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'jmetrikat 7/11/2024 22:07'
}
EPGBugCard class >> newFrontendWithTask: aTask consequence: aConsequence effect: anEffect cost: aCost perTechnicalDebt: aNumber positive: aBoolean [
	
	| instance |
	instance := self new
		beFrontend;
		initializeHeader: 'Bug';
		colorBar: self frontendColor withLayout: self frontendLayout;
		displayTaskText: aTask;
		displayConsequenceText: aConsequence;
		displayEffectText: anEffect;
		cost: aCost perTechnicalDebt: aNumber.
		
	^ self applyEffectsFor: instance with: aBoolean.
	
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
	#category : #'event handling',
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
