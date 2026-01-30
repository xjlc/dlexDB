library(dlexDB)

# Test-Wörter definieren
worte <- c("Haus", "Maus", "Sinn", "und", "psycholinguistisch")

# Abfrage starten
# ACHTUNG: Beim allerersten Mal dauert dies kurz,
# da die ~150MB Datei von Hugging Face geladen wird.
ergebnis <- dlex_lookup(worte)

# Tabelle anzeigen
print(ergebnis)


#Beispiel 1: Das Szenario aus dem Paper
# Im Paper wird explizit die Suche nach Wörtern genannt,
# die mit "Ver" beginnen und auf "ungen" enden (wie Verhandlungen, Verletzungen).

# Regex-Erklärung:
# ^    = Start des Wortes
# Ver  = muss mit "Ver" beginnen
# .* = beliebige viele Zeichen dazwischen
# ungen$ = muss mit "ungen" enden

paper_bsp <- dlex_regex("^Ver.*ungen$")

# Die häufigsten Treffer anzeigen
head(paper_bsp, 10)


# Beispiel 2: Suffix-Suche mit Mindesthäufigkeit
# Suche nach Wörtern, die auf -heit oder -keit enden,
# aber eine gewisse Relevanz haben (Frequenz > 5 pro Mio).

# (heit|keit) = entweder "heit" oder "keit"
suffix_bsp <- dlex_regex("(heit|keit)$", min_freq = 5)

print(suffix_bsp)

# Beispiel 3: Komplexe Muster (z.B. Wörter ohne Vokale?)
# Oder Wörter, die mit "Sch" beginnen und extrem kurz sind (max 4 Buchstaben).

# ^Sch = Beginnt mit Sch
# .{1} = Genau ein beliebiges Zeichen danach
# $    = Ende
kurz_bsp <- dlex_regex("^Sch.{1}$")

print(kurz_bsp)

