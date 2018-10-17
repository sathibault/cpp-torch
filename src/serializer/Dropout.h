#pragma once
#include "../../include/nn/Dropout.h"


namespace cpptorch
{
    namespace serializer
    {
        template<typename T, GPUFlag F>
        class Dropout : public nn::Dropout<T, F>
        {
        public:
            void unserialize(const object_torch *obj, object_reader<T, F> *mb)
            {
                const object_table *obj_tbl = obj->data_->to_table();
                this->p_ = *obj_tbl->get("p");
            }
        };
    }
}
