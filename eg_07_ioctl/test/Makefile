BIN = ioctl_test.out

all: $(BIN)

$(BIN): main.c
	gcc -static -o $(BIN) main.c

.PHONY: clean
clean:
	rm -f $(BIN)