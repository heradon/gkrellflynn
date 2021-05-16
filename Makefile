#
# Makefile for gkrellflynn
#
# updated for gkrellm2.0
# 2021 removed gkrellm (c) Heradon

CC = gcc
CFLAGS = -c -O -Wall -fPIC `${EXTRACONF}`

LD = $(CC)
LDFLAGS = -shared -o
INCPATH  = -I.
INCPATH += ${GKRELL_INC}

TARGET = gkrellflynn.so

OBJS = gkrellflynn.o

all:
	@echo "     make gkrellm2"

gkrellm2:
	(make GKRELL_INC=-DGKRELLM2 EXTRACONF="pkg-config --cflags gtk+-2.0 gthread-2.0" ${TARGET})

${TARGET}:	${OBJS}
		${LD} ${DEBUG} ${LDFLAGS} ${TARGET} ${OBJS}

clean:
	rm -f ${OBJS}
	rm -f ${TARGET}

install:
	@echo "     make installgkrellm2"

installgkrellm2: 
	./install-sub.sh	${TARGET} gkrellm2

%.o :	%.c
	${CC} ${CFLAGS} $(INCPATH) -o $@ $<
