# Valtra (Validation - Train)

Valtra is a mini-project I created because I got sick of keeping track of train and validation/test datasets separately.  
It dynamically switches between training and validation/test data using a simple wrapper around PyTorch’s `DataLoader`.

## 📌 Why "Valtra"?
The name comes from **Val**idation and **Tra**in. Plus, it has a nice ring to it. 😉

## 🚀 Installation
```bash
pip install valtra
```

## 🔧 Usage
```python
import torch
from valtra.dataloader import DynamicDataLoader

# Create dummy data
data = torch.randn(1000, 10)
labels = torch.randint(0, 5, (1000,))

# Create DynamicDataLoader
dataloader = DynamicDataLoader.from_tensors(data, labels, split_ratio=0.8, batch_size=32)

# Training loop (default behavior is training mode)
for batch in dataloader():
    print("Train batch:", batch[0].shape)

# Evaluation loop
for batch in dataloader(test=True):
    print("Test batch:", batch[0].shape)
```

## 📜 License
MIT License
