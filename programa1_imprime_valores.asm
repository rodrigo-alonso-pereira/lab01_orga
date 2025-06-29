.data 
	mensaje: .asciiz "Loop finalizado"
	espacio: .asciiz ", "

.text
	main:	
		# Incialicacion de variables
		addi $t0, $zero, 0  # a = 0
		addi $t1, $zero, 1  # z = 1
		
		# while lopp
		while:
			beq $t1, 10, exit  # (z<>10) -> Mientra z sea distinto de 10, entra al loop <=> (z = 10) -> Si el valor es 10, va a etiqueta exit (sale del loop)
			add $t0, $t0, $t1  # a = a + z
			addi $t1, $t1, 1   # z = z + 1
			jal imprimirNumero
			j while  #Va a etiqueta while
		exit:
			li $v0, 4
			la $a0, mensaje
			syscall
		
		# Fin programa
		li $v0, 10
		syscall
	
	imprimirNumero:
		# Imprime numero
		li $v0, 1
		#add $a0, $t0, $zero  # Imprime registro $t0
		add $a0, $t1, $zero # Imprime registro $t1
		syscall
		
		# Imprime espacio
		li $v0, 4
		la $a0, espacio
		syscall
		
		jr $ra
		