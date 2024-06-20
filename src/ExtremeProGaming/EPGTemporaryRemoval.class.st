Class {
	#name : #EPGTemporaryRemoval,
	#superclass : #EPGEffect,
	#category : #ExtremeProGaming
}

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/19/2024 17:31'
}
EPGTemporaryRemoval >> apply [

	self game removeTemporary: self amount.
]
