#!/bin/bash

# Monitorización en tiempo real del sistema

LANGUAGE=$1

if [[ "$LANGUAGE" == "es" ]]; then
while true; do
  clear
  echo "🔧 Monitor del sistema - $(date '+%a %d %b %Y %T')"
  echo "-----------------------------------------------"

  # CPU
  cpu_total=$(top -bn1 | grep "%Cpu" | awk '{print 100 - $8}')
  cpu_total_formatted=$(printf "%.1f" "$cpu_total")

  # RAM
  mem_data=$(free -m | awk '/Mem:/ {print $3, $2}')
  mem_used=$(echo "$mem_data" | awk '{print $1}')
  mem_total=$(echo "$mem_data" | awk '{print $2}')
  mem_percent=$(awk "BEGIN {printf \"%.1f\", ($mem_used/$mem_total)*100}")

  echo "🖥️  USO DE CPU: ${cpu_total_formatted}%"
  echo "📊 USO DE RAM: ${mem_used}MB / ${mem_total}MB (${mem_percent}%)"

  # Estado del sistema
  estado="MODERADO"
  if (( $(echo "$cpu_total > 80.0" | bc -l) )) || (( $(echo "$mem_percent > 85.0" | bc -l) )); then
    estado="CRÍTICO"
  elif (( $(echo "$cpu_total > 50.0" | bc -l) )) || (( $(echo "$mem_percent > 60.0" | bc -l) )); then
    estado="ALTO"
  fi

  echo -e "\n📈 Estado general del sistema: $estado"

  # Procesos que más CPU consumen
  echo -e "\n📌 Procesos por uso de CPU:"
  # echo " PID     COMMAND        %CPU   %MEM"
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

  sleep 5
done

else
while true; do
  clear
  echo "🔧 System Monitor - $(date '+%a %d %b %Y %T')"
  echo "-----------------------------------------------"

  # CPU
  cpu_total=$(top -bn1 | grep "%Cpu" | awk '{print 100 - $8}')
  cpu_total_formatted=$(printf "%.1f" "$cpu_total")

  # RAM
  mem_data=$(free -m | awk '/Mem:/ {print $3, $2}')
  mem_used=$(echo "$mem_data" | awk '{print $1}')
  mem_total=$(echo "$mem_data" | awk '{print $2}')
  mem_percent=$(awk "BEGIN {printf \"%.1f\", ($mem_used/$mem_total)*100}")

  echo "🖥️  CPU USAGE: ${cpu_total_formatted}%"
  echo "📊 RAM USAGE: ${mem_used}MB / ${mem_total}MB (${mem_percent}%)"

  # System status
  status="MODERATE"
  if (( $(echo "$cpu_total > 80.0" | bc -l) )) || (( $(echo "$mem_percent > 85.0" | bc -l) )); then
    status="CRITICAL"
  elif (( $(echo "$cpu_total > 50.0" | bc -l) )) || (( $(echo "$mem_percent > 60.0" | bc -l) )); then
    status="HIGH"
  fi

  echo -e "\n📈 Overall system status: $status"

  # Top CPU-consuming processes
  echo -e "\n📌 Top CPU-consuming processes:"
  # echo " PID     COMMAND        %CPU   %MEM"
  ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

  sleep 5
done
fi