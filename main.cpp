#include <QCoreApplication>

#include "dji_command.hpp"
#include "dji_vehicle.hpp"
#include "dji_status.hpp"
#include "dji_telemetry.hpp"
#include "dji_linux_helpers.hpp"

#include "flight_control_sample.hpp"

using namespace DJI::OSDK;
using namespace DJI::OSDK::Telemetry;

//namespace onboardSDK{

int main(int argc, char *argv[])
{

    int functionTimeout = 1;
    char* config_file[2] = {"","/home/miguel/rep18/hsfl-dji/UserConfig.txt"};
    LinuxSetup linuxEnvironment (2, config_file);
    Vehicle* vehicle = linuxEnvironment.getVehicle();

    if (vehicle == NULL){
        std::cout << "no mo drone \n";
        return -1;
    }

    vehicle->obtainCtrlAuthority(functionTimeout);

    std::cout << "Press a to test program \n";
    std::cout << "Press q to quit \n";
    char inputChar;
    std::cin >> inputChar;

    int a = 1;

    while(a == 1){

        switch (inputChar){
        case 'a':
        {
//            sleep(1000);
            std::cout << "You pressed a \n";
//            sleep(5);
            monitoredTakeoff(vehicle);


            moveByPositionOffset(vehicle, 5, 0, 5, 0);
//            moveByPositionOffset(vehicle, 0, 5, 0, 0);
//            moveByPositionOffset(vehicle, -5, 0, 0, 0);
//            moveByPositionOffset(vehicle, 0, -5, 0, 0);

            monitoredLanding(vehicle);
            
            a = 0;
        }
            break;
        case 'q':
            std::cout << "Goodbye~ \n";
            a = 0;
            break;
        }
    }
}
