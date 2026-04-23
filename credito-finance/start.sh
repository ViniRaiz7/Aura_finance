#!/bin/bash
# start.sh — Inicia o projeto completo

echo "⚡ CréditoAutônomo — Iniciando..."
echo ""

# Instalar dependências se necessário
if [ ! -d "backend/node_modules" ]; then
  echo "📦 Instalando dependências do backend..."
  cd backend && npm install && cd ..
fi

if [ ! -d "frontend/node_modules" ]; then
  echo "📦 Instalando dependências do frontend..."
  cd frontend && npm install && cd ..
fi

echo ""
echo "🚀 Iniciando Backend em http://localhost:3001"
cd backend && npm start &
BACK_PID=$!

sleep 2

echo "🌐 Iniciando Frontend em http://localhost:3000"
cd ../frontend && npm start &
FRONT_PID=$!

echo ""
echo "✅ Projeto rodando!"
echo "   Backend:  http://localhost:3001/api/health"
echo "   Frontend: http://localhost:3000"
echo ""
echo "Pressione Ctrl+C para encerrar."

wait
