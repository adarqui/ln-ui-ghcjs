build:
	stack build --fast

clean:
	stack clean

until:
	until stack build; do echo eek; done

build-web:
	stack build
	find . -name "lnforum-ui-ghcjs-exe.jsexe" -exec rsync -av {}/ ./static/dist/ \;
	# fake min.js just so we don't have to change anything in dev mode
	cp static/dist/all.js static/dist/all.min.js

local: build-web

production: build-web
	closure-compiler static/dist/all.js --compilation_level=ADVANCED_OPTIMIZATIONS --jscomp_off=checkVars --create_source_map=static/dist/all.js.min.map > static/dist/all.min.js
	zopfli -i1000 static/dist/all.min.js > static/dist/all.min.js.gz
