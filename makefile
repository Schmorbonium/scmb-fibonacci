
ARCH=riscv32-unknown-elf
GNU_DIR=$(HOME)/riscv-compiler/install/rv32e
GNU_BIN=$(GNU_DIR)/bin


CC=$(GNU_BIN)/$(ARCH)-gcc
CXX=$(GNU_BIN)/$(ARCH)-g++
AS=$(GNU_BIN)/$(ARCH)-as
LD=$(GNU_BIN)/$(ARCH)-ld
OBJCOPY=$(GNU_BIN)/$(ARCH)-objcopy
OBJDUMP=$(GNU_BIN)/$(ARCH)-objdump
SIZE=$(GNU_BIN)/$(ARCH)-size
AR=$(GNU_BIN)/$(ARCH)-ar
RANLIB=$(GNU_BIN)/$(ARCH)-ranlib


CFLAGS+=-ffreestanding
CFLAGS+=-fno-pic
CFLAGS+=-march=rv32e -mabi=ilp32e


LDFLAGS+=-nostdlib
LDFLAGS+=-Wl,-Ttext=0x0

# see: https://github.com/riscv/riscv-gcc/issues/120
#LDFLAGS+=-Wl,--no-relax



ASFLAGS+=$(CFLAGS)
CXXFLAGS+=$(CFLAGS)

CLEAN_DIRS=$(SUBDIRS:%=clean-%)
ALL_DIRS=$(SUBDIRS:%=all-%)

OBJDUMPFLAGS+=-Mnumeric,no-aliases

.PHONY: all clean world $(CLEAN_DIRS) $(ALL_DIRS)


%.bin : %
	$(OBJCOPY) $< -O binary $@

%.lst : %
	$(OBJDUMP) $(OBJDUMPFLAGS) -dr $< > $<.lst

% : %.o crt0.o
	$(LINK.c) $(LDFLAGS) -o $@ $^ $(LDLIBS)
	$(SIZE) -x -A $@

%.s: %.c
	$(COMPILE.c) -S -o $@ $<

%.s: %.cc
	$(COMPILE.cc) -S -o $@ $<

%.o: %.c
	$(COMPILE.c) -o $@ $<

%.o: %.cc
	$(COMPILE.cc) -o $@ $<

%.srec: %
	$(OBJCOPY) $< -O srec $@




all:: $(ALL_DIRS)

clean:: $(CLEAN_DIRS)

$(ALL_DIRS)::
	$(MAKE) -C $(@:all-%=%) all

$(CLEAN_DIRS)::
	$(MAKE) -C $(@:clean-%=%) clean

world:: clean all

LDLIBS=
CFLAGS+=-Og

LDFLAGS+=-Wl,--no-relax
LDFLAGS+=-Wl,-Tdata=0x1000

PROGS=prog prog.bin prog.lst

all:: $(PROGS)

prog: crt0.o main.o
	$(LINK.c) -o $@ $^ $(LDLIBS)
	$(SIZE) -A -x $@

clean::
	rm -f $(PROGS) *.o *.s *.lst *.bin *.srec
