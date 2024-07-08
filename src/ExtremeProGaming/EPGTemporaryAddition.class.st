"
EPGEffect which adds new temporary storypoint to the storypoint areas.
"
Class {
	#name : #EPGTemporaryAddition,
	#superclass : #EPGEffect,
	#category : #'ExtremeProGaming-Core',
	#'squeak_changestamp' : 'JP 7/8/2024 10:44'
}

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/20/2024 01:56'
}
EPGTemporaryAddition >> apply [

	self game addTemporary: self amount.
]
