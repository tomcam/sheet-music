\header {
  title = "Arpeggio, sweep-picked"
  composer = "Composer"
}

\new StaffGroup <<
   \new Staff \relative {
     \clef "treble_8"
     \time c
     \key a \minor
     a8 c e a e c a
     %\override Fingering.direction = #DOWN
   }
   \new TabStaff \with { stringTunings = #guitar-tuning } \relative {
     % Backslash followed by number sets string used by tab
     \set TabStaff.restrainOpenStrings = ##t
     %\set TabStaff.minimumFret = #14
     a'8\3 c\2 e\1 a\1 e f g a
   }
>>

