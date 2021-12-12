/* Based on ...
 *  example of MMC3 for cc65
 *	Doug Fraker 2019
 */
#include "lib/nesdoug.h"
#include "lib/neslib.h"
#include "lib/unrle.h"
#include "mmc3/mmc3_code.h"
#include "music/soundtrack.h"
#include "music/soundfx.h"
#include "charmap.h"
#include "main.h"
#include "irq_buffer.h"
#include "temp.h"
#include "wram.h"
#include "../assets/nametables.h"
#include "../assets/palettes.h"
#include "../assets/sprites.h"

#pragma bss-name(push, "ZEROPAGE")

// GLOBAL VARIABLES
unsigned char unseeded;
#ifdef DEBUG
unsigned char gray_line_enabled;
#endif

// Game stuff

#pragma bss-name(pop)
// should be in the regular 0x300 ram now

// the fixed bank

#pragma rodata-name ("RODATA")
#pragma code-name ("STARTUP")

void draw_screen();
void draw_sprites();

void main (void) {
  set_mirroring(MIRROR_HORIZONTAL);
  bank_spr(1);
  irq_array[0] = 0xff; // end of data
  set_irq_ptr(irq_array); // point to this array

  init_wram();

  ppu_off(); // screen off
  pal_bg(bg_palette); //	load the BG palette
  pal_spr(sprites_palette); // load the sprite palette

  set_chr_mode_2(BG_MAIN_0);
  set_chr_mode_3(BG_MAIN_1);
  set_chr_mode_4(BG_MAIN_2);
  set_chr_mode_5(BG_MAIN_3);
  set_chr_mode_0(SPRITE_0);
  set_chr_mode_1(SPRITE_1);

  set_vram_buffer();
  clear_vram_buffer();

  draw_screen();

  while (1){ // infinite loop
    ppu_wait_nmi();
    clear_vram_buffer();

    double_buffer_index = 0;

    // load the irq array with values it parse
    // ! CHANGED it, double buffered so we aren't editing the same
    // array that the irq system is reading from


    double_buffer[double_buffer_index++] = 0xff; // end of data

    draw_sprites();

#ifdef DEBUG
    if (gray_line_enabled) gray_line();
#endif

    // wait till the irq system is done before changing it
    // this could waste a lot of CPU time, so we do it last
    while(!is_irq_done() ){}

    // copy from double_buffer to the irq_array
    // memcpy(void *dst,void *src,unsigned int len);
    memcpy(irq_array, double_buffer, sizeof(irq_array));

#ifdef DEBUG
    if (gray_line_enabled) gray_line();
#endif
  }
}

void draw_sprites (void) {
  oam_clear();

}

void draw_screen (void) {
  if (irq_array[0] != 0xff) {
    while(!is_irq_done() ){}
    irq_array[0] = 0xff;
    double_buffer[0] = 0xff;
  }

  // draw some things
  vram_adr(NTADR_A(0,0));
  vram_unrle(empty_qr_nametable);

  set_scroll_x(0);
  set_scroll_y(0);

  set_chr_mode_2(BG_MAIN_0);
  set_chr_mode_3(BG_MAIN_1);
  set_chr_mode_4(BG_MAIN_2);
  set_chr_mode_5(BG_MAIN_3);
  set_chr_mode_0(SPRITE_0);
  set_chr_mode_1(SPRITE_1);

  pal_bg(bg_palette);
  pal_spr(sprites_palette);

  oam_clear();

  ppu_on_all();
  pal_fade_to(0, 4);
}
