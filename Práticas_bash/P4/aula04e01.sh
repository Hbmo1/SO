#!/bin/bash
function imprime_msg()
{
	echo "A minha primeira funcao"
	return 0
}


function Date()
{
	date
	return 0
}


function User()
{
	whoami
	return 0
}


function PC()
{
	hostname
	return 0
}


function main()
{
	imprime_msg
	Date
	User
	PC
}
main
