#include "rcc_stdlib.h"
using namespace std;

int main(void)
{
    stdio_init_all();

    if(cyw43_arch_init())
    {
        cout << "CYW43 init failed!" << "\n";
    }

    cyw43_arch_gpio_put(0, 1);
    printf("Hello World\n");
    bool ledState = true;
    for(int i=0; i<100; i++)
    {
        cyw43_arch_gpio_put(0, !ledState);
        ledState = !ledState;
        sleep_ms(500);
    }
    cyw43_arch_gpio_put(0, 0);
    printf("Goodbye :)");
}