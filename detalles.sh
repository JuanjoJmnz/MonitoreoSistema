#!/bin/bash

# Información general del sistema, los usuarios, las IPs/MACs y uso del home.

LANGUAGE=$1
LANGUAGE=$(echo "$LANGUAGE" | tr '[:upper:]' '[:lower:]')
FORMAT=$2
FORMAT=$(echo "$FORMAT" | tr '[:upper:]' '[:lower:]')

if [[ "$LANGUAGE" == "es" ]]; then
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
outfile="reporte_sistema_$timestamp.txt"

{
echo "📋 INFORMACIÓN DEL SISTEMA - $(date '+%Y-%m-%d %H:%M:%S')"
echo "---------------------------------------------------------"

# Información del sistema
echo -e "\n🖥️  HOSTNAME: $(hostname)"
echo "🧠 CPU: $(lscpu | grep 'Nombre del modelo' | sed 's/Nombre del modelo:[ \t]*//')"
echo "💾 RAM total: $(free -h | awk '/Mem:/ {print $2}')"
echo "💽 Disco total: $(df -h --total | grep total | awk '{print $2}')"
echo "🖥️ SO: $(lsb_release -d | cut -f2)"
echo "🧮 Kernel: $(uname -r)"

# IP y Red
echo -e "\n🌐 RED (IP + MAC)"
for iface in $(ip -o -4 addr show | awk '{print $2}'); do
  ip_addr=$(ip -o -4 addr show $iface | awk '{print $4}')
  mac_addr=$(ip link show $iface | awk '/link\/ether/ {print $2}')
  echo "$iface → IP: $ip_addr | MAC: $mac_addr"
done

# Uptime
echo -e "\n⏳ Tiempo que lleva el sistema encendido:"
uptime -p

# Usuarios conectados
echo -e "\n👥 Usuarios conectados:"
who

# Dispositivos en red (ARP)
echo -e "\n📡 Dispositivos en la red detectados (ARP):"
ip neigh | grep -i "lladdr" | awk '{printf "IP: %-16s MAC: %s\n", $1, $5}'

# Procesos activos
echo -e "\n🔍 Procesos activos: $(ps aux --no-heading | wc -l)"

# Espacio en disco
echo -e "\n📂 Espacio en disco (excluyendo tmpfs):"
df -h | grep -v tmpfs

# Directorio actual
echo -e "\n📌 Directorio actual (pwd):"
pwd

# Lista de archivos ordenados por tamaño
echo -e "\n🗃️ Archivos en el directorio actual ordenados por tamaño:"
ls -lSh

# Uso del espacio en $HOME
echo -e "\n🏠 Uso total del directorio $HOME:"
du -sh ~

echo -e "\n✅ Fin del reporte"
} | tee "$outfile"

echo -e "\n📄 Reporte guardado en: $(pwd)/$outfile"

# Generar HTML o PDF si se indica
if [[ "$FORMAT" == "html" ]]; then
    htmlfile="${outfile%.txt}.html"
    echo "<pre>" > "$htmlfile"
    cat "$outfile" >> "$htmlfile"
    echo "</pre>" >> "$htmlfile"
    echo "🌐 Reporte también exportado a: $(pwd)/$htmlfile"
elif [[ "$FORMAT" == "pdf" ]]; then
    psfile="${outfile%.txt}.ps"
    pdffile="${outfile%.txt}.pdf"
    enscript "$outfile" -o "$psfile" && ps2pdf "$psfile" "$pdffile" && rm "$psfile"
    echo "📄 Reporte también exportado a: $(pwd)/$pdffile"
fi


else
# General system info: users, IPs/MACs, and home directory usage.

timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
outfile="system_report_$timestamp.txt"

{
echo "📋 SYSTEM INFORMATION - $(date '+%Y-%m-%d %H:%M:%S')"
echo "---------------------------------------------------------"

# System information
echo -e "\n🖥️  HOSTNAME: $(hostname)"
echo "🧠 CPU: $(lscpu | grep 'Model name' | sed 's/Model name:[ \t]*//')"
echo "💾 Total RAM: $(free -h | awk '/Mem:/ {print $2}')"
echo "💽 Total Disk: $(df -h --total | grep total | awk '{print $2}')"
echo "🖥️ OS: $(lsb_release -d | cut -f2)"
echo "🧮 Kernel: $(uname -r)"

# IP and Network
echo -e "\n🌐 NETWORK (IP + MAC)"
for iface in $(ip -o -4 addr show | awk '{print $2}'); do
  ip_addr=$(ip -o -4 addr show $iface | awk '{print $4}')
  mac_addr=$(ip link show $iface | awk '/link\/ether/ {print $2}')
  echo "$iface → IP: $ip_addr | MAC: $mac_addr"
done

# Uptime
echo -e "\n⏳ System uptime:"
uptime -p

# Logged-in users
echo -e "\n👥 Logged-in users:"
who

# Network devices (ARP)
echo -e "\n📡 Detected network devices (ARP):"
ip neigh | grep -i "lladdr" | awk '{printf "IP: %-16s MAC: %s\n", $1, $5}'

# Active processes
echo -e "\n🔍 Active processes: $(ps aux --no-heading | wc -l)"

# Disk space
echo -e "\n📂 Disk space usage (excluding tmpfs):"
df -h | grep -v tmpfs

# Current directory
echo -e "\n📌 Current directory (pwd):"
pwd

# Files sorted by size
echo -e "\n🗃️ Files in current directory sorted by size:"
ls -lSh

# Home directory usage
echo -e "\n🏠 Total usage of $HOME directory:"
du -sh ~

echo -e "\n✅ End of report"
} | tee "$outfile"

echo -e "\n📄 Report saved in: $(pwd)/$outfile"

# Export to HTML or PDF if specified
if [[ "$FORMAT" == "html" ]]; then
    htmlfile="${outfile%.txt}.html"
    echo "<pre>" > "$htmlfile"
    cat "$outfile" >> "$htmlfile"
    echo "</pre>" >> "$htmlfile"
    echo "🌐 Report also exported to: $(pwd)/$htmlfile"
elif [[ "$FORMAT" == "pdf" ]]; then
    psfile="${outfile%.txt}.ps"
    pdffile="${outfile%.txt}.pdf"
    enscript "$outfile" -o "$psfile" && ps2pdf "$psfile" "$pdffile" && rm "$psfile"
    echo "📄 Report also exported to: $(pwd)/$pdffile"
fi
fi