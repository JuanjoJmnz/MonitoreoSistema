<!-- LOGO -->
<div align="center">
  <a href="https://github.com/JuanjoJmnz/monitor-sistema-bash">
    <img src="https://github.com/user-attachments/assets/ed703c3e-07a0-4ffe-8bf4-7020b56b00ab" alt="Logo del Proyecto" width="250" height="250">
  </a>

<h3 align="center">Monitor y Diagnóstico del Sistema (Bash)</h3>

📘 También disponible en: [English](README.en.md)

  <p align="center">
    Scripts en Bash para monitorear y diagnosticar el estado de un sistema Linux. Devuelve el resultado en un archivo de texto plano, un archivo HTML o un archivo PDF. También puede usarse en inglés o español.
    <br />
    <a href="https://github.com/JuanjoJmnz/MonitoreoSistema/issues">Reportar Error</a>
    ·
    <a href="https://github.com/JuanjoJmnz/MonitoreoSistema/issues">Sugerir Mejora</a>
  </p>
</div>

---

## 🧾 Sobre el Proyecto

Este proyecto contiene dos scripts escritos en **Bash** que permiten realizar un **diagnóstico completo** del sistema y también **monitorear en tiempo real** el uso de CPU y memoria. Está pensado para técnicos de soporte o administradores de sistemas que deseen herramientas simples y efectivas sin necesidad de interfaces gráficas.

- `detalles.sh`: Genera un informe completo del sistema.
- `monitoreo.sh`: Monitoriza en tiempo real el rendimiento del sistema.

---

### 🛠️ Tecnologías Usadas

* ![Bash](https://img.shields.io/badge/Bash-121011?style=for-the-badge&logo=gnubash&logoColor=white)
* ![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
* Herramientas nativas como `top`, `free`, `ps`, `df`, `uptime`, `ip`, etc.

---

## 🚀 Primeros Pasos

### Requisitos Previos

```sh
Sistema operativo Linux (Debian, Ubuntu, Arch...)
Bash 4+
Permisos de ejecución en terminal
```

### Instalación

Clona el repositorio:

```sh
git clone https://github.com/JuanjoJmnz/MonitoreoSistema.git
cd MonitoreoSistema
chmod +x detalles.sh monitoreo.sh
```

Ejecuta los scripts:

```sh
./detalles.sh es pdf	  # Reporte en español + exportar a PDF
./detalles.sh es html	  # Reporte en español + exportar a HTML
./detalles.sh en pdf	  # Reporte en inglés + exportar a PDF
./detalles.sh en html	  # Reporte en inglés + exportar a HTML

./monitoreo.sh es       # Para iniciar el monitor en tiempo real en español
./monitoreo.sh en       # Para iniciar el monitor en tiempo real en inglés
./monitoreo.sh          # Para iniciar el monitor en tiempo real en inglés (por defecto)
```

---

## ⚙️ Uso

- `detalles.sh` guardará automáticamente un archivo `reporte_sistema_YYYY-MM-DD_HH-MM-SS.txt` con todos los datos del sistema.
- `monitoreo.sh` muestra cada 5 segundos el uso de CPU/RAM y el estado del sistema con un listado de los procesos que más consumen.

Ideal para auditorías rápidas, soporte técnico o revisión de rendimiento.

---

## Roadmap 🗺️

- [ ] Añadir opción para exportar reporte a PDF o HTML
- [ ] Añadir opción de envío automático por email
- [x] <s>Crear versión en inglés</s>
- [ ] Soporte para alertas sonoras en modo monitor
- [ ] Empaquetado como herramienta CLI instalable

---

## 🤝 Contribuciones

¡Toda contribución es bienvenida! Para colaborar:

1. Haz un fork del proyecto
2. Crea una rama (`git checkout -b feature/NuevaFeature`)
3. Realiza tus cambios y haz commit (`git commit -m 'Agrega nueva feature'`)
4. Haz push (`git push origin feature/NuevaFeature`)
5. Abre un Pull Request

---

## 🙋 Autor

Proyecto desarrollado por [Juan José Jiménez Gil](https://github.com/JuanjoJmnz), 2025

---

## 📄 Licencia

Este proyecto está licenciado bajo los términos de la licencia MIT.

---

## Para más

¡Si te ha gustado mi proyecto, dame una estrella ⭐ o sígueme por GitHub!
