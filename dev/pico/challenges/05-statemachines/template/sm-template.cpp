#include "rcc_stdlib.h"
using namespace std;

typedef enum{
     CHECK_VALUE,
     FWD,
     STOP,
     REV
} state_t;

int main(){
    stdio_init_all();
    sleep_ms(1500);
    cyw43_arch_init();
    cyw43_arch_gpio_put(0, 1); //turns on led

    //init robot's sensors and actuators here~~

    //rename state_name to something more informative
    state_t state_name =CHECK_VALUE;

    while(true){
    	if(my_state==CHECK_VALUE)
    	val=adc_read();
    	if(val<2000){
    	my_state=FWD;
    	}
    	
    	if(my_state==FWD){
    	cout<<"FWD\n";
    	my_state=CHECK_VALUE;
    	}
        
    }
}