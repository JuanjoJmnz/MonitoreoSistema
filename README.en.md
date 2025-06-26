<!-- LOGO -->
<div align="center">
  <a href="https://github.com/JuanjoJmnz/monitor-sistema-bash">
    <img src="https://github.com/user-attachments/assets/ed703c3e-07a0-4ffe-8bf4-7020b56b00ab" alt="Project Logo" width="250" height="250">
  </a>

<h3 align="center">System Monitoring and Diagnostics (Bash)</h3>

  <p align="center">
    Bash scripts to monitor and diagnose the status of a Linux system. Outputs the results to a plain text file, an HTML file, or a PDF file. Can also be used in English or Spanish.
    <br />
    <a href="https://github.com/JuanjoJmnz/MonitoreoSistema/issues">Report Bug</a>
    ·
    <a href="https://github.com/JuanjoJmnz/MonitoreoSistema/issues">Suggest Feature</a>
  </p>
</div>

---

## 🧾 About the Project

This project contains two scripts written in **Bash** that allow for a **complete system diagnosis** and also **real-time monitoring** of CPU and memory usage. It is designed for support technicians or system administrators who want simple and effective tools without graphical interfaces.

- `detalles.sh`: Generates a full system report.
- `monitoreo.sh`: Monitors system performance in real time.

---

### 🛠️ Technologies Used

* ![Bash](https://img.shields.io/badge/Bash-121011?style=for-the-badge&logo=gnubash&logoColor=white)
* ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
* Native tools such as `top`, `free`, `ps`, `df`, `uptime`, `ip`, etc.

---

## 🚀 Getting Started

### Prerequisites

```sh
Linux operating system (Debian, Ubuntu, Arch...)
Bash 4+
Execution permissions in terminal
```

#### Install GhostScript
```sh
sudo apt install enscript ghostscript
```

### Installation

Clone the repository:

```sh
git clone https://github.com/JuanjoJmnz/MonitoreoSistema.git
cd MonitoreoSistema
chmod +x detalles.sh monitoreo.sh
```

Run the scripts:

```sh
./detalles.sh es pdf    # Report in Spanish + export to PDF
./detalles.sh es html   # Report in Spanish + export to HTML
./detalles.sh en pdf    # Report in English + export to PDF
./detalles.sh en html   # Report in English + export to HTML

./monitoreo.sh es       # Start real-time monitor in Spanish
./monitoreo.sh en       # Start real-time monitor in English
./monitoreo.sh          # Start real-time monitor in English (default)
```

---

## ⚙️ Usage

- `detalles.sh` will automatically save a file named `reporte_sistema_YYYY-MM-DD_HH-MM-SS.txt` with all system data.
- `monitoreo.sh` displays every 5 seconds the CPU/RAM usage and the system status along with a list of the most resource-consuming processes.

Ideal for quick audits, tech support, or performance reviews.

---

## 🗺️ Roadmap

- [ ] Add option to export report to PDF or HTML
- [ ] Add automatic email sending feature
- [x] <s>Create English version</s>
- [ ] Add sound alerts support in monitor mode
- [ ] Package as an installable CLI tool

---

## 🤝 Contributing

All contributions are welcome! To contribute:

1. Fork the project
2. Create a branch (`git checkout -b feature/NewFeature`)
3. Make your changes and commit (`git commit -m 'Add new feature'`)
4. Push (`git push origin feature/NewFeature`)
5. Open a Pull Request

---

## 🙋 Author

Project developed by [Juan José Jiménez Gil](https://github.com/JuanjoJmnz), 2025

---

## 📄 License

This project is licensed under the terms of the MIT license.

---

## ⭐ Show Some Love

If you liked this project, give it a star ⭐ or follow me on GitHub!
