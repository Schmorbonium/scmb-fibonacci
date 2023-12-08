#include <stdint.h>

#define GRAPHICS_START 0x80008000

#define GRAPHICS_BOARD_HEIGHT_ADDR 0x80007008
#define GRAPHICS_BOARD_WIDTH_ADDR 0x80007004

#define HEIGHT 20
#define WIDTH 10
#define COLOR_COUNT 7

void main() {
    int i = 0;
    int len = 1;
    int maxLen = HEIGHT * WIDTH;

    *((uint8_t*)GRAPHICS_BOARD_HEIGHT_ADDR) = HEIGHT;
    *((uint8_t*)GRAPHICS_BOARD_WIDTH_ADDR) = WIDTH;

    while (1) {
        uint8_t* ptr = (uint8_t*) GRAPHICS_START;
        for (i = 0; i < len; i++) {
            *ptr = mod(i, COLOR_COUNT);
            ptr++;
        }
        len++;
        if (len > maxLen)
            len = 0;
    }
}

int mod(int a, int b) {
    while (a > b) {
        a -= b;
    }
    return a;
}