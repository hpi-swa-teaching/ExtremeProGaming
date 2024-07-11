"
EPGEffect which removes permanent storypoint from storypoint areas.
"
Class {
	#name : #EPGPermanentRemoval,
	#superclass : #EPGEffect,
	#category : #'ExtremeProGaming-Core',
	#'squeak_changestamp' : 'JP 7/8/2024 10:45'
}

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:47'
}
EPGPermanentRemoval >> apply [

	self game removePermanent: self amount.
]
