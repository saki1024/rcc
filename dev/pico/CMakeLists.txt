cmake_minimum_required(VERSION 3.13)
set(CMAKE_C_STANDARD 11) 
set(CMAKE_CXX_STANDARD 17)


set(PICO_BOARD pico_w) # Force pico_w so onboard led and wireless sdk stuff is built
include(pico_sdk_import.cmake)
project(rcc_pico_dev C CXX ASM)
pico_sdk_init()

add_subdirectory(include)
add_subdirectory(../../lib lib)
add_subdirectory(sensors)
add_subdirectory(util)

macro(make_exec exec_name exec_dir)
    add_executable(${exec_name} ${exec_dir})
    
    pico_add_extra_outputs(${exec_name})

    pico_enable_stdio_usb(${exec_name} 1)
    pico_enable_stdio_uart(${exec_name} 0)
    
# For debugging with openocd (comment out above)
    # pico_enable_stdio_usb(${exec_name} 0)
    # pico_enable_stdio_uart(${exec_name} 1)

# Allow hash-library-sha1 to find endian.h which is in include directory
    target_include_directories(hash-library-sha1 PUBLIC include)

    target_compile_definitions(${exec_name} PUBLIC
                        # Set WIFI parameters with cmake cmd
                            WIFI_SSID=\"${WIFI_SSID}\"
                            WIFI_PASSWORD=\"${WIFI_PASSWORD}\"
                            CYW43_HOST_NAME=\"${CYW43_HOST_NAME}\"

                        # Forced values for WIFI params
                            # WIFI_SSID=<"MY_WIFI_ROUTER"
                            # WIFI_PASSWORD="MY_WIFI_ROUTER_PASS"
                            # CYW43_HOST_NAME="NAME_I_WANT MY PICO TO HAVE ON NETWORK"

                        # Pico Sdk
                            PICO_MAX_SHARED_IRQ_HANDLERS=6 #IMPORTANT!! It seems default shared irq is 2, we need more.
                            
                        # Related to wireless capabilities
                            # PICO_CYW43_ARCH_BACKGROUND
    )

    target_include_directories(${exec_name} PUBLIC
                            ${CMAKE_CURRENT_LIST_DIR}
                            ${PICO_SDK_PATH}
                            wireless/include #TODO: Turn into CMake compatible directory (lib)
                            include
                            
    )

    target_link_libraries(${exec_name}
                            pico_cyw43_arch_lwip_threadsafe_background # For wireless
                            # pico_cyw43_arch_none
                            pico_stdlib
                            hardware_adc
                            hardware_pwm
                            # pico_multicore
                            serial-packets
                            hardware_i2c
                            sensors
                            util
    )



endmacro()

# macro template
# make_exec(arg1 arg2)
# arg1 = desired uf2 name
# arg2 = location of cpp file relative to the current /pico directory 

# Test files
# make_exec(wireless tests/wireless_interface_test.cpp)
# make_exec(mpu6050_test tests/mpu_6050_test.cpp)
# make_exec(lidar_test tests/lidar_test.cpp)
# make_exec(multi_i2c_test tests/multi_i2c_test.cpp)
# make_exec(lidar_test tests/lidar_test.cpp)
# make_exec(multi_i2c_test tests/multi_i2c_test.cpp)
# make_exec(hcsr04_test tests/hcsr04_test.cpp)
# make_exec(odom_test tests/odom_test.cpp)
# make_exec(servo_pot_test tests/servo_pot_test.cpp)
# make_exec(motor_test tests/motor_test.cpp)
# make_exec(frequency_test tests/frequency_test.cpp)
# make_exec(control_test tests/control_test.cpp)
# make_exec(all_sensor_test tests/all_sensor_test.cpp)
# make_exec(vel_control_test tests/vel_control_test.cpp)
# make_exec(conversions challenges/02-functions/1-conversions-sol/1-conversions-sol.cpp)
# make_exec(blink_test tests/blink_test.cpp)
# make_exec(motor_polarity_test tests/motor_polarity_test.cpp)
# make_exec(back_emf_test tests/back_emf_test.cpp)
# make_exec(servo_forward tests/servo_forward.cpp)
# make_exec(back_emf_test tests/back_emf_test.cpp)

# Lessons
# make_exec(helloworld lessons/01/helloworld.cpp)
# make_exec(debug lessons/01/debug.cpp)
# make_exec(01_odom_stop_test challenges/03-sensor1/solutions/04-odom/01-odom-stop200.cpp)
# make_exec(motor_characterization challenges/03-sensor1/solutions/03-motor/motor-characterization.cpp)
# make_exec(02_odom_straight_for challenges/03-sensor1/solutions/04-odom/02-odom-straight-for-200.cpp)
# make_exec(06_rotate_robot challenges/03-sensor1/solutions/04-odom/06-rotate-robot.cpp)
 # make_exec(09_pathfollowing challenges/03-sensor1/solutions/04-odom/09-pathfollowing.cpp )
# make_exec(01_liadarspinning challenges/03-sensor1/solutions/05-lidar/01-lidar-spinning-robot.cpp)
# make_exec(02_lidarspinning challenges/03-sensor1/solutions/05-lidar/02-lidar-spinning-function.cpp)
# make_exec(01_hitbreaks challenges/03-sensor1/solutions/06-autonomous/01-hit-the-brakes.cpp )
# make_exec(00_blinkled challenges/03-sensor1/solutions/01-led/00-blink-led.cpp)
# make_exec(02_followobject challenges/03-sensor1/solutions/06-autonomous/02-follow-object.cpp)
# make_exec(03_targetfound challenges/03-sensor1/solutions/06-autonomous/03-target-found.cpp)
# make_exec(05_pathfollowupgraded challenges/04-sensor2/solutions/distances/05-pathfollowupgraded.cpp)
# make_exec(02_velocity challenges/04-sensor2/solutions/integration/02-velocity.cpp)
# make_exec(drive_straight challenges/drive_straight.cpp)
# make_exec(AUTONUMUS challenges/Untitled-1.cpp)
make_exec(motor_turns using-robot-examples/Untitled-1.cpp)
