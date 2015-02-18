
.PHONY: doc clean
doc:
	mkdir -p src
	mkdir -p inc
	sh generate_doc.sh

clean:
	rm -rf inc src
