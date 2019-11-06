import torch

print(f"Cuda is available: {torch.cuda.is_available()}")
print(f"Cuda devices: {torch.cuda.device_count()}")
