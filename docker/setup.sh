#! /bin/sh
apt-get -qq update
apt-get -qq -y install curl

#apt-get -y install linux-tools-generic
apt-get -y install perf
apt-get -y install linux-tools-generic
#apt update

#apt-get -y install linux-tools-4.13.0-36-generic
#apt-get -y install git

#git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
#cd linux/tools/perf
#make
#cp perf /usr/bin/perf

apt-get -y install python
apt update

export PATH=$PATH:/pmu-tools
cd pmu-tools
#pwd
echo $PATH
which pmu-tools
cat /proc/sys/kernel/perf_event_paranoid
cat /proc/sys/kernel/nmi_watchdog
which toplev.py
toplev.py
which perf
