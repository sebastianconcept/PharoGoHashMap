"
I represent the C shared library that has a thread-safe HashMap implemented with Go.

"
Class {
	#name : #GoHashMapLibrary,
	#superclass : #FFILibrary,
	#category : #'GoHashMap-Core'
}

{ #category : #'accessing - platform' }
GoHashMapLibrary >> macModuleName [

	^ 'libgohashmap.dylib'
]
