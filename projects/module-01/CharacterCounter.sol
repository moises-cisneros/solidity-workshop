// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.26;

contract CharacterCounter {
    string public storedWord;
    uint public wordLength;

    event WordSet(string _word, uint _length);

    function setWord(string memory _newWord) public {
        storedWord = _newWord;
        wordLength = bytes(_newWord).length;
        emit WordSet(_newWord, wordLength);
    }

    function getWord() public view returns (string memory) {
        return storedWord;
    }

    function getWordLength() public view returns (uint) {
        return wordLength;
    }
}