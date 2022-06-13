"
I'm the API to the HashMap that resides in libgohashmap.
You can use me pretty much like a dictionary.
"
Class {
	#name : #GoHashMap,
	#superclass : #Object,
	#category : #'GoHashMap-Core'
}

{ #category : #accessing }
GoHashMap class >> ffiLibrary [

	^ GoHashMapLibrary
]

{ #category : #accessing }
GoHashMap class >> get: key [

	^ self ffiCall: #( char * get #( char * key ) )
]

{ #category : #accessing }
GoHashMap class >> includes: key [

	^ self ffiCall: #( bool includes #( char * key ) )
]

{ #category : #accessing }
GoHashMap class >> remove: key [

	^ self ffiCall: #( void remove #( char * key ) )
]

{ #category : #accessing }
GoHashMap class >> reset [

	^ self ffiCall: #( void reset #(  ) )
]

{ #category : #accessing }
GoHashMap class >> set: key with: value [

	^ self ffiCall: #( void set #( char * key , char * value ) )
]

{ #category : #accessing }
GoHashMap class >> size [

	^ self ffiCall: #( uint size #(  ) )
]
