// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BitMascotas {

    // Estado de ánimo de una mascota
    enum EstadoAnimo { Feliz, Triste, Enojado, Hambriento, Dormido }

    // Estructura de la mascota
    struct Mascota {
        string nombre;
        EstadoAnimo animo;
        uint editCount;
    }

    // Mapping de dueño a array de mascotas
    mapping(address => Mascota[]) private mascotasPorUsuario;

    // Eventos
    event MascotaRegistrada(address indexed dueno, string nombre, EstadoAnimo animo);
    event MascotaModificada(address indexed dueno, uint index, string nuevoNombre, EstadoAnimo nuevoAnimo);

    // Registrar una nueva mascota
    function registrarMascota(string memory _nombre, EstadoAnimo _animo) public {
        Mascota memory nueva = Mascota({
            nombre: _nombre,
            animo: _animo,
            editCount: 0
        });
        mascotasPorUsuario[msg.sender].push(nueva);
        emit MascotaRegistrada(msg.sender, _nombre, _animo);
    }

    // Modificar nombre y estado de ánimo de una mascota
    function modificarMascota(uint _index, string memory _nuevoNombre, EstadoAnimo _nuevoAnimo) public {
        require(_index < mascotasPorUsuario[msg.sender].length, "Mascota no existe.");
        Mascota storage m = mascotasPorUsuario[msg.sender][_index];
        m.nombre = _nuevoNombre;
        m.animo = _nuevoAnimo;
        m.editCount++;
        emit MascotaModificada(msg.sender, _index, _nuevoNombre, _nuevoAnimo);
    }

    // Obtener una mascota individual
    function obtenerMascota(uint _index) public view returns (string memory nombre, EstadoAnimo animo, uint editCount) {
        require(_index < mascotasPorUsuario[msg.sender].length, "Mascota no existe.");
        Mascota memory m = mascotasPorUsuario[msg.sender][_index];
        return (m.nombre, m.animo, m.editCount);
    }

    // Obtener todas las mascotas del usuario
    function obtenerMisMascotas() public view returns (Mascota[] memory) {
        return mascotasPorUsuario[msg.sender];
    }

    // Obtener el total de mascotas del usuario
    function contarMisMascotas() public view returns (uint) {
        return mascotasPorUsuario[msg.sender].length;
    }
}
