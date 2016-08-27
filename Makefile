#
# Makefile written by Zubeen Tolani <ZeekHuge - zeekhuge@gmail.com>
# Copyright (C) 2016 Zubeen Tolani <ZeekHuge - zeekhuge@gmail.com>
#
#

CC?=gcc
CFLAGS=$(shell curl-config --cflags)
LIBS=$(shell curl-config --libs)
GEN_FOLDER=gen

source += doCodechef.c
output +=$(patsubst %.c,%,$(source))

.PHONY: all
all:
	@for f in $(output) ; do                                         \
	$(MAKE) $$f 							;\
	done

.PHONY: %
%:$(file)
	@echo "	CC	$@"
	@mkdir -p $(GEN_FOLDER)
	@$(CC) $(patsubst %,%.c, $@) $(CFLAGS) $(LIBS) -o $(GEN_FOLDER)/$@

.PHONY: clean
clean:
	@for f in $(output) ; do                                         \
	echo " CLEAN	$$f"						;\
	\rm $$f ;\
	done
