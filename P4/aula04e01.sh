#!/bin/bash
function imprime_msg()
{
	echo "A minha primeira funcao"
	return 0
}
imprime_msg

function date()
{
	currentDate= 'date +"%Y-%m-%d %T"'	
	echo $(currentDate)
date
