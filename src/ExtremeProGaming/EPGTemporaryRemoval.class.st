"
EPGEffect which removes temporary storypoint from storypoint areas.
"
Class {
	#name : #EPGTemporaryRemoval,
	#superclass : #EPGEffect,
	#category : #'ExtremeProGaming-Core',
	#'squeak_changestamp' : 'JP 7/8/2024 10:45'
}

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/19/2024 17:31'
}
EPGTemporaryRemoval >> apply [

	self game removeTemporary: self amount.
]
