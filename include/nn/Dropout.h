#pragma once
#include "Sequential.h"


namespace cpptorch
{
    namespace nn
    {
        template<typename T, GPUFlag F>
        class Dropout : public Layer<T, F>
        {
        public:
            virtual const std::string name() const override { return "nn.Dropout"; }
            virtual Tensor<T, F> forward(const Tensor<T, F> &input) const override;

        protected:
            float p_;
        };
    }
}
