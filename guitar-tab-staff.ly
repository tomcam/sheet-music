\header {
  title = "Treble/ Guitar tab staff"
  composer = "Composer"
}



\new StaffGroup <<
   \new Staff \relative {
     \clef "treble_8"
     \time c
     c16-3 d e f g4
     \override Fingering.direction = #DOWN
     c,16-3 d e f g4
     c,16 d e f g4
   }
   \new TabStaff \relative {
     c16 d e f g4
     c,16 d e f g4
     \set TabStaff.minimumFret = #5
     \set TabStaff.restrainOpenStrings = ##t
     c,16 d e f g4 
   }
>>
