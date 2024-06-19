CC = gcc
LD = gcc
CFLAGS = -ggdb -Wlto-type-mismatch -Wodr -flto -Wall -Werror -ansi -O0
LDFLAGS = -lstdc++
DEPENDENCIES = ./make.depend

TARGET = a.out
OBJS = foo.o bar.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CC) -x c++ -c $(CFLAGS) $<

.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: realclean
realclean: clean
	rm -f *~

.PHONY: run
run: $(TARGET)
	./$(TARGET)

.PHONY: install
install: $(TARGET)
	cp $(TARGET) $(HOME)/bin

$(DEPENDENCIES): depend

.PHONY: depend
depend:
	$(CC) $(CFLAGS) -MM *.cpp > $(DEPENDENCIES)

-include $(DEPENDENCIES)
