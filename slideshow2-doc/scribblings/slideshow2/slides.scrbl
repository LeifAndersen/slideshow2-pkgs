#lang scribble/doc
@(require "ss.rkt")

@title{Making Slides}

@declare-exporting[slideshow2/base slideshow2]

@defmodule*/no-declare[(slideshow2/base)]

@local-table-of-contents[]

@defproc[(slide [#:title title (or/c #f string? pict?) #f]
                [#:timeout secs (or/c #f real?) #f]
                [element (flat-rec-contract elem/c
                           (or/c pict?
                                 'next 'alts 'nothing
                                 comment?
                                 (listof (listof elem/c))))])
          slide?]{
Bla
}
