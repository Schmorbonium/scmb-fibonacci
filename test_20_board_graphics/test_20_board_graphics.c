#include <stdint.h>

#define GRAPHICS_START 0x80008000

#define GRAPHICS_BOARD_HEIGHT_ADDR 0x80007008
#define GRAPHICS_BOARD_WIDTH_ADDR 0x80007004

#define HEIGHT 20
#define WIDTH 10
#define COLOR_COUNT 7

volatile uint8_t* heightPtr = (uint8_t*)GRAPHICS_BOARD_HEIGHT_ADDR;
volatile uint8_t* widthPtr = (uint8_t*)GRAPHICS_BOARD_WIDTH_ADDR;

void main() {
    int i = 0;
    int len = 1;
    int maxLen = HEIGHT * WIDTH;

    *heightPtr = HEIGHT;
    *widthPtr = WIDTH;
    uint8_t* ptr = (uint8_t*)GRAPHICS_START;

    while (1) {
        for (i = 0; i < HEIGHT; i++) {
            for (int j = 0; j < WIDTH; j++) {
                ptr[i*WIDTH + j] = i;
            }
        }

        for (i = 0; i < HEIGHT; i++) {
            for (int j = 0; j < WIDTH; j++) {
                ptr[i*WIDTH + j] = 0;
            }
        }
    }
}

int mod(int a, int b) {
    while (a > b) {
        a -= b;
    }
    return a;
}