# 🎶 TRM Disco Project

Welcome to **TRM Disco**, a collection of academic implementations of the TRM architecture, each designed with a unique focus and set of optimizations. This project is actively developed and aims to provide versatile, validated, and FPGA-ready TRM cores for research and experimentation.

> ℹ️ **Reference:**  
> This repository includes the original [TRM project](https://github.com/original-org/trm) as a submodule for compatibility and reference.

## 🧩 Implementations

- **disco-behavioral**  
  🟢 The reference behavioral implementation. Foundation for all other variants; currently the only completed and available version.

- **disco-quark**  
  🪐 Designed to be the smallest implementation in terms of silicon area, ideal for resource-constrained environments.

- **disco-light**  
  ⚡ Focused on achieving the fastest possible TRM execution, targeting high-performance applications.

- **disco-quantum**  
  🧬 Optimized for parallel execution, enabling efficient multi-threaded or multi-core processing.

- **disco-zero**  
  🌱 Prioritizes energy efficiency, making it suitable for low-power applications.

- **disco-pasta**  
  🛡️ Focuses on fault tolerance and security, providing robust protection against errors and attacks.

## ✨ Features

- 🎓 **Academic Focus:** All implementations are intended for research and educational use.
- 🛠️ **FPGA Support:** Each core is designed to be synthesizable and deployable on FPGA platforms.
- 🏭 **Industrial Validation:** All versions are validated using industry-standard tools and workflows.

## 📊 Status

- ✅ **disco-behavioral:** Implemented and available.
- ⏳ **Other variants:** Planned and under active development.

## 🚀 Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/your-org/trm-disco.git
   git submodule update --init --recursive
   ```
2. Explore the `disco-behavioral` implementation to get started.
3. FPGA synthesis instructions and validation flows are provided in the respective implementation folders.

## 🤝 Contributing

Contributions, suggestions, and feedback are welcome! Please open an issue or submit a pull request.

## 📄 License

This project is released under an academic-friendly license. See [LICENSE](LICENSE) for details.

---

**TRM Disco** is an active project. Stay tuned for updates and new implementations!