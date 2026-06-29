#to run just type make run in the terminal

#here you write the name of the top module (not the file) you need to run
TOP ?= Lab_four 
#here you write the name of the folder that has the top file you 
#need to run if the file is in the same path as the make file just write .
SRC_DIR ?= . 

export PATH := /c/msys64/ucrt64/bin:$(PATH)

# search only inside SRC_DIR
SV_FILES := $(shell find $(SRC_DIR) -name "*.sv")

run:
	rm -rf obj_dir
	verilator --binary -CFLAGS "-std=gnu++17" \
		-Wno-fatal \
		-Wno-WIDTHTRUNC \
		--top-module $(TOP) \
		$(SV_FILES)
	./obj_dir/V$(TOP)

clean:
	rm -rf obj_dir