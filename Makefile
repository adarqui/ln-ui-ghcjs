build:
	stack build --fast

clean:
	stack clean

until:
	until stack build; do echo eek; done

# TODO FIXME
prod:
	ccjs all.js --compilation_level=ADVANCED_OPTIMIZATIONS  > all.min.js

build-web:
	stack build
	cp ./.stack-work/install/x86_64-osx/lts-6.6/ghcjs-0.2.0.900006006_ghc-7.10.3/bin/ln-ui-ghcjs-exe.jsexe/* static/dist
