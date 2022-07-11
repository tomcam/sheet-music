\header {
  title = "Arpeggio, sweep-picked"
  composer = "Composer"
}

\new StaffGroup <<
   \new Staff \relative {
     \clef "treble_8"
    / \time c
     \key a \minor
     % a'8-3 b-5 c-1 d-2 e-5 f-1 g-4 a-5
     % a8-3 b-5 c-1 d-2 e-5 f-1 g-4 a-5
     a8 b c d e f g a
     %\override Fingering.direction = #DOWN
   }
   \new TabStaff \with { stringTunings = #guitar-tuning } \relative {
     % Backslash followed by number sets string used by tab
     % a8-3 b-5 c-1 d-2 e-5 f-1 g-4 a-5
     a8 b c d e f g a
     %\set TabStaff.minimumFret = #5
     %\set TabStaff.restrainOpenStrings = ##t
   }
>>
