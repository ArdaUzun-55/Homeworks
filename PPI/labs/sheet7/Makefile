OBJS = sheet7.o fcn_sheet7.o
TARGET = solution

IDIR = .

CC = gcc
CFLAGS = -std=c99 -Wall -Wextra -I$(IDIR)
LDFLAGS = -lm


.PHONY: clean all
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)

clean:
	rm $(TARGET) $(OBJS)
	
