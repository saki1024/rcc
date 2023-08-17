// motor turns

#include "rcc_stdlib.h"
using namespace std;
#define rot90 65

 
 int j otate90(Motor* motorPointer, Left_Odom* left, Right_Odom* right, bool dir) {
    int initial_count;
    int current_count;
 }

int main(){

    Motor motors; //struct setup
    MotorInit(&motors, RCC_ENA, RCC_ENB, 1000); //setup 
    MotorsOn(&motors); //enable PWM
     
    while(true)
    {
        

            MotorPower(&motors, 100, 100); //move_forward(&motors, &left, &right, 200); //run for 100 counts
            sleep_ms(200);
            rot90(&motors, &left, &right, true); //turn right
            sleep_ms(200);
            MotorPower(&motors, 100, 100);//move_forward(&motors, &left, &right, 200); //run for 100 counts
            sleep_ms(200);
            rot90(&motors, &left, &right, true); 
            sleep_ms(200);
            MotorPower(&motors, 100, 100);//move_forward(&motors, &left, &right, 200); //run for 100 counts
            sleep_ms(200);
            rot90(&motors, &left, &right, true); 
            sleep_ms(200);
            MotorPower(&motors, 100, 100);//move_forward(&motors, &left, &right, 200); //run for 100 counts
            sleep_ms(200);
            rot90(&motors, &left, &right, true); 
            MotorPower(&motors, 0, 0); //stop
            
        }
    
    
    }



    