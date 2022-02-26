\header {
  title = "G diminished scale fingering for piano, 3 octaves"
  composer = ""
}
\score{
	\relative {
		g4-1 aes-2 bes-3 b-1 
		cis-2 d-3 e-1 f-2 |
		g-1 aes-2 bes-3 b-1 |
		cis-2 d-3 e-1 f-2 |
		\override Fingering.direction = #DOWN				
		g-3 f-2 e-1 d-3 |
		\override Fingering.direction = #UP				
		cis-2 b-1 bes-3 aes-2 |
		g-1 f-2 e-1 d-3 |
		cis-2 b-1 bes-3 aes-2 |
		g-1
	}
	\layout{}
	\midi{}
}


