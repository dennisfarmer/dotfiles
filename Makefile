sync:
	stow .

sync_overwrite:
	stow --adopt .
	git restore .