// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Subasta {
    address public owner;
    string public articulo;
    uint public inicio;
    uint public fin;
    uint public comision = 2;
    bool public finalizada;

    address public mejorOferente;
    uint public mejorOferta;

    struct Oferta {
        address oferente;
        uint monto;
    }

    Oferta[] public ofertas;

    mapping(address => uint[]) public historialOfertas;
    mapping(address => uint) public saldoRetirable;

    event NuevaOferta(address indexed oferente, uint monto);
    event SubastaFinalizada(address ganador, uint monto);

    modifier soloDuranteSubasta() {
        require(block.timestamp >= inicio && block.timestamp <= fin, "Subasta inactiva");
        _;
    }

    modifier soloNoFinalizada() {
        require(!finalizada, "La subasta ya finalizo");
        _;
    }

    constructor(string memory _articulo, uint _duracionSegundos) {
        owner = msg.sender;
        articulo = _articulo;
        inicio = block.timestamp;
        fin = inicio + _duracionSegundos;
    }

    function ofertar() public payable soloDuranteSubasta soloNoFinalizada {
        require(msg.value > 0, "La oferta debe ser mayor a 0");
        uint minRequerido = mejorOferta + (mejorOferta * 5) / 100;
        require(msg.value >= minRequerido || mejorOferta == 0, "Debe superar en 5%");

        // Registrar historial para reembolsos parciales
        historialOfertas[msg.sender].push(msg.value);

        // Reembolso parcial: saldo retirable
        if (msg.sender == mejorOferente) {
            saldoRetirable[msg.sender] += mejorOferta;
        }

        mejorOferente = msg.sender;
        mejorOferta = msg.value;
        ofertas.push(Oferta(msg.sender, msg.value));

        // Extender si faltan 10 minutos
        if (fin - block.timestamp <= 600) {
            fin += 600;
        }

        emit NuevaOferta(msg.sender, msg.value);
    }

    function finalizarSubasta() public soloNoFinalizada {
        require(block.timestamp > fin, "Subasta aun activa");
        finalizada = true;

        emit SubastaFinalizada(mejorOferente, mejorOferta);
    }

    function obtenerOfertas() public view returns (Oferta[] memory) {
        return ofertas;
    }

    function retirarFondos() public {
        require(finalizada, "Subasta no finalizada");

        uint totalRetiro;

        if (msg.sender != mejorOferente) {
            for (uint i = 0; i < historialOfertas[msg.sender].length; i++) {
                totalRetiro += historialOfertas[msg.sender][i];
            }
        } else {
            totalRetiro = saldoRetirable[msg.sender];
        }

        require(totalRetiro > 0, "No hay fondos para retirar");

        saldoRetirable[msg.sender] = 0;
        (bool exito, ) = payable(msg.sender).call{value: totalRetiro}("");
        require(exito, "Fallo en el retiro");
    }

    function obtenerGanador() public view returns (address, uint) {
        return (mejorOferente, mejorOferta);
    }

    function obtenerBalanceContrato() public view returns (uint) {
        return address(this).balance;
    }
}
