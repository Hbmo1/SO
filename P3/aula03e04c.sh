#!/bin/bash
number=$1
string=$2
prefix="sec"
case $number in
	[0-9]? )
		Message="Numero válido"
	;;
	* )
		Message="Numero invalido"
	;;
esac
echo $Message

case $string in
	"sec"* )
		Message="String começa com 'sec'"
	;;
	* )
		Message="String não começa com 'sec'"
	;;
esac
echo $Message
		
