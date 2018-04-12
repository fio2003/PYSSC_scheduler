CXXFLAGS = -std=c++1y -O2 -march=native -pedantic -Wall -Wextra -Wconversion -v -c -fmessage-length=0 -pthread
CXX = g++
all: file_scheduler

debug: CXXFLAGS = -std=c++1y -O0 -g3 -march=native -pedantic -Wall -Wextra -Wconversion -v -c -fmessage-length=0 -pthread -DDEBUG
debug: file_scheduler

fast: CXXFLAGS = -std=c++1y -Ofast -march=native -pedantic -Wall -Wextra -Wconversion -v -c -pthread
fast: file_scheduler

file_scheduler: file_scheduler.o build.log
	LC_ALL=en_US.utf8 $(CXX) -pthread -march=native  file_scheduler.o -o "file_scheduler"  >> build.log 2>&1

file_scheduler.o: file_scheduler.cpp build.log
	LC_ALL=en_US.utf8 $(CXX) $(CXXFLAGS) file_scheduler.cpp >> build.log 2>&1

build.log: 
	rm build.log & touch build.log

clean: 
	rm file_scheduler file_scheduler.o build.log
