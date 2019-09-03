#binaries
TSC=tsc
TSLINT=tslint

#source dir
TS_DIRS=./apps ./lib ./library

#source files
TS_SRC ::= $(shell find $(TS_DIRS) -name '*.ts' -not -name "*.d.ts")

#compilation options/binary flags
TSC_FLAGS = --sourceMap -t ES5 --noEmitOnError

#outfiles
JS_OUT ::= $(patsubst %.ts, %.js, $(TS_SRC))

.PHONY: all

all: $(word 1, $(JS_OUT))

$(word 1, $(JS_OUT)): $(TS_SRC)
    $(TSLINT) $?
    $(TSC) $(TSC_FLAGS) $(TS_SRC)
