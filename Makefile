build:
	stack build --fast

clean:
	stack clean

until:
	until stack build; do echo eek; done

build-web:
	stack build
	find . -name "ln-ui-ghcjs-exe.jsexe" -exec rsync -av {}/ ./static/dist/ \;
	# fake min.js just so we don't have to change anything in dev mode
	cp static/dist/all.js static/dist/all.min.js

production:
	ccjs static/dist/all.js --compilation_level=ADVANCED_OPTIMIZATIONS > static/dist/all.min.js
