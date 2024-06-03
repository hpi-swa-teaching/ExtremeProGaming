Class {
	#name : #EPGFeatureCard,
	#superclass : #EPGBacklogCard,
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:29'
}
EPGFeatureCard class >> headerSymbol [

	^ ImageMorph new
		image:
			(((GitAssetLoader for: 'ExtremeProGaming')
			loadAsset: '/assets/Feature.png')
			scaledToSize: 30@30).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:37'
}
EPGFeatureCard >> headerSymbolCenter [

	^ self header center + (50@0).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:37'
}
EPGFeatureCard >> headerTextCenter [

	^ 100 @ 25.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:25'
}
EPGFeatureCard >> initialize [

	super initialize.
	self 
		color: Color white;
		extent: 270 @ 405;
		initializeHeader: 'Feature';
		colorBar: (Color fromString: '#fc5d5d') withLayout: #left;
		frontBody: (Morph new color: Color transparent);
		backBody: (Morph new color: Color transparent);
		task: 'Make Design responsive';
		consequence: 'Your Developers had a fist fight with the Designer over unreasonable layouting choices.';
		effect: 'You have to visit him in the hospital and have 2 story points less for the next Iteration.';
		cost: 2;
		perTechnicalDebt: 1;
		beFrontend;
		displayCost;
		effectSelector: #negative;
		displayEffect;
		changeBody: frontBody;
		facing: #front.
]
