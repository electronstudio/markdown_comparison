# Comparing Markdown, Asciidoc and ReST for producing a PDF book

I want to know which format I should use to write my next book, so I wrote a chapter in several formats and used several programs to produce PDFs to copmpare.

The formats: Markdown (Pandoc variant), Markdown (Softcover variant), Asciidoc, ReStructuredText

The software: Pandoc (with and without Eisvogel template), Softcover, Asciidoctor, Sphinx.

# Pandoc-flavoured Markdown (Pandown)

I'm going to call the Pandoc variant of Markdown *Pandown* to avoid confusion with Pandoc the software and confusion with the standard Markdown format.

The lowest common denominator. Easy syntax to write. Used everywhere.

You would think it would easy to convert to any of the alternatives using Pandoc because they all have a super-set of Markdown’s features, but if you don't stick to core Markdown and use any of the Pandown extensions you will need to do additional work every time you convert.

Lack of standardisation is the issue. Pandown adds extensions for image sizing and code highlighting but if you use these then other programs like Jekyll (and GitHub pages) will display the codes they don’t understand.

????However the code listing stuff is hacky, and it’s impossible to fully control page breaks.

## PDF Output

Pandoc: ok, could use some template tweaking

Pandoc+Eisvogel: good.

Sphinx: poor, because Sphinx doesn't understand Pandoc extensions.  (It has it's own equivalent extensions in myst_parser, but Pandoc, Github, etc won't understand them, so then you might as well just write in ReST.)


#  Softcovered-flavored Markdown (Softmark)

Softcover is a program that coverts Markdown to PDF via Latex. Unusually, HTML (and ePub) is then produced from the Latex. The result is a great looking PDF book but you don't have as many options when it comes to styling the HTML as you do with the other programs.

The extensions over basic Markdown work by you inserting Latex into your document, and you will have to do that to get a nice layout, so it’s perhaps not very portable and not very widely used.  However if you were considering writing your book in your Latex anyway this is easier, especially if you've already been writing Markdown.

## PDF Output

Softcover: good, but requires adding page break hints to prevent weird layouts which I haven’t done yet.

No other programs will read softcover markdown.

## Converting from Pandown to Softmark

This has to be done manually.

Softcover can't deal with yaml metadata at the start of the document, so it has to be removed (and put into a `config.yml` file.)

Line highlighting format is different, but overall better because you can combine syntax highlighting with
line highlighting.  Instead of `{emphasize=5-7}` you replace with `
```gdscript, options: "hl_lines": [5, 6, 7]`


Not possible to specify image sizes.  So have to delete every occurance of `{width=70%}`.  The images are then too big and also the captions are not shown.  To fix this, convert them all to figures which are sized automatically by adding labels to the caption, e.g. `![Caption\label{fig:image}](image.png)`

You can then also insert references to them `\ref{fig:image}`.

Links don't display the URL in the PDF output.  Have to manually add them as footnotes.

Numbered lists often get messed up by Softcover attempting to helpfully replace your numbers with ones it thinks are better.  Mostly this is fixable by careful indenting, but for code listing you must not indent and you must remove any empty lines between the code and the paragraph above.

# Asciidoc

Fairly nice looking syntax that is partly compatible with markdown.

Adds things like sidebars that are useful in books.

For PDF output they originally converted to docbook and/or latex first. I haven’t tried this method but it’s depreciated. Currently they generate PDF directly from asciidoc. I

## PDF Ouput

Asciidoctor: pretty nice. Fonts can be customed easily.

However it doesn’t look quite as nice as Latex. The default templates don't look good and it took me quite a while to customize them myself - I couldn't find any ready-to-print examples to copy online.  Footnotes at bottom of page aren't supported but they are working on improving this.

Surprisingly, Pandoc has not yet implemented support for reading Asciidoc, so Asciidoctor is probably your only choice of software.

Todo: try converting to Docbook and then to PDF from there.

## Converting from Pandown to Asciidoc

Conversion from pandoc is mostly automatic.  Just add headers to file:
```
= Godot High Score Tables
Richard Smith
:source-highlighter: rouge
:doctype: book
:toc:
```

Code line highlighting is easy but doesn't convert because it's not a standard part of pandoc, it's an extension.  So have to insert `[source,gdscript,highlight='4-4']` above listings you want
lines highlighted.

Image captions don't get convert converted correctly, need to fix every image.



# ReStructuredText (RST)

Probably the most advanced, and used by big projects like Python and Linux, but the syntax is horrible.  It can read Markdown files but I don’t think you can mix and match in the same file (?).

Converting from Pandoc Markdown mostly works - just needs a book title added at the top.
Images are given alt tags which are sometimes too long and cause errors.

## PDF Output

Sphinx: the default template is quite poor, but after doing some tweaking the results are good.

Pandoc: ok, almost the same as using Markdown (Pandoc)

Pandoc+Eisvogel: good, almost the same as using Markdown (Pandoc)



# Verdict

Pandoc probably *could* do everything, but you would have to install lots of non-standard extensions and/or write your own templates, so if you want to stick to standards and supported-out-of-the-box advanced formatting, you will need to use one of the others.

Asciidoc is my favourite syntax, but the PDF software isn't *quite* ready yet, so can't recommend it, and so  ReStructuredText beats it currently.

ReStructuredText can also give you the same output that Markdown (Pandoc) gives by using the same software, in addition to what you can produce with Sphinx.  Therefore strictly RST beats Pandown too.  However it is not as easy to write so you might still choose Pandown if you don't need all the features.


# Features Comparison

|            | Pandown | Softmark | Asciidoc | ReST |
| -----------| ------- | -------- | -------- | ---- |
| Hyperlinks | 1       | 1        | 0**        | 1    |
| Footnotes  | 1       | 1        | 0        | 1    |
| Line highlight | 0*   | 1        | 0        | 1    |
| References | 1       | 1        | ?        | 1    |
| Figures    | 1       | 1        | 1        | 1    |
| Admonitions| 0*       | 0        | 1        | 1    |
| Sidebar    | 0        | 0        | 1        | 1    |
| **Total**    | 4       | 5       | 4        | 7    |

\* there is an extension available but it's either not complete or difficult to install

\** You can get hyperlinks to display if you enable `:media: prepress` but they look pretty horrible because of the lack of footnote support.

TODO: look at citations and equations for more academic documents.

# Subjective Output Quality Comparison

|            | Pandown | Softmark | Asciidoc | ReST |
| -----------| ------- | -------- | -------- | ---- |
| PDF        | 9       | 10        | 9       | 10    |
| HTML       | 10      | 8        | 9      | 10    |

Note that Asciidoc and ReST do requring tweaking to achieve this nice PDF.  For HTML I'm mostly
comparing the quantity of themes that are available.
 