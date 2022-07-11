\header {
  title = "Treble/ Guitar tab staff"
  composer = "Composer"
}

\new StaffGroup <<
   \new Staff \relative {
     \clef "treble_8"
     \time c
     \key g \major
     g,8-3 a b c d e fis g
     %\override Fingering.direction = #DOWN
   }
   \new TabStaff \relative {
     g8 a b c d e fis g
     %\set TabStaff.minimumFret = #5
     \set TabStaff.restrainOpenStrings = ##t
   }
>>
