#ifndef APP
#define APP

#include <string.h>
#include <omnetpp.h>
#include <packet_m.h>

using namespace omnetpp;

class App: public cSimpleModule {
private:
    cMessage *sendMsgEvent;
    cStdDev delayStats;
    cOutVector delayVector;
    cStdDev hopStats;
    cOutVector hopVector;
    cStdDev packetStats;
    cOutVector packetVector;
public:
    App();
    virtual ~App();
protected:
    virtual void initialize();
    virtual void finish();
    virtual void handleMessage(cMessage *msg);
};

Define_Module(App);

#endif /* APP */

App::App() {
}

App::~App() {
}

void App::initialize() {

    // If interArrivalTime for this node is higher than 0
    // initialize packet generator by scheduling sendMsgEvent
    if (par("interArrivalTime").doubleValue() != 0) {
        sendMsgEvent = new cMessage("sendEvent");
        scheduleAt(par("interArrivalTime"), sendMsgEvent);
    }

    std::string id = std::to_string(this->getParentModule()->getIndex());
    // Initialize statistics
    delayStats.setName((std::string("TotalDelay [") + id + std::string("]")).c_str() );

    delayVector.setName((std::string("Delay [") + id + std::string("]")).c_str() );

    hopStats.setName((std::string("TotalHops [") + id + std::string("]")).c_str() );

    hopVector.setName((std::string("Hops [") + id + std::string("]")).c_str() );

    packetStats.setName((std::string("TotalPackets [") + id + std::string("]")).c_str() );

    packetVector.setName((std::string("Packets [") + id + std::string("]")).c_str() );
}

void App::finish() {
    // Record statistics
    recordScalar("Average delay", delayStats.getMean());
    recordScalar("Number of packets", hopStats.getCount());
    recordScalar("Average hops", hopStats.getMean());
    recordScalar("Hops", hopStats.getCount());
}

void App::handleMessage(cMessage *msg) {

    // if msg is a sendMsgEvent, create and send new packet
    if (msg == sendMsgEvent) {
        // create new packet
        Packet *pkt = new Packet("packet",this->getParentModule()->getIndex()); // packet has index of parent module
        pkt->setByteLength(par("packetByteSize"));           // size is set by parameter
        pkt->setSource(this->getParentModule()->getIndex()); // source is set to index of parent module
        pkt->setDestination(par("destination"));             // destination is set by parameter, usually node 5

        // send to net layer
        send(pkt, "toNet$o");

        // compute the new departure time and schedule next sendMsgEvent
        simtime_t departureTime = simTime() + par("interArrivalTime");
        scheduleAt(departureTime, sendMsgEvent);

    }
    // else, msg is a packet from net layer
    else {
        Packet *pkt = (Packet *) msg;
        // compute delay and record statistics
        simtime_t delay = simTime() - msg->getCreationTime();
        delayStats.collect(delay);
        delayVector.record(delay);
        hopStats.collect(pkt->getHopCount());
        hopVector.record(pkt->getHopCount());
        packetStats.collect(pkt->getSource());
        packetVector.record(pkt->getSource());
        // delete msg
        delete (msg);
    }

}
