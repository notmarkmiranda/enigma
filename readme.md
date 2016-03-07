# ENIGMA

* [Original Assignment](https://github.com/turingschool/curriculum/blob/master/source/projects/enigma.markdown)
* [Evaluation](https://github.com/turingschool/ruby-submissions/blob/master/1602/enigma/mark_miranda.md)

## Description
Enigma is an encryption engine that generates a random key and date-based offset to encrypt, decrypt or crack any string ending in "..end.."
Learning Goals / Areas of Focus

## Learning Goals
* Practice breaking a program into logical components
* Testing components in isolation and in combination
* Applying Enumerable techniques in a real context
* Reading text from and writing text to files

## Usage
Enigma can be run from the command line using the following commands:

Encrypt:
```
$ ruby ./lib/encrypt.rb message.txt encrypted.txt
Created 'encrypted.txt' with the key 82648 and date 030415
```

Decrypt:
```
$ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 030415
Created 'decrypted.txt' with the key 82648 and date 030415
```

Crack:
```
$ ruby ./lib/crack.rb encrypted.txt cracked.txt 030415
Created 'cracked.txt' with the cracked key 82648 and date 030415
```
