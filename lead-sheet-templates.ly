% Lead sheet with:
% - Guitar fretboard diagrams
% - Override a predefined fretboard diagram
% - Pickup note with text above it suppressed
% - Chord and other text suppressed above the pickup note
%%%% Please send critiques to tomcampbell@gmail.com
%%%% COMPLETELY reshaped by Valentin Petzel. 
%%%% Valentin's generous and brilliant first post is here:
%%%% https://lists.gnu.org/archive/html/lilypond-user/2022-02/msg00480.html. Thanks so much!
\version "2.22"

%%%% STARTING INCLUDABLE TEMPLATE
#(define (music-or-false? m) (or (ly:music? m) (not m)))
#(define (music-or-list-or-false? m) (or (music-or-false? m) (list? m)))

leadsheetScore =
#(define-void-function (title composer voice chords lyrics)
   (markup? (markup? "Trad.") music-or-false? music-or-false? music-or-list-or-false?)
   (let* ((CN (if chords #{ \new ChordNames $chords #} (empty-music)))
          (FB (if chords
                  (if voice
                      #{ \new FretBoards $chords #}
                      #{ \new FretBoards \with { \consists Bar_engraver \override BarLine.bar-extent = #'(-6 . 3) } $chords #})
              (empty-music)))
          (VC (if voice #{ \new Staff \new Voice="auto" $voice #} (empty-music)))
          (LY (if lyrics
                  (if voice
                      (if (ly:music? lyrics)
                          (list #{ \new Lyrics \lyricsto "auto" $lyrics #})
                          (map (lambda (x)
                                 (if (ly:music? x)
                                     #{ \new Lyrics \lyricsto "auto" $x #}
                                     (if (pair? x)
                                         ; If x is a pair of the form (key . music) we create a stanza indication
                                         #{ \new Lyrics \lyricsto "auto" { \set stanza =
                                                                           $(if (markup? (car x))
                                                                                         (car x)
                                                                                         (format "~a" (car x)))
                                                                           $(cdr x) } #})))
                                     lyrics))
                      (if (ly:music? lyrics)
                          (list #{ \new Lyrics $lyrics #})
                          (map (lambda (x)
                                 (if (ly:music? x)
                                     #{ \new Lyrics $x #}
                                     (if (pair? x)
                                         ; If x is a pair of the form (key . music) we create a stanza indication
                                         #{ \new Lyrics { \set stanza =
                                                          $(if (markup? (car x))
                                                                        (car x)
                                                                        (format "~a" (car x)))
                                                          $(cdr x) } #})))
                                     lyrics)))
                  (empty-music)))
          (mus (make-music 'SimultaneousMusic
                           'elements
                           `(,CN ,FB ,VC . ,LY)))
          (score
           #{
             \score {
               \header {
                 title = #title
                 composer = #composer
               }
               $mus
              \layout { }
              \midi { }
            }
          #}))
     (add-score score)))

\paper {
  print-all-headers = ##t
}


%%%% STARTING CONTENT

\include "predefined-guitar-fretboards.ly"

% Override predefined fretboard for e minor.
% This just adds a G to the first (highest) string.
% A little contrived but it's brief.
\storePredefinedDiagram #default-fret-table \chordmode { e:m }
#guitar-tuning
#"o;2-2;2-3;o;o;3-4;"

theMelody = \relative c {
  \clef treble
  \key e \minor
  \time 6/8

% Pickup note
  \partial 8 e'8

% Verse melody (truncated for clarity)
g4 a8 b4 e8
d8. e16 fis8 
e4 b16 c

}

theLyrics = \lyricmode {
When Daph -- ne from fair 
  Phoe -- bus did fly the __
}

theChords = \chordmode {
% Replace the N.C. that would appear over
% the pickup note
\time 6/8
\set noChordSymbol = ""
\partial 8 r8 
  e2.:min
  b4.:min
  e4.:min
 }

%%% SAME AS BEFORE
\leadsheetScore "Hit and Miss (Daphne) with fretboard charts" \theMelody \theChords \theLyrics

%%% NO CHORDS
\leadsheetScore "Hit and Miss (Daphne), no fretboard charts" "theComposer" \theMelody ##f \theLyrics

sI = \theLyrics

sII = \lyricmode {
This is a se -- cond stan -- _ _ za,
}

%%% MULTIPLE LINES OF LYRICS
\leadsheetScore "Hit and Miss (Daphne), no chords, multiple verses" "theComposer" \theMelody ##f #`(,sI ,sII)

%% DUE TO NEW VALUES BEING APPENDED WE NEED TO REVERSE THE ORDER
alyrics.2 = \sII
alyrics.1 = \sI

%%% MULTIPLE LINES OF LYRICS WITH STANZA INDICATIONS NOT GIVEN IN THE LYRICS THEMSELVES (BUT BY AN ALIST)
\leadsheetScore "Hit and Miss (Daphne), no chords, numbered verses" "theComposer" \theMelody ##f \alyrics

rhythmicLyrics = \lyricmode {
When8 Daph4 -- ne8 from4 fair8 
  Phoe8. -- bus16 did8 fly4 the8
She8 gave4 no8 ear4
}

%%% NO VOICE
\leadsheetScore "Hit and Miss (Daphne), fretboard chord charts only" "theComposer" ##f \theChords \rhythmicLyrics