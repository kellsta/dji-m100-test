#include <QCoreApplication>
#include "dji_command.hpp"
#include "dji_vehicle.hpp"
#include "dji_status.hpp"

#include "dji_linux_helpers.hpp"

#include "flight_control_sample.hpp"

using namespace DJI::OSDK;
using namespace DJI::OSDK::Telemetry;

int main(int argc, char *argv[])
{
    int functionTimeout = 1;

    LinuxSetup linuxEnvironment (argc, argv);
    Vehicle* vehicle = linuxEnvironment.getVehicle();

    if (vehicle == NULL){
        std::cout << "no mo vehicle \n";
        return -1;
    }

    vehicle->obtainCtrlAuthority(functionTimeout);

    std::cout << "Press a to do stuff \n";
       char inputChar;
    std::cin >> inputChar;

    int a = 1;

    while(a == 1){

    switch (inputChar){
    case 'a':
        std::cout << "You pressed a \n";
        monitoredTakeoff(vehicle);
        monitoredLanding(vehicle);
        a = 0;
        break;
    }
    }

}
