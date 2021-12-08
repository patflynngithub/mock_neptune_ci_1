NEPTUNE_SRC   := src
NEPTUNE_BUILD := build
NEPTUNE_BIN   := $(NEPTUNE_BUILD)/bin

ifdef CI_SERVER
  CC  := gcc
  CXX := g++
  FC  := gfortran
else
  CC  := icc
  CXX := icpc
  FC  := ifort
endif

default:
	mkdir -p $(NEPTUNE_BIN)
	$(FC) -o $(NEPTUNE_BIN)/main_1 $(NEPTUNE_SRC)/main_1.F90

clean:
	rm -rf $(NEPTUNE_BUILD)

