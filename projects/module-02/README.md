# 🛠 Proyecto – Módulo 2: Subasta

## 📦 Descripción

Este contrato simula una **subasta Web3**, donde los usuarios pueden ofertar por un artículo con reglas de incremento, retiro de fondos y eventos para seguimiento en red. Es el proyecto final evaluativo del **Módulo 2 del Taller de Solidity**.

## ⚙️ Funcionalidades implementadas

- 📦 **Constructor:** Inicializa nombre del artículo, duración y tiempo de inicio
- 💰 **ofertar():**
  - Acepta ofertas mayores en al menos 5% a la actual
  - Registra el historial del usuario
  - Extiende la subasta +10 minutos si se oferta al final
- 🏁 **finalizarSubasta():** Cierra la subasta y emite evento
- 🥇 **obtenerGanador():** Devuelve al mejor oferente y su monto
- 📜 **obtenerOfertas():** Devuelve el historial completo de ofertas
- 🔁 **retirarFondos():**
  - Devuelve depósitos a perdedores
  - Permite al ganador recuperar el exceso (reembolso parcial)
- 📊 **obtenerBalanceContrato():** Consulta el balance en el contrato

## 🧪 Pruebas realizadas (en Remix)

### 🧑 Cuenta A

- Oferta inicial 0.02 ETH
- Segunda oferta 0.04 ETH → se registra reembolso parcial

### 🧑 Cuenta B

- Oferta válida de 0.03 ETH → pierde y puede retirar

### ✅ Resultado

- `obtenerGanador()` devuelve cuenta A con 0.04 ETH
- Cuenta A solo puede retirar 0.02 ETH de su primera oferta
- Cuenta B puede retirar 0.03 ETH completamente
- Eventos se registran correctamente

## 📤 Despliegue

- Red: Sepolia
- Dirección del contrato: [0x6eb9b546bBC74Afb1BD7c81fAe29daEdB31bB2a2](https://sepolia.etherscan.io/address/0x6eb9b546bBC74Afb1BD7c81fAe29daEdB31bB2a2)
- Verificado: ✅
- Herramientas: Remix IDE + MetaMask

## 🧠 Consideraciones técnicas

- Uso de `modifier` para evitar repeticiones y validar:
  - Tiempo activo de subasta
  - Si la subasta ya fue finalizada
- Lógica segura en `call` para retiro de fondos
- Eventos utilizados:
  - `NuevaOferta`
  - `SubastaFinalizada`
- Control de `saldoRetirable` y `historialOfertas` para reembolsos

## 📁 Estructura del archivo

```bash
projects/
└── module-02/
    └── Subasta.sol
````

## 👨‍💻 Autor

- Moises Cisneros
- Proyecto evaluativo del Taller de Solidity – ETH Kipu
- Año: 2025

## 📜 Licencia

Este proyecto está bajo la Licencia MIT. Consulta [`LICENSE`](../../LICENSE) para más detalles.
