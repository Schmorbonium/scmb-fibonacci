#include <stdint.h>

uint32_t a = 1;
uint32_t b = 1;
uint8_t toggle = 0;

int main() {
    while (1) {
        if (toggle) {
            a += b;
            toggle = 0;
        } else {
            b += a;
            toggle = 1;
        }
    }
    return 0;
}