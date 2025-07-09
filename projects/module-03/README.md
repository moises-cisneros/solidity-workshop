# 🛠 Proyecto – Módulo 3: SimpleDEX (Exchange Descentralizado)

## 📦 Descripción

Este proyecto es parte del Módulo 3 del Taller de Solidity organizado por Ethereum Bolivia.  
El contrato `SimpleDEX` implementa un **exchange descentralizado simple con un pool de liquidez** basado en dos tokens ERC-20 (`TokenA` y `TokenB`), usando la fórmula del producto constante ($x \cdot y = k$) para calcular los precios de intercambio.

## ⚙️ Funcionalidades

- ✅ `addLiquidity(uint256 amountA, uint256 amountB)`: permite al owner agregar liquidez en pares de TokenA y TokenB.
- ✅ `swapAforB(uint256 amountAIn)`: permite a un usuario intercambiar TokenA por TokenB usando el pool.
- ✅ `swapBforA(uint256 amountBIn)`: permite intercambiar TokenB por TokenA.
- ✅ `removeLiquidity(uint256 amountA, uint256 amountB)`: permite al owner retirar liquidez del pool.
- ✅ `getPrice(address _token)`: calcula el precio actual de un token en base al otro.
- ✅ Validaciones con `require` y uso de `modifier onlyOwner` para proteger funciones sensibles.
- ✅ Emisión de eventos:
  - `LiquidityAdded`
  - `TokensSwapped`
  - `LiquidityRemoved`

## 🧪 Pruebas realizadas

1. ✅ **Despliegue de TokenA y TokenB** con un millón de unidades cada uno.
2. ✅ **Aprobación de uso de tokens** desde owner hacia el contrato DEX.
3. ✅ **Agregado de liquidez inicial** por parte del owner (5000 A y 5000 B).
4. ✅ **Intercambio exitoso** desde una cuenta secundaria (1000 A → tokens B).
5. ✅ **Cálculo de precio** correcto en `getPrice(...)`.
6. ✅ **Retiro de liquidez** parcial sin errores.

## 📤 Despliegue

- Red: **Sepolia**
- Contratos verificados:
  - `TokenA`: [`0xfb9fa57c936FaD1e4dD83123f91e16e946695113`](https://sepolia.etherscan.io/address/0xfb9fa57c936FaD1e4dD83123f91e16e946695113)
  - `TokenB`: [`0x54A0a8b6268cB238A7041B8E33DA01F5De6e4307`](https://sepolia.etherscan.io/address/0x54A0a8b6268cB238A7041B8E33DA01F5De6e4307)
  - `SimpleDEX`: [`0x6434Fc2404aEb07568B60e301fa7b7bBE3Bc95d9`](https://sepolia.etherscan.io/address/0x6434Fc2404aEb07568B60e301fa7b7bBE3Bc95d9)
- Herramientas utilizadas: **Remix IDE + MetaMask + Etherscan**
- Páginas usadas:
  - [`Ethereum Unit Converter`](https://eth-converter.com/)
  - [`Online ABI Encoder`](https://abi.hashex.org/)

## 🧠 Consideraciones técnicas

- Uso de `IERC20` para operar con tokens de manera segura.
- Validación de permisos con `transferFrom` y `approve`.
- Lógica de precios mediante fórmula de producto constante con comisión del 0.3% (`997 / 1000`).
- Eventos emitidos para rastrear operaciones del pool.
- Uso de funciones `internal` para cálculos (`getAmountOut`).

## 📁 Estructura del archivo

```bash
projects/
└── module-03/
    ├── TokenA.sol
    ├── TokenB.sol
    └── SimpleDEX.sol
````

## 👨‍💻 Autor

- Nombre: **Moises Cisneros**
- Taller: **Ethereum Bolivia – Módulo 3**
- Año: **2025**

## 📜 Licencia

Este proyecto está bajo la Licencia MIT. Ver archivo [`LICENSE`](../../LICENSE) para más detalles.
