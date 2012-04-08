all: gufm

gufm: gufm.c
	cc -o gufm gufm.c -lf2c

gufm.c: gufm.f
	f2c gufm.f

clean:
	rm -f gufm gufm.c
