Class {
	#name : #EPGPermanentRemoval,
	#superclass : #EPGEffect,
	#category : #ExtremeProGaming
}

{
	#category : #effect,
	#'squeak_changestamp' : 'HCH 6/18/2024 23:47'
}
EPGPermanentRemoval >> apply [

	self game removePermanent: self amount.
]
