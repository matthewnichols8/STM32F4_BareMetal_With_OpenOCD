CC=arm-none-eabi-gcc
MACH=cortex-m4
CFLAGS= -c -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -O0
LDFLAGS= --spec=nano.specs -T stm32_ls.ld -Wl, -Map=final.map

all:main.o led.o stm32_startup.o syscalls.o final.elf

main.o:main.c
	$(CC) $(CFLAGS) -o $@ $^

led.o:led.c
	$(CC) $(CFLAGS) -o $@ $^

stm32_startup.o:stm32_startup.c
	$(CC) $(CFLAGS) -o $@ $^

syscalls.o:syscalls.c
	$(CC) $(CFLAGS) -o $@ $^

final.elf:main.o led.o startup.o syscalls.o
	$(CC) $(LDFLAGS) -o $@ $^
clean:
	rm -rf *.o *.elf
load:
	openocd -f board/stm32fdiscovery.cfg
