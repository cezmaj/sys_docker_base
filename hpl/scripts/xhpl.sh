#!/bin/bash

module load intel-oneapi compiler mpi hpl/icc

set -x
exec xhpl $@
