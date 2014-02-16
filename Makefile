CC := gcc

ifeq ($(release), y)
    CFLAGS := -O2 -Wall -Werror -DNDEBUG
else
    CFLAGS := -g -Wall -Werror
endif

LIBS := -lpthread

OBJS := $(patsubst %c, %o, $(wildcard *.c))

TARGET := log-test

.PHONY: all clean

all: $(OBJS) $(TARGET)

log-test: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJS)
