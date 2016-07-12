build:
	stack build --fast

clean:
	stack clean

until:
	until stack build; do echo eek; done

# TODO FIXME
prod:
	ccjs all.js --compilation_level=ADVANCED_OPTIMIZATIONS  > all.min.js
