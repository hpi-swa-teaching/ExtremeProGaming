"
EPGEffect which adds new permanent storypoint to the storypoint areas.
"
Class {
	#name : #EPGPermanentAddition,
	#superclass : #EPGEffect,
	#category : #'ExtremeProGaming-Core',
	#'squeak_changestamp' : 'JP 7/8/2024 10:45'
}

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:32'
}
EPGPermanentAddition >> apply [

	self game addPermanent: self amount.
]
