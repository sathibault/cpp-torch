#pragma once
#include "../../include/nn/Dropout.h"


template<typename T, GPUFlag F>
cpptorch::Tensor<T, F> cpptorch::nn::Dropout<T, F>::forward(const cpptorch::Tensor<T, F> &input) const
{
    cpptorch::Tensor<T, F> output;
    output = input;
    return output;
}
