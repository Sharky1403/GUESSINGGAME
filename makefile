.PHONY: all FORCE

all: README.md

README.md: guessinggame.sh makefile FORCE
	@printf '# Guessing Game\n\n' > README.md
	@printf '**Date et heure de generation :** %s\n\n' "$$(date '+%Y-%m-%d %H:%M:%S %Z')" >> README.md
	@printf '**Nombre de lignes de code dans guessinggame.sh :** %s\n' "$$(wc -l < guessinggame.sh | tr -d '[:space:]')" >> README.md

FORCE:
