#!/bin/bash

scons

iteracao=1
estagio=1

matlab_R2014b -r "try matDRV($iteracao,$estagio); catch; end; quit"
#matlab_R2014b -r "matDRV($iteracao,$estagio)";
