Class {
	#name : #EPGBugCard,
	#superclass : #EPGBacklogCard,
	#category : #ExtremeProGaming
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:29'
}
EPGBugCard class >> headerSymbol [

	^ ImageMorph new
		image:
			(((GitAssetLoader for: 'ExtremeProGaming')
			loadAsset: '/assets/Bug.png')
			scaledToSize: 30@30).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:36'
}
EPGBugCard >> headerSymbolCenter [

	^ self header center + (30 @ 0).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:33'
}
EPGBugCard >> headerTextCenter [

	^ 90 @ 25.
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/3/2024 16:25'
}
EPGBugCard >> initialize [

	super initialize.

	super initialize.
	self 
		color: Color white;
		extent: 270 @ 405;
		initializeHeader: 'Bug';
		colorBar: (Color fromString: '#5f4dfa') withLayout: #right;
		frontBody: (Morph new color: Color transparent);
		backBody: (Morph new color: Color transparent);
		task: 'Rewrite in Rust';
		consequence: 'Two of your team members commited suicide beacuase they had to work with COBOL.';
		effect: 'You permanently have 6 Storypoints less.';
		cost: 6;
		perTechnicalDebt: 2;
		beBackend;
		displayCost;
		effectSelector: #negative;
		displayEffect;
		changeBody: frontBody;
		facing: #front.
]
