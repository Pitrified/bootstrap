import tensorflow as tf

print(f"Cuda is available: {tf.compat.v1.test.is_gpu_available()}")

