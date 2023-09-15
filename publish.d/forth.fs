hex
: words vlist ; ( FIGFORTH 1.1 )
: depth sp@ 12 +origin @ swap - 2 / ;
: .s
   depth -dup
   if
      3C emit space
      depth 1 - .   3E emit space
      0
      do
         sp@
         depth i - 2 - 2 * +
         @ .
      loop
      quit
   then
   ." stack empty." space
;

( https://atariwiki.org/wiki/ )
( Wiki.jsp?page= )
( LangForthFigOneOneScreen )
( Fri 15 Sep 06:05:20 UTC 2023 )
( end. )
