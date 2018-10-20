run:
	hugo serve

update-theme:
	git submodule update --init
	git submodule update --recursive --remote
