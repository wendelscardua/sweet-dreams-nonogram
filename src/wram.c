#include "lib/neslib.h"

#pragma bss-name(push, "XRAM")
// extra RAM at $6000-$7fff

#define WRAM_VERSION 0x0001
unsigned int wram_start;

unsigned char grid[25][25];

#pragma bss-name(pop)

#pragma code-name ("CODE")

void init_wram (void) {
  if (wram_start != WRAM_VERSION)
    memfill(&wram_start,0,0x2000);
  wram_start = WRAM_VERSION;
}
