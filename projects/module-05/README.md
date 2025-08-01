# 🛠 Proyecto – Módulo 05: Simple DeFi Yield Farming

## 📦 Descripción

Este proyecto es parte del Módulo 05 del Taller de Solidity organizado por Ethereum Bolivia. El contrato simula un sistema completo de Yield Farming DeFi con staking de LP tokens, distribución de recompensas proporcionales y funcionalidades avanzadas.

## ⚙️ Funcionalidades

- ✅ Depósito y retiro de LP tokens
- ✅ Distribución proporcional de recompensas por tiempo
- ✅ Sistema de comisiones de retiro (1%)
- ✅ Tasas de recompensas variables ajustables por el owner
- ✅ Eventos emitidos para seguimiento completo
- ✅ Modificadores de seguridad implementados

## 🧪 Pruebas realizadas

1. Suite de 47 tests comprehensivos con 100% de cobertura
2. Validación de depósitos, retiros y cálculo de recompensas
3. Tests de seguridad y casos edge
4. Demo interactiva completa del flujo de farming

## 📤 Despliegue

- Red: Sepolia
- Contratos: DAppToken, LPToken, TokenFarm
- Verificación automática en Etherscan: ✅
- Herramienta usada: Hardhat + Verificación automática

- Dirección del contrato DappToken: [`0x383c16cB4Adf2b51a2dfDF933007Cb64a9B4391A`](https://sepolia.etherscan.io/address/0x383c16cB4Adf2b51a2dfDF933007Cb64a9B4391A)
- Dirección del contrato LPToken: [`0x86c50D1D0dcc26eD5e95C17A7f6323b0b2cF6B3F`](https://sepolia.etherscan.io/address/0x86c50D1D0dcc26eD5e95C17A7f6323b0b2cF6B3F)
- Dirección del contrato TokenFarm: [`0xc63B19C13B253470066DfE8aeFE85ba3E847657e`](https://sepolia.etherscan.io/address/0xc63B19C13B253470066DfE8aeFE85ba3E847657e)

## 🧠 Consideraciones técnicas

- Uso de `modifier` hasStaked y onlyOwner para seguridad
- Implementación de estructura `UserInfo` para datos organizados
- Cálculo automático de recompensas: `(staking_usuario / total_staking) * recompensas_por_bloque * bloques_pasados`
- Sistema de comisiones que se acumulan para el owner
- Contratos basados en OpenZeppelin para máxima seguridad

## 🔗 Proyecto Completo

Para ver el código completo, documentación detallada, configuración y guías de seguridad:

**[👉 Ver Proyecto Completo en GitHub](https://gist.github.com/luisvid/5a87ce5690451e965bb3c86f37a3cfbd)**

## 📁 Estructura del archivo

```bash
projects/
└── module-05/
    └── README.md
```

## 👨‍💻 Autor

- Nombre: Moises Cisneros
- Taller: Ethereum Bolivia – Módulo 05
- Año: 2025

## 📜 Licencia

Este proyecto está bajo la Licencia MIT. Ver archivo [`LICENSE`](../../LICENSE) para más detalles.
