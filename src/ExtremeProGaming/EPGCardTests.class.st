Class {
	#name : #EPGCardTests,
	#superclass : #MorphTest,
	#instVars : [
		'frontBug',
		'frontFeature',
		'backBug',
		'backFeature'
	],
	#category : #ExtremeProGaming
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/11/2024 10:42'
}
EPGCardTests >> setBackBug [

	backBug := EPGBugCard 
		newBackendWithTask: 'Dummy' 
		consequence: 'Lorem Ipsum' 
		effect: 'Dolor sit amet' 
		cost: 4 perTechnicalDebt: 1 
		positive: true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/11/2024 10:42'
}
EPGCardTests >> setBackFeature [

	backFeature := EPGFeatureCard 
		newBackendWithTask: 'Dummy' 
		consequence: 'Lorem Ipsum' 
		effect: 'Dolor sit amet' 
		cost: 4 perTechnicalDebt: 1 
		positive: true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/11/2024 10:40'
}
EPGCardTests >> setFrontBug [

	frontBug := EPGBugCard 
		newFrontendWithTask: 'Dummy' 
		consequence: 'Lorem Ipsum' 
		effect: 'Dolor sit amet' 
		cost: 4 perTechnicalDebt: 1 
		positive: true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/11/2024 10:42'
}
EPGCardTests >> setFrontFeature [

	frontFeature := EPGFeatureCard 
		newFrontendWithTask: 'Dummy' 
		consequence: 'Lorem Ipsum' 
		effect: 'Dolor sit amet' 
		cost: 4 perTechnicalDebt: 1 
		positive: true.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/11/2024 10:38'
}
EPGCardTests >> setUp [

	self 
		setFrontBug;
		setFrontFeature;
		setBackBug;
		setBackFeature.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 6/11/2024 10:43'
}
EPGCardTests >> tearDown [

	frontBug delete.
	frontFeature delete.
	backBug delete.
	backFeature delete.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 6/11/2024 10:49'
}
EPGCardTests >> testBackend [

	self assert: false equals: frontFeature isBackend.
	self assert: false equals: frontBug isBackend.
	self assert: true equals: backFeature isBackend.
	self assert:  true equals: backBug isBackend.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 6/11/2024 10:45'
}
EPGCardTests >> testCardIdentity [

	self assert: true equals: backBug isEPGBugCard.
	self assert: false equals: backBug isEPGFeatureCard.
	
	self assert: true equals: backFeature isEPGFeatureCard.
	self assert: false equals: backFeature isEPGBugCard.
	
	self assert: true equals: frontBug isEPGBugCard.
	self assert: false equals: frontBug isEPGFeatureCard.
	
	self assert: true equals: frontFeature isEPGFeatureCard.
	self assert: false equals: frontFeature isEPGBugCard.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HCH 6/11/2024 10:49'
}
EPGCardTests >> testFrontend [

	self assert: true equals: frontFeature isFrontend.
	self assert: true equals: frontBug isFrontend.
	self assert: false equals: backFeature isFrontend.
	self assert:  false equals: backBug isFrontend.
]
