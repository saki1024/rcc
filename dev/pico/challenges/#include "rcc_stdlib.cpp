// *object detection

#include "rcc_stdlib.h"
using namespace std;

int main(){
stdio_init_all();
cyw43_arch_init();
rcc_init_i2c();
VL53L0X lidar;
rcc_init_lidar(&lidar);
Motor motors;
MotorInit(&motors, RCC_ENA, RCC_ENB, 20000);
MotorsOn(&motors);
MotorPower(&motors,0,0);


float desired = 200;
float actual;
float error;
float kp;
float power;

while(true){
    lidar_reading = getFastReading(&lidar);
    actual = static_cast<float>(lidar_reading);
    error = desired - actual;
    power = kp*error;
    power = max(min(power ,100.f)-100.f);
    int power_int = static_cast<int>(-1*power);
    MotorPower(&motors, power_int,power_int);
    cout << "des:" << desired << " act: " << actual << " err: " << error << " power: " << power_int 
         << '\n';
}

}