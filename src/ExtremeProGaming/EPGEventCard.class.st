"
Concrete card which marks the start of a new sprint and may add an effect.
"
Class {
	#name : #EPGEventCard,
	#superclass : #EPGCard,
	#instVars : [
		'iterationNumber'
	],
	#category : #'ExtremeProGaming-UI',
	#'squeak_changestamp' : 'JP 7/8/2024 13:02'
}

{
	#category : #constants,
	#'squeak_changestamp' : 'HCH 6/23/2024 13:26'
}
EPGEventCard class >> headerSymbol [

	^ ImageMorph new
		image:
			(((GitAssetLoader for: 'ExtremeProGaming')
			loadAsset: '/assets/Event.png')
			scaledToSize: 30 @ 30).
]

{
	#category : #constants,
	#'squeak_changestamp' : 'sv 7/9/2024 22:34'
}
EPGEventCard class >> headerSymbolOffset [

	^ 40 @ 0.
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'sv 7/9/2024 22:42'
}
EPGEventCard class >> headerTextCenter [

	^ 80 @ 25.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'jmetrikat 6/23/2024 16:37'
}
EPGEventCard class >> iterationNumberFont [

 	^ TextFontReference toFont: (StrikeFont familyName: 'Bitmap DejaVu Sans' size: 33).

	
]

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'sv 7/9/2024 23:06'
}
EPGEventCard class >> newWithTitle: aTitle description: aDescription effectText: anEffectText iterationNumber: aNumber [

	| card |
	card := self new
				initializeHeader: 'Event';
				colorBar: self eventColor withLayout: self eventLayout;
				displayTaskText: aTitle;
				displayConsequenceText: aDescription;
				displayEffectText: anEffectText;
				displayIterationNumber: aNumber.
	^ card
		iterationNumber: aNumber;		
		changeBody: card frontBody;
		yourself.
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 6/23/2024 14:02'
}
EPGEventCard >> displayIterationNumber: aNumber [

	| textMorph |
	textMorph := self formatIterationNumber: aNumber asString.
	textMorph center: self center - (0 @ 50).
	self frontBody addMorph: textMorph.
]

{
	#category : #body,
	#'squeak_changestamp' : 'sv 7/9/2024 23:06'
}
EPGEventCard >> displayTaskText: aText [

	| textMorph |
	textMorph := self formatFrontTask: aText.
	textMorph centered.
	textMorph center: (self center x @ (self height - textMorph height - self bodyOrigin y)).
	self frontBody addMorph: textMorph.
]

{
	#category : #body,
	#'squeak_changestamp' : 'HCH 6/23/2024 14:01'
}
EPGEventCard >> formatIterationNumber: aText [

	| formattedText |
	formattedText := aText asText addAttribute: self class iterationNumberFont.
	^ TextMorph new
		contents: formattedText;
		vResizing: #rigid;
		hResizing: #shrinkWrap;
		width: self width;
		height: self height;
		lock;
		yourself.

	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'HCH 6/23/2024 14:33'
}
EPGEventCard >> initialize [

	super initialize.
	
	self setProperty: #EPGEventCard toValue: true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 14:22'
}
EPGEventCard >> isEPGEventCard [

	^ true.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 14:21'
}
EPGEventCard >> iterationNumber [

	^ iterationNumber.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'HCH 6/23/2024 14:21'
}
EPGEventCard >> iterationNumber: aNumber [

	iterationNumber := aNumber.
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'HCH 6/23/2024 15:29'
}
EPGEventCard >> moveToDone [

	self game processEventCard: self.
]
