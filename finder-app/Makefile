CC=gcc
ifeq ($(CROSS_COMPILER), aarch64-none-linux-gnu-)
	CC=aarch64-none-linux-gnu-gcc
endif

CFLAGS=-DDEBUG -g -O3 -Wall
# LIBS=

CFILES=writer.c
# HFILES=
OFILES=writer.o
TARGET = writer

all: $(TARGET)


$(TARGET): $(OFILES) $(HFILES)
		$(CC) $(LDFLAGS) -o $@ $(OFILES) $(LIBS)

%.o: %.c $(HFILES)
		$(CC) -c $(CFLAGS) -o $@ $<

clean:
		rm -f $(TARGET) $(OFILES)