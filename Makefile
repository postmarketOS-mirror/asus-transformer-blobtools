TARGETS=blobunpack blobpack
DEPS = Makefile shared/blob.h
COMMON=

CC=gcc
CFLAGS+=-I. -Ishared -Wall -ggdb
LDFLAGS=

OBJS	= $(COMMON) $(addsuffix .o, $(TARGETS))

all: $(TARGETS)

$(TARGETS): %: %.o $(COMMON) $(DEPS)
	$(CC) $(CFLAGS) -o $@ $< $(COMMON) $(LDFLAGS)

$(OBJS): %.o: src/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(TARGETS) *.o
