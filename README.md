# dlexDB

Ein R-Paket für den schnellen Zugriff auf lexikalische Statistiken aus dem dlexDB-Korpus (basierend auf dem DWDS-Kernkorpus).
Die Daten werden beim ersten Zugriff automatisch von Hugging Face heruntergeladen und lokal gecached.

## Installation

```r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("kliegl/dlexDB")
```

## Beipiele

### Statistiken für Wortliste

```r
library(dlexDB)

worte <- c("Haus", "Maus", "Sinn", "und")
stats <- dlex_lookup(worte)
print(stats)
devtools::install_github("kliegl/dlexDB")
print(ergebnis)
```

### Szenario aus dem Paper

Im Paper wird explizit die Suche nach Wörtern genannt, die mit "Ver" beginnen und auf "ungen" enden 
(wie Verhandlungen, Verletzungen).

Regex-Erklärung:
^    = Start des Wortes
Ver  = muss mit "Ver" beginnen
.* = beliebige viele Zeichen dazwischen
ungen$ = muss mit "ungen" enden

```r
paper_bsp <- dlex_regex("^Ver.*ungen$")

# Die häufigsten Treffer anzeigen
head(paper_bsp, 10)
```

###  Suffix-Suche mit Mindesthäufigkeit

Suche nach Wörtern, die auf -heit oder -keit enden,
aber eine gewisse Relevanz haben (Frequenz > 5 pro Mio).

 (heit|keit) = entweder "heit" oder "keit"

```r
suffix_bsp <- dlex_regex("(heit|keit)$", min_freq = 5)
print(suffix_bsp)
```
#### Komplexe Muster (z.B. Wörter ohne Vokale?)

Oder Wörter, die mit "Sch" beginnen und extrem kurz sind (max 4 Buchstaben).

^Sch = Beginnt mit Sch
.{1} = Genau ein beliebiges Zeichen danach
$    = Ende

```r
kurz_bsp <- dlex_regex("^Sch.{1}$")
print(kurz_bsp)
```

## Credits

Daten basieren auf dlexDB / DWDS Kernkorpus. 
R-Pake von Reinhold Kliegl, Kay-Michael Würzner und Gemini 3 Pro
 
