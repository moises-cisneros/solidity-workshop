// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Registro con Acceso Controlado y Eventos (Versión completada)
/// @author [Tu Nombre]
/// @notice Este contrato permite almacenar y actualizar una cadena de texto, con control de acceso y eventos.
contract RegistroConAcceso {

    // Estado de almacenamiento
    string private storedData;
    uint public numeroDeCambios = 0;
    address public owner;

    // Evento que se emitirá cuando la información sea actualizada
    event DataActualizada(string datoAnterior, string datoNuevo);

    /**
    * @dev Constructor que asigna el rol de administrador al creador del contrato
    * y establece un valor inicial para `storedData`.
    */
    constructor() {
        owner = msg.sender;
        storedData = "Dato inicial";
    }

    /**
    * @dev Modificador que permite solo al administrador ejecutar ciertas funciones.
    */
    modifier onlyOwner() {
        require(msg.sender == owner, "Solo el admin puede realizar esta accion");
        _;
    }

    /**
    * @notice Permite al administrador actualizar el dato almacenado.
    * @dev Emitir el evento `DataActualizada` cuando se modifique el valor de `storedData`.
    * @dev Incrementar el contador de cambios después de actualizar la información.
    * @param nuevoDato El nuevo dato que será almacenado.
    */
    function actualizarData(string memory nuevoDato) external onlyOwner {
        string memory datoAnterior = storedData;
        storedData = nuevoDato;
        numeroDeCambios++;
        emit DataActualizada(datoAnterior, nuevoDato);
    }

    /**
    * @notice Devuelve el dato almacenado actualmente.
    * @return El dato almacenado en la variable de estado `storedData`.
    */
    function obtenerData() external view returns (string memory) {
        return storedData;
    }

    /**
    * @notice Permite al administrador transferir su rol a otro usuario.
    * @param nuevoAdmin La dirección del nuevo administrador.
    * @dev Solo el administrador actual puede llamar a esta función.
    */
    function transferirAdmin(address nuevoAdmin) external onlyOwner {
        require(nuevoAdmin != address(0), "Direccion no valida");
        owner = nuevoAdmin;
    }
}
