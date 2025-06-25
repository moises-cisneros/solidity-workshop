// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.26;

contract MyContract {
    // Declaramos una variable pública de tipo uint256 llamada myNumber
    uint256 public myNumber;
    
    // Declaramos una variable pública de tipo address llamada owner
    address public owner;
    
    // Definimos el constructor del contrato, que se ejecuta al desplegar el contrato
    constructor(uint256 _myNumber) {
        // Inicializamos la variable myNumber con el valor pasado como argumento al constructor
        myNumber = _myNumber;
        
        // Inicializamos la variable owner con la dirección del remitente de la transacción que despliega el contrato
        owner = msg.sender;
    }
}